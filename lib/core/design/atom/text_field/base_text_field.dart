import 'package:flutter/material.dart';

import '../../decoration/base_color.dart';
import '../../style/base_text_style.dart';

class BaseTextFormField extends StatelessWidget {
  final String title;
  final String hintText;
  final String initialValue;
  final bool obscureText;
  final TextInputType inputType;
  final TextEditingController? controller;
  final Function(String text)? onTextChanged;

  const BaseTextFormField({
    Key? key,
    required this.title,
    required this.hintText,
    this.initialValue = '',
    this.obscureText = false,
    this.inputType = TextInputType.text,
    this.controller,
    this.onTextChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: BaseTextStyle.paragraph2Regular(
              color: BaseColor.neutral1000,
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          TextFormField(
            initialValue: initialValue,
            keyboardType: inputType,
            onChanged: onTextChanged,
            cursorColor: BaseColor.darkPrimary,
            obscureText: obscureText,
            controller: controller,
            style: BaseTextStyle.paragraph1Regular(
              color: BaseColor.neutral1000,
            ),
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: BaseTextStyle.paragraph1Regular(
                color: BaseColor.neutral500,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: const BorderSide(
                  color: BaseColor.primary,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: const BorderSide(
                  color: BaseColor.darkPrimary,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
