import 'package:flutter/material.dart';
import 'package:mediminder/constants.dart';
import 'package:mediminder/navigation/navigationbar.dart';
import 'package:sizer/sizer.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  // _DashboardPageState createState() => _DashboardPageState();
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 70,
        // backgroundColor: kButtonColor.withOpacity(.8),
        backgroundColor: kButtonPrimaryColor.withOpacity(0.6),

        title: Text(
          'Mediminder',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
              color: Colors.white,
              fontSize: 26.sp,
              fontWeight: FontWeight.w900,
              letterSpacing: 1),
        ),
      ),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // const SizedBox(height: 50.0),
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            child: Container(
              height: 240,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/mainhome.jpg"),
                    fit: BoxFit.fill),
              ),
              child: Container(
                padding: const EdgeInsets.only(left: 80, bottom: 100),
                // color: kButtonColor.withOpacity(.8),
                color: kButtonPrimaryColor.withOpacity(0.6),
                // child: Row(
                //   crossAxisAlignment: CrossAxisAlignment.center,
                //   children: [
                //     RichText(
                //         text: const TextSpan(
                //       text: 'Mediminder',
                //       style: TextStyle(
                //         letterSpacing: 2,
                //         fontSize: 42,
                //         fontWeight: FontWeight.w900,
                //         color: Colors.white,
                //       ),
                //     ))
                //   ],
                // ),
              ),
            ),
          ),

          Positioned(
            top: 190,
            child: Container(
              height: 130,
              width: MediaQuery.of(context).size.width - 40,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: kBarColor.withOpacity(.5),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                        color: kBarColor.withOpacity(0.12),
                        blurRadius: 5,
                        spreadRadius: 3)
                  ]),
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/checkhealth');
                },
                style: TextButton.styleFrom(
                    // backgroundColor: kButtonColor,
                    backgroundColor: kButtonPrimaryColor,
                    foregroundColor: kBarColor,
                    side: const BorderSide(
                      color: kButtonPrimaryColor,
                      width: 0,
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15))),
                child: Text(
                  'Check Health Status',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.w900),
                ),
              ),
            ),
          ),

          Positioned(
            top: 340,
            child: Container(
              height: 130,
              width: MediaQuery.of(context).size.width - 40,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                        color: kBarColor.withOpacity(0.12),
                        blurRadius: 5,
                        spreadRadius: 3)
                  ]),
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/setreminders');
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
                  'Medicine Reminders',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.w900),
                ),
              ),
            ),
          ),

          Positioned(
            top: 490,
            child: Container(
              height: 130,
              width: MediaQuery.of(context).size.width - 40,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                        color: kBarColor.withOpacity(0.12),
                        blurRadius: 5,
                        spreadRadius: 3)
                  ]),
              child: TextButton(
                onPressed: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => const Diet2Plans()));
                  Navigator.pushNamed(context, '/dietplans');
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
                  'Manage Diet Plans',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.w900),
                ),
              ),
            ),
          )
        ],
      ),

      //Navigation bar
      // bottomNavigationBar: Padding(
      //   padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
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
