import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:mediminder/constants.dart';

class NavigBar extends StatefulWidget {
  const NavigBar({super.key});

  @override
  State<NavigBar> createState() => _NavigBarState();
}

class _NavigBarState extends State<NavigBar> {
  bool status = false;
  int index = 0;
  // bool isselected = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: kButtonPrimaryColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
        child: GNav(
          // backgroundColor: kButtonPrimaryColor.withOpacity(0.7),
          color: Colors.white,
          // activeColor: kButtonPrimaryColor,
          // tabBackgroundColor: kPrimaryLightColor,
          gap: 8,
          padding: const EdgeInsets.all(10),
          tabs: [
            GButton(
              icon: Icons.home_outlined,
              text: '',
              onPressed: () {
                setState(() {
                  index = 1;
                });
                pagechange();
              },
            ),
            GButton(
              icon: Icons.notifications_outlined,
              // text: 'Reminders',

              onPressed: () {
                setState(() {
                  index = 2;
                });
                pagechange();
              },
            ),
            GButton(
              icon: Icons.bookmark_outline,
              text: 'Saved',
              onPressed: () {
                setState(() {
                  index = 3;
                });
                pagechange();
              },
            ),
          ],
        ),
      ),
    );
  }

  pagechange() {
    if (index == 1) {
      Navigator.pushNamed(context, '/dashbordpage');
    }
    if (index == 2) {
      Navigator.pushNamed(context, '/setreminders');
    }
    if (index == 3) {
      Navigator.pushNamed(context, '/dietplans');
    }
    // if (index == 4) {
    //   Navigator.pushNamed(context, '/setreminders');
    // }
  }
}
