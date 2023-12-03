import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mediminder/constants.dart';
import 'package:mediminder/global_bloc.dart';
import 'package:mediminder/navigation/navigationbar.dart';
import 'package:mediminder/pages/medicine_details/medicine_details.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../models/medicine.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  // _DashboardPageState createState() => _DashboardPageState();
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 55,
        backgroundColor: kButtonPrimaryColor,
        title: Text('Reminders',
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                color: Colors.white,
                fontSize: 19.sp,
                fontWeight: FontWeight.w800)),
      ),
      body: Padding(
        padding: EdgeInsets.all(2.h),
        child: Column(
          children: [
            const TopContainer(),
            SizedBox(
              height: 1.h,
            ),
            //the widget take as per need
            const Flexible(
              child: BottomContainer(),
            ),
          ],
        ),
      ),
      floatingActionButton: InkResponse(
        onTap: () {
          //go to new entry page
          Navigator.pushNamed(
            context,
            '/newentry',
          );
        },
        child: SizedBox(
          width: 18.w,
          height: 9.h,
          child: Card(
            color: kButtonPrimaryColor,
            // shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(3.h)),
            child: Icon(
              Icons.add_outlined,
              color: kScaffoldColor,
              size: 50.sp,
            ),
          ),
        ),
      ),
      bottomNavigationBar: const NavigBar(),
    );
  }
}

class TopContainer extends StatelessWidget {
  const TopContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalBloc globalBloc = Provider.of<GlobalBloc>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(
            bottom: 1.h,
          ),
          child: Text(
            'Stay Stronger \nLive Healthier..',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(
            bottom: 1.h,
          ),
          child: Text(
            'Welcome to daily dose',
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        SizedBox(
          height: 2.h,
        ),
        //lets show number of saved medicines from shared preferences
        StreamBuilder<List<Medicine>>(
          stream: globalBloc.medicineList$,
          builder: (context, snapshot) {
            return Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(
                bottom: 1.h,
              ),
              child: Text(
                !snapshot.hasData ? '0' : snapshot.data!.length.toString(),
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(color: kButtonPrimaryColor),
              ),
            );
          },
        )
      ],
    );
  }
}

class BottomContainer extends StatelessWidget {
  const BottomContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //later we will use condition to show the data
    // return Center(
    //   child: Text(
    //     'No Any Medicine Added Yet..',
    //     textAlign: TextAlign.center,
    //     style: Theme.of(context).textTheme.headlineSmall,
    //   ),

    final GlobalBloc globalBloc = Provider.of<GlobalBloc>(context);

    return StreamBuilder(
      stream: globalBloc.medicineList$,
      builder: (context, snapshot) {
        //if no data is saved
        if (!snapshot.hasData) {
          return Container();
        } else if (snapshot.data!.isEmpty) {
          return Center(
            child: Text(
              'No reminders added yet',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          );
        } else {
          return GridView.builder(
            padding: EdgeInsets.only(top: 0.1.h),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return MedicineCard(medicine: snapshot.data![index]);
            },
          );
        }
      },
    );
  }
}

class MedicineCard extends StatelessWidget {
  const MedicineCard({Key? key, required this.medicine}) : super(key: key);
  final Medicine medicine;
  //for getting the current details of saved items

  //first we need to get the medicine type icon
  //lets make a function

  Hero makeIcon(double size) {
    //here is the bug, the capital word of the first letter
    if (medicine.medicineType == 'Bottle') {
      return Hero(
          tag: medicine.medicineName! + medicine.medicineType!,
          child: SvgPicture.asset(
            'assets/icons/medicine-bottle.svg',
            // ignore: deprecated_member_use
            color: Colors.white,
            height: 8.5.h,
          ));
    } else if (medicine.medicineType == 'Pill') {
      return Hero(
          tag: medicine.medicineName! + medicine.medicineType!,
          child: SvgPicture.asset(
            'assets/icons/pill.svg',
            // ignore: deprecated_member_use
            color: Colors.white,
            height: 8.5.h,
          ));
    } else if (medicine.medicineType == 'Syringe') {
      return Hero(
          tag: medicine.medicineName! + medicine.medicineType!,
          child: SvgPicture.asset(
            'assets/icons/syring.svg',
            // ignore: deprecated_member_use
            color: Colors.white,
            height: 8.5.h,
          ));
    } else if (medicine.medicineType == 'Tablet') {
      return Hero(
          tag: medicine.medicineName! + medicine.medicineType!,
          child: SvgPicture.asset(
            'assets/icons/pill.svg',
            // ignore: deprecated_member_use
            color: Colors.white,
            height: 8.5.h,
          ));
    }
    //incase of no medicine type icon selection
    return Hero(
        tag: medicine.medicineName! + medicine.medicineType!,
        child: Icon(
          Icons.error,
          size: size,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.white,
      splashColor: Colors.grey,
      onTap: () {
        //go to details activity with animation, later
        // Navigator.push(context,
        //     MaterialPageRoute(builder: (context) => MedicineDetails()));

        Navigator.of(context).push(
          PageRouteBuilder<void>(
            pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secondaryAnimation) {
              return AnimatedBuilder(
                animation: animation,
                builder: (context, Widget? child) {
                  return Opacity(
                    opacity: animation.value,
                    child: MedicineDetails(medicine),
                  );
                },
              );
            },
            transitionDuration: const Duration(
              milliseconds: 500,
            ),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.only(left: 2.w, right: 2.w, top: 1.h, bottom: 1.h),
        margin: EdgeInsets.all(1.h),
        decoration: BoxDecoration(
          color: kOtherColor,
          borderRadius: BorderRadius.circular(2.h),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // const Spacer(),
            //call the function here icon type
            //later we will the icon issue
            makeIcon(8.5.h),

            // const Spacer(),
            //hero tag animation
            Hero(
              tag: medicine.medicineName!,
              child: Text(medicine.medicineName!,
                  overflow: TextOverflow.fade,
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.labelLarge),
            ),
            SizedBox(height: 0.3.h),
            //time interval data with condition, later
            Text(
                medicine.interval == 1
                    ? "Every ${medicine.interval} hour"
                    : "Every ${medicine.interval} hour",
                overflow: TextOverflow.fade,
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.labelSmall),
          ],
        ),
      ),
    );
  }
}
