import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:mediminder/components/rounded_age_field.dart';
import 'package:mediminder/components/rounded_gender_field.dart';
import 'package:mediminder/components/rounded_input_field.dart';
import 'package:mediminder/constants.dart';
import 'package:mediminder/screens/welcome/components/background.dart';
import 'package:sizer/sizer.dart';

class WelcomeBody extends StatelessWidget {
  const WelcomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Welcome to Mediminder",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          SvgPicture.asset(
            "assets/icons/Prototyping process-pana.svg",
            height: 30.h,
            // "assets/icons/syring.svg",
            // height: size.height * 0.2,
          ),
          RoundedInputField(
            hintText: "Your Name",
            onChanged: (value) {},
          ),
          RoundedAgeField(
            onChanged: (value) {},
          ),
          RoundedGenderField(
            onChanged: (value) {},
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/dashbordpage');
            },
            style: ElevatedButton.styleFrom(
                shadowColor: kPrimaryLightColor,
                backgroundColor: kButtonPrimaryColor,
                minimumSize: const Size(350, 50),
                // shape: RoundedRectangleBorder(
                //     borderRadius: BorderRadius.circular(20)),
                shape: const StadiumBorder()),
            child: Text(
              "LOGIN",
              style: Theme.of(context).textTheme.labelSmall!.copyWith(
                  color: Colors.white, fontSize: 20, letterSpacing: 2),
            ),
            //
          ),
        ],
      ),
    );
  }
}
