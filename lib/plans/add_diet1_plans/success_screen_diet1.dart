import 'dart:async';
// import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mediminder/constants.dart';
import 'package:sizer/sizer.dart';

class Diet2SuccessScreen extends StatefulWidget {
  const Diet2SuccessScreen({super.key});

  @override
  State<Diet2SuccessScreen> createState() => _Diet2SuccessScreenState();
}

class _Diet2SuccessScreenState extends State<Diet2SuccessScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 2500), () {
      Navigator.popUntil(context, ModalRoute.withName('/dietplans'));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.only(top: 35.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Text(
            "Diet Plan Added \nSuccessfully",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: kBarColor.withOpacity(.5),
                  fontSize: 24,
                ),
          ),
          SizedBox(height: 3.h),
          SvgPicture.asset(
            'assets/images/checkmark.svg',
            height: 15.h,
          ),
        ]),
      ),
    );
  }
}
