import 'package:flutter/material.dart';
import 'package:mediminder/components/text_field_container.dart';
import 'package:mediminder/constants.dart';

class RoundedAgeField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const RoundedAgeField({
    Key? key,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        onChanged: onChanged,
        decoration: const InputDecoration(
            hintText: "Your Age",
            icon: Icon(
              Icons.calendar_month,
              color: kPrimaryColor,
            ),
            border: InputBorder.none),
      ),
    );
  }
}
