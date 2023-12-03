import 'package:flutter/material.dart';
import 'package:mediminder/constants.dart';

class TextFieldContainer extends StatelessWidget {
  final Widget child;
  const TextFieldContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 3),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
      width: size.width * 0.8,
      height: size.height * 0.06,
      decoration: BoxDecoration(
        color: kButtonColor,
        borderRadius: BorderRadius.circular(29),
      ),
      child: child,
    );
  }
}
