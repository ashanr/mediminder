import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mediminder/common/convert_time.dart';
import 'package:mediminder/constants.dart';
import 'package:mediminder/global_bloc.dart';
import 'package:mediminder/models/errors.dart';
import 'package:mediminder/models/medicine.dart';
import 'package:mediminder/navigation/navigationbar.dart';
import 'package:mediminder/pages/home_page.dart';
import 'package:mediminder/pages/new_entry/new_entry_bloc.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:mediminder/models/medicine_type.dart';

class NewEntryPage extends StatefulWidget {
  const NewEntryPage({Key? key}) : super(key: key);

  @override
  State<NewEntryPage> createState() => _NewEntryPageState();
}

class _NewEntryPageState extends State<NewEntryPage> {
  late TextEditingController nameController;
  late TextEditingController dosageController;
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  late NewEntryBloc _newEntryBloc;
  late GlobalKey<ScaffoldState> _scaffoldKey;

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    dosageController.dispose();
    _newEntryBloc.dispose();
  }

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    dosageController = TextEditingController();
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    _newEntryBloc = NewEntryBloc();
    _scaffoldKey = GlobalKey<ScaffoldState>();
    initializeNotifications();
    initializeErrorListen();
  }

  @override
  Widget build(BuildContext context) {
    final GlobalBloc globalBloc = Provider.of<GlobalBloc>(context);
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 50,
        backgroundColor: kButtonPrimaryColor,
        title: Text('Add New Reminder',
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                color: Colors.white,
                fontSize: 19.sp,
                fontWeight: FontWeight.w800)),
      ),
      body: Provider<NewEntryBloc>.value(
        value: _newEntryBloc,
        child: Padding(
          padding: EdgeInsets.only(top: 0.h, left: 2.h, right: 2.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const PanelTitle(
                title: 'Medicine Name',
                isRequired: true,
              ),
              SizedBox(
                height: 50,
                child: TextFormField(
                  maxLength: 20,
                  controller: nameController,
                  textCapitalization: TextCapitalization.words,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                  ),
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(color: kOtherColor),
                ),
              ),
              const PanelTitle(
                title: 'Dosage in mg',
                isRequired: false,
              ),
              SizedBox(
                height: 50,
                child: TextFormField(
                  maxLength: 12,
                  controller: dosageController,
                  textCapitalization: TextCapitalization.words,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                  ),
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(color: kOtherColor),
                ),
              ),
              SizedBox(
                height: 0.h,
              ),
              const PanelTitle(title: 'Medicine Type', isRequired: false),
              Padding(
                padding: EdgeInsets.all(0.h),
                child: StreamBuilder<MedicineType>(
                  //new entry block
                  stream: _newEntryBloc.selectedMedicineType,
                  builder: (context, snapshot) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //not yet clickable?
                        MedicineTypeColumn(
                          medicineType: MedicineType.Bottle,
                          name: 'Bottle',
                          iconValue: 'assets/icons/medicine-bottle.svg',
                          isSelected: snapshot.data == MedicineType.Bottle
                              ? true
                              : false,
                        ),
                        MedicineTypeColumn(
                          medicineType: MedicineType.Pill,
                          name: 'Pill',
                          iconValue: 'assets/icons/pill.svg',
                          isSelected:
                              snapshot.data == MedicineType.Pill ? true : false,
                        ),
                        MedicineTypeColumn(
                          medicineType: MedicineType.Syringe,
                          name: 'Syringe',
                          iconValue: 'assets/icons/syring.svg',
                          isSelected: snapshot.data == MedicineType.Syringe
                              ? true
                              : false,
                        ),
                        MedicineTypeColumn(
                          medicineType: MedicineType.Tablet,
                          name: 'Tablet',
                          iconValue: 'assets/icons/medicine-bottle.svg',
                          isSelected: snapshot.data == MedicineType.Tablet
                              ? true
                              : false,
                        ),
                      ],
                    );
                  },
                ),
              ),
              const PanelTitle(title: 'Interval Selection', isRequired: true),
              const IntervalSelection(),
              const PanelTitle(title: 'Starting Time', isRequired: true),
              const SelectTime(),
              SizedBox(
                height: 2.h,
              ),
              Padding(
                padding: EdgeInsets.only(right: 0.w, left: 0.w),
                child: SizedBox(
                  width: double.infinity,
                  height: 6.h,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: kButtonPrimaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                    ),
                    child: Center(
                      child: Text(
                        "Confirm",
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium!
                            .copyWith(
                                fontSize: 16.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.w800),
                      ),
                    ),
                    onPressed: () {
                      //add medicine
                      //some validations
                      //got to success screen
                      String? medicineName;
                      int? dosage;

                      //medicineName
                      if (nameController.text == "") {
                        _newEntryBloc.submitError(EntryError.nameNull);
                        return;
                      }
                      if (nameController.text != "") {
                        medicineName = nameController.text;
                      }
                      //dosage
                      if (dosageController.text == "") {
                        dosage = 0;
                      }
                      if (dosageController.text != "") {
                        dosage = int.parse(dosageController.text);
                      }

                      for (var medicine in globalBloc.medicineList$!.value) {
                        if (medicineName == medicine.medicineName) {
                          _newEntryBloc.submitError(EntryError.nameDuplicate);
                          return;
                        }
                      }
                      if (_newEntryBloc.selectIntervals!.value == 0) {
                        _newEntryBloc.submitError(EntryError.interval);
                        return;
                      }
                      if (_newEntryBloc.selectedTimeOfDay$!.value == 'None') {
                        _newEntryBloc.submitError(EntryError.startTime);
                        return;
                      }

                      String medicineType = _newEntryBloc
                          .selectedMedicineType!.value
                          .toString()
                          .substring(13);

                      int interval = _newEntryBloc.selectIntervals!.value;
                      String startTime =
                          _newEntryBloc.selectedTimeOfDay$!.value;

                      List<int> intIDs =
                          makeIDs(24 / _newEntryBloc.selectIntervals!.value);
                      List<String> notificationIDs =
                          intIDs.map((i) => i.toString()).toList();

                      Medicine newEntryMedicine = Medicine(
                          notificationIDs: notificationIDs,
                          medicineName: medicineName,
                          dosage: dosage,
                          medicineType: medicineType,
                          interval: interval,
                          startTime: startTime);

                      //update medicineList via globalBloc
                      globalBloc.updateMedicineList(newEntryMedicine);

                      //scheduled notification
                      scheduleNotification(newEntryMedicine);

                      //go to success screen
                      Navigator.pushNamed(context, '/success');
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: const NavigBar(),
    );
  }

  void initializeErrorListen() {
    _newEntryBloc.errorState$!.listen((EntryError error) {
      switch (error) {
        case EntryError.nameNull:
          displayError("Please enter the medicine's name");
          break;

        case EntryError.nameDuplicate:
          displayError("Medicine name already exixts");
          break;

        case EntryError.dosage:
          displayError("Please enter the dosage required");
          break;

        case EntryError.interval:
          displayError("Please select the reminder's interval");
          break;

        case EntryError.startTime:
          displayError("Please select the reminder's start time");
          break;

        default:
      }
    });
  }

  void displayError(String error) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: kOtherColor,
        content: Text(error),
        duration: const Duration(milliseconds: 2000),
      ),
    );
  }

  List<int> makeIDs(double n) {
    var rng = Random();
    List<int> ids = [];
    for (int i = 0; i < n; i++) {
      ids.add(rng.nextInt(100000000));
    }
    return ids;
  }

  initializeNotifications() async {
    var initializationSettingsAndroid =
        const AndroidInitializationSettings('@mipmap/launcher_icon');

    var initializationSettingsIOS = const DarwinInitializationSettings();
    var initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOS);

    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  Future onSelectionNotification(String? payload) async {
    if (payload != null) {
      debugPrint('notification payload: $payload');
    }
    await Navigator.push(
        context, MaterialPageRoute(builder: (context) => const HomePage()));
  }

  Future<void> scheduleNotification(Medicine medicine) async {
    var hour = int.parse(medicine.startTime![0] + medicine.startTime![1]);
    var ogValue = hour;
    // var minute = int.parse(medicine.startTime![2] + medicine.startTime![3]);

    var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
      'RepeatDailyAtTime channel id',
      'RepeatDailyAtTime channel name',
      importance: Importance.max,
      ledColor: kOtherColor,
      ledOffMs: 1000,
      ledOnMs: 1000,
      enableLights: true,
    );

    var iOSPlatformChannelSpecifics = const DarwinNotificationDetails();

    var platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: iOSPlatformChannelSpecifics);

    for (int i = 0; i < (24 / medicine.interval!).floor(); i++) {
      if (hour + (medicine.interval! * i) > 23) {
        hour = hour + (medicine.interval! * i) - 24;
      } else {
        hour = hour + (medicine.interval! * i);
      }
      await flutterLocalNotificationsPlugin.show(
          int.parse(medicine.notificationIDs![i]),
          'Reminder: ${medicine.medicineName}',
          medicine.medicineType.toString() != MedicineType.None.toString()
              ? 'It is time to take your ${medicine.medicineType!.toLowerCase()}, according to schedule'
              : 'It is time to take your medicine to according to schedule',
          // Time(hour, minute, 0),
          platformChannelSpecifics);
      hour = ogValue;
    }
  }
}

