import 'package:flutter/material.dart';

import '../../decoration/base_color.dart';
import '../../style/base_text_style.dart';
import 'package:intl/intl.dart';

class DateTextField extends StatefulWidget {
  final String title;
  final String hintText;
  final DateTime? initialDate;
  final TextEditingController? controller;
  final Function(String text)? onTextChanged;

  const DateTextField({
    Key? key,
    required this.title,
    required this.hintText,
    this.initialDate,
    this.controller,
    this.onTextChanged,
  }) : super(key: key);

  @override
  State<DateTextField> createState() => _DateTextFieldState();
}

class _DateTextFieldState extends State<DateTextField> {
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: widget.initialDate ?? DateTime.now(),
      firstDate: DateTime(1500, 1),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: BaseColor.primary,
              onPrimary: BaseColor.neutral300,
              onSurface: BaseColor.darkPrimary,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: BaseColor.darkPrimary,
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null && picked != widget.initialDate) {
      String date = DateFormat('y/MM/dd').format(picked);
      if (widget.onTextChanged != null) {
        widget.onTextChanged!(date);
      }
      widget.controller?.text = date;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: BaseTextStyle.paragraph2Regular(
              color: BaseColor.neutral1000,
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          TextFormField(
            keyboardType: TextInputType.datetime,
            onChanged: widget.onTextChanged,
            cursorColor: BaseColor.darkPrimary,
            controller: widget.controller,
            style: BaseTextStyle.paragraph1Regular(
              color: BaseColor.neutral1000,
            ),
            decoration: InputDecoration(
              hintText: widget.hintText,
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
              suffixIcon: IconButton(
                icon: const Icon(
                  Icons.calendar_today_rounded,
                  color: BaseColor.primary,
                ),
                onPressed: () {
                  _selectDate(context);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
