import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mediminder/constants.dart';
import 'package:mediminder/global_bloc.dart';
import 'package:mediminder/models/medicine.dart';
import 'package:mediminder/navigation/navigationbar.dart';

import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class MedicineDetails extends StatefulWidget {
  const MedicineDetails(this.medicine, {Key? key}) : super(key: key);
  final Medicine medicine;

  @override
  State<MedicineDetails> createState() => _MedicineDetailsState();
}

class _MedicineDetailsState extends State<MedicineDetails> {
  @override
  Widget build(BuildContext context) {
    final GlobalBloc globalBloc = Provider.of<GlobalBloc>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 55,
        backgroundColor: kButtonPrimaryColor,
        title: Text("Medicine Details",
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                color: Colors.white,
                fontSize: 19.sp,
                fontWeight: FontWeight.w800)),
      ),
      body: Padding(
        padding: EdgeInsets.all(2.h),
        child: Column(
          children: [
            MainSelection(medicine: widget.medicine),
            ExtendedSelection(medicine: widget.medicine),
            SizedBox(
              height: 11.h,
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 6.h,
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: kButtonPrimaryColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                ),
                onPressed: () {
                  //open alert dialog box, "global block, later
                  openAlertBox(context, globalBloc);
                },
                child: Text(
                  'Delete',
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      fontSize: 16.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.w800),
                ),
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
          ],
        ),
      ),
      bottomNavigationBar: const NavigBar(),
    );
  }

  //delete medicine from memory

  openAlertBox(BuildContext context, GlobalBloc globalBloc) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: kScaffoldColor,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              bottomRight: Radius.circular(20.0),
            ),
          ),
          contentPadding: EdgeInsets.only(top: 1.h),
          title: Text(
            'Delete This Reminder?',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'Cancel',
                style: Theme.of(context).textTheme.labelSmall!.copyWith(
                      color: kOtherColor,
                      fontSize: 12.sp,
                    ),
              ),
            ),
            TextButton(
              onPressed: () {
                //global block to delete medicine
                globalBloc.removeMedicine(widget.medicine);
                Navigator.popUntil(
                    context, ModalRoute.withName('/setreminders'));
              },
              child: Text(
                'OK',
                style: Theme.of(context).textTheme.labelSmall!.copyWith(
                      color: kOtherColor,
                      fontSize: 12.sp,
                    ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class MainSelection extends StatelessWidget {
  const MainSelection({Key? key, this.medicine}) : super(key: key);
  final Medicine? medicine;
  Hero makeIcon(double size) {
    if (medicine!.medicineType == 'Bottle') {
      return Hero(
          tag: medicine!.medicineName! + medicine!.medicineType!,
          child: SvgPicture.asset(
            'assets/icons/medicine-bottle.svg',
            // ignore: deprecated_member_use
            color: kOtherColor,
            height: 10.h,
          ));
    } else if (medicine!.medicineType == 'Pill') {
      return Hero(
          tag: medicine!.medicineName! + medicine!.medicineType!,
          child: SvgPicture.asset(
            'assets/icons/pill.svg',
            // ignore: deprecated_member_use
            color: kOtherColor,
            height: 10.h,
          ));
    } else if (medicine!.medicineType == 'Syringe') {
      return Hero(
          tag: medicine!.medicineName! + medicine!.medicineType!,
          child: SvgPicture.asset(
            'assets/icons/syring.svg',
            // ignore: deprecated_member_use
            color: kOtherColor,
            height: 10.h,
          ));
    } else if (medicine!.medicineType == 'Tablet') {
      return Hero(
          tag: medicine!.medicineName! + medicine!.medicineType!,
          child: SvgPicture.asset(
            'assets/icons/pill.svg',
            // ignore: deprecated_member_use
            color: kOtherColor,
            height: 10.h,
          ));
    }
    //incase of no medicine type icon selection
    return Hero(
        tag: medicine!.medicineName! + medicine!.medicineType!,
        child: Icon(
          Icons.error,
          size: size,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        //lets try another one
        // okz same here, the same problem,later i will solve that
        makeIcon(10.h),

        SizedBox(
          width: 1.5.w,
        ),
        Column(
          children: [
            Hero(
              tag: medicine!.medicineName!,
              child: Material(
                color: Colors.transparent,
                child: MainInfoTab(
                    fieldTitle: 'Medicine Name',
                    fieldInfo: medicine!.medicineName!),
              ),
            ),
            MainInfoTab(
                fieldTitle: 'Dosage',
                fieldInfo: medicine!.dosage == 0
                    ? 'Not specified'
                    : "${medicine!.dosage} mg"),
          ],
        )
      ],
    );
  }
}

class MainInfoTab extends StatelessWidget {
  const MainInfoTab(
      {super.key, required this.fieldTitle, required this.fieldInfo});
  final String fieldTitle;
  final String fieldInfo;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40.w,
      height: 10.h,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              fieldTitle,
              style: Theme.of(context).textTheme.titleSmall,
            ),
            SizedBox(
              height: 0.3.h,
            ),
            Text(
              fieldInfo,
              style: Theme.of(context).textTheme.bodyLarge,
            )
          ],
        ),
      ),
    );
  }
}

class ExtendedSelection extends StatelessWidget {
  const ExtendedSelection({Key? key, this.medicine}) : super(key: key);
  final Medicine? medicine;

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        ExtendedInfoTab(
          fieldTitle: 'Medicine Type',
          fieldInfo: medicine!.medicineType! == 'None'
              ? 'Not specified'
              : medicine!.medicineType!,
        ),
        ExtendedInfoTab(
          fieldTitle: 'Dose Interval',
          fieldInfo:
              'Every ${medicine!.interval} hours   | ${medicine!.interval == 24 ? "One time a day" : "${(24 / medicine!.interval!).floor()} times a day"}',
        ),
        ExtendedInfoTab(
          fieldTitle: 'Start Time',
          fieldInfo:
              '${medicine!.startTime![0]}${medicine!.startTime![1]}:${medicine!.startTime![2]}${medicine!.startTime![3]}',
        ),
      ],
    );
  }
}

class ExtendedInfoTab extends StatelessWidget {
  const ExtendedInfoTab(
      {super.key, required this.fieldTitle, required this.fieldInfo});
  final String fieldTitle;
  final String fieldInfo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 1.h),
            child: Text(
              fieldTitle,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: kTextColor,
                  ),
            ),
          ),
          Text(
            fieldInfo,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: kOtherColor,
                ),
          ),
        ],
      ),
    );
  }
}