class SelectTime extends StatefulWidget {
  const SelectTime({super.key});

  @override
  State<SelectTime> createState() => _SelectTimeState();
}

class _SelectTimeState extends State<SelectTime> {
  TimeOfDay _time = const TimeOfDay(hour: 0, minute: 00);
  bool _clicked = false;

  Future<TimeOfDay> _selectTime() async {
    final NewEntryBloc newEntryBloc =
        Provider.of<NewEntryBloc>(context, listen: false);

    final TimeOfDay? picked =
        await showTimePicker(context: context, initialTime: _time);

    if (picked != null && picked != _time) {
      setState(() {
        _time = picked;
        _clicked = true;

        //update via provider
        newEntryBloc.updateTime(convertTime(_time.hour.toString()) +
            convertTime(_time.minute.toString()));
      });
    }
    return picked!;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100.w,
      height: 6.h,
      child: Padding(
        padding: EdgeInsets.only(top: 0.h),
        child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: kButtonPrimaryColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          ),
          onPressed: () {
            _selectTime();
          },
          child: Center(
            child: Text(
              _clicked == false
                  ? "Select Time"
                  : "${convertTime(_time.hour.toString())}: ${convertTime(_time.minute.toString())}",
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  fontSize: 16.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.w800),
            ),
          ),
        ),
      ),
    );
  }
}

