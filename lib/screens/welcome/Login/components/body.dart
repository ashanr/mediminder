import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mediminder/screens/welcome/components/background.dart';
// import 'package:mediminder/screens/welcome/Login/login_screen.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "LOGIN",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          SvgPicture.asset(
            "assets/icons/Mobile login-pana.svg",
            height: size.height * 0.5,
          )
        ],
      ),
    );
  }
}
