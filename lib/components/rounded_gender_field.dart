import 'package:flutter/material.dart';
import 'package:mediminder/components/text_field_container.dart';
import 'package:mediminder/constants.dart';

class RoundedGenderField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const RoundedGenderField({
    Key? key,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        onChanged: onChanged,
        decoration: const InputDecoration(
            hintText: "Gender",
            icon: Icon(
              Icons.face,
              color: kPrimaryColor,
            ),
            border: InputBorder.none),
      ),
    );
  }
}
