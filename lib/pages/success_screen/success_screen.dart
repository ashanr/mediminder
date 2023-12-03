import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mediminder/constants.dart';
import 'package:sizer/sizer.dart';

class SuccessScreen extends StatefulWidget {
  const SuccessScreen({super.key});

  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer(const Duration(milliseconds: 2500), () {
      Navigator.popUntil(context, ModalRoute.withName('/setreminders'));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.only(top: 35.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Reminder Added \nSuccessfully',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: kBarColor.withOpacity(.5),
                    fontSize: 24,
                  ),
            ),
            SizedBox(
              height: 3.h,
            ),
            SvgPicture.asset(
              'assets/images/checkmark.svg',
              height: 15.h,
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