class IntervalSelection extends StatefulWidget {
  const IntervalSelection({super.key});

  @override
  State<IntervalSelection> createState() => _IntervalSelectionState();
}

class _IntervalSelectionState extends State<IntervalSelection> {
  final _intervals = [6, 8, 12, 24];
  var _selected = 0;

  @override
  Widget build(BuildContext context) {
    final NewEntryBloc newEntryBloc = Provider.of<NewEntryBloc>(context);
    return Padding(
      padding: EdgeInsets.only(top: 0.h, left: 2.h, right: 2.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Remind me every',
            style: Theme.of(context).textTheme.labelMedium,
          ),
          DropdownButton(
            iconEnabledColor: kOtherColor,
            dropdownColor: kScaffoldColor,
            itemHeight: 6.h,
            hint: _selected == 0
                ? Text(
                    'Select an interval',
                    style: Theme.of(context).textTheme.bodySmall,
                  )
                : null,
            elevation: 4,
            value: _selected == 0 ? null : _selected,
            items: _intervals.map((int value) {
              return DropdownMenuItem<int>(
                value: value,
                child: Text(
                  value.toString(),
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: kOtherColor,
                      ),
                ),
              );
            }).toList(),
            onChanged: (newVal) {
              setState(
                () {
                  _selected = newVal!;
                  newEntryBloc.updateInterval(newVal);
                },
              );
            },
          ),
          Text(
            _selected == 1 ? " hour" : " hours",
            style: Theme.of(context).textTheme.labelMedium,
          ),
        ],
      ),
    );
  }
}

class MedicineTypeColumn extends StatelessWidget {
  const MedicineTypeColumn(
      {Key? key,
      required this.medicineType,
      required this.name,
      required this.iconValue,
      required this.isSelected})
      : super(key: key);
  final MedicineType medicineType;
  final String name;
  final String iconValue;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final NewEntryBloc newEntryBloc = Provider.of<NewEntryBloc>(context);
    return GestureDetector(
      onTap: () {
        //select medicine type
        //let's create a new block for selecting and adding new entry
        newEntryBloc.updateSelectedMedicine(medicineType);
      },
      child: Column(
        children: [
          Container(
            width: 20.w,
            height: 9.h,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3.h),
              // color: isSelected
              //     ? Colors.white
              //     : const Color.fromARGB(146, 173, 77, 125),
              color: isSelected
                  ? const Color.fromARGB(146, 173, 77, 125)
                  : Colors.white,
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(
                  iconValue,
                  height: 7.h,
                  // ignore: deprecated_member_use
                  color: isSelected
                      ? Colors.white
                      : const Color.fromARGB(146, 173, 77, 125),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 18.w,
              height: 4.h,
              decoration: BoxDecoration(
                color: isSelected
                    ? const Color.fromARGB(146, 173, 77, 125)
                    : Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(
                  name,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: isSelected
                          ? kScaffoldColor
                          : const Color.fromARGB(146, 173, 77, 125)),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class PanelTitle extends StatelessWidget {
  const PanelTitle({Key? key, required this.title, required this.isRequired})
      : super(key: key);
  final String title;
  final bool isRequired;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(2.h),
      child: Text.rich(
        TextSpan(
          children: <TextSpan>[
            TextSpan(
              text: title,
              style: Theme.of(context).textTheme.labelMedium,
            ),
            TextSpan(
              text: isRequired ? " *" : "",
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: kOtherColor,
                  ),
            )
          ],
        ),
      ),
    );
  }
}
