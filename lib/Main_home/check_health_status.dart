import 'package:flutter/material.dart';
import 'package:mediminder/Main_home/bmi.dart';
import 'package:mediminder/Main_home/diabetes.dart';
import 'package:mediminder/Main_home/presure.dart';
import 'package:mediminder/constants.dart';
import 'package:mediminder/navigation/navigationbar.dart';
import 'package:sizer/sizer.dart';

class CheckHealthStatus extends StatefulWidget {
  const CheckHealthStatus({super.key});

  @override
  // _CheckHealthStatusState createState() => _CheckHealthStatusState();
  State<CheckHealthStatus> createState() => _CheckHealthStatusState();
}

class _CheckHealthStatusState extends State<CheckHealthStatus> {
  // int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 55,
        backgroundColor: kButtonPrimaryColor,
        title: Text('Check Health Status',
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                color: Colors.white,
                fontSize: 19.sp,
                fontWeight: FontWeight.w800)),
      ),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // const SizedBox(height: 50.0),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              height: 340,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/Doctor-pana.png"),
                    fit: BoxFit.fill),
              ),
              child: Container(
                padding: const EdgeInsets.only(left: 30, bottom: 30),
                color: kButtonPrimaryColor.withOpacity(.6),
              ),
            ),
          ),

          Positioned(
            top: 40,
            child: Container(
              height: 70,
              width: MediaQuery.of(context).size.width - 40,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: kBarColor.withOpacity(.5),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                        color: kButtonPrimaryColor.withOpacity(0.3),
                        blurRadius: 5,
                        spreadRadius: 3)
                  ]),
              child: TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Diabety()));
                },
                style: TextButton.styleFrom(
                    backgroundColor: kButtonPrimaryColor,
                    foregroundColor: kBarColor,
                    side: const BorderSide(
                      color: kButtonPrimaryColor,
                      width: 0,
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15))),
                child: Text(
                  'Diabetes',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 1),
                ),
              ),
            ),
          ),

          Positioned(
            top: 160,
            child: Container(
              height: 70,
              width: MediaQuery.of(context).size.width - 40,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                        color: kButtonPrimaryColor.withOpacity(.3),
                        blurRadius: 5,
                        spreadRadius: 3)
                  ]),
              child: TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Presure()));
                },
                style: TextButton.styleFrom(
                    backgroundColor: kButtonPrimaryColor,
                    foregroundColor: kBarColor,
                    side: const BorderSide(
                      color: kButtonPrimaryColor,
                      width: 0,
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15))),
                child: Text(
                  'Pressure',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 1),
                ),
              ),
            ),
          ),

          Positioned(
            top: 280,
            child: Container(
              height: 70,
              width: MediaQuery.of(context).size.width - 40,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: kButtonColor,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                        color: kButtonPrimaryColor.withOpacity(0.3),
                        blurRadius: 5,
                        spreadRadius: 3)
                  ]),
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const BmiCalculator()));
                },
                style: TextButton.styleFrom(
                    backgroundColor: kButtonPrimaryColor,
                    foregroundColor: kBarColor,
                    side: const BorderSide(
                      color: kButtonPrimaryColor,
                      width: 0,
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15))),
                child: Text(
                  'BMI Calculator',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 1),
                ),
              ),
            ),
          )
        ],
      ),
      // bottomNavigationBar: SizedBox(
      //   height: 70,
      //   child: BottomNavigationBar(
      //     backgroundColor: kBarColor.withOpacity(.5),

      //     // selectedItemColor: kBarColor,
      //     // unselectedItemColor: kTextColor,
      //     currentIndex: _currentIndex,
      //     onTap: (index) {
      //       setState(() {
      //         _currentIndex = index;
      //       });
      //     },
      //     items: const [
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.home),
      //         label: 'Home',
      //       ),
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.event),
      //         label: 'Events',
      //       ),
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.settings),
      //         label: 'Settings',
      //       ),
      //     ],
      //   ),
      // ),

      bottomNavigationBar: const NavigBar(),
    );
  }
}
