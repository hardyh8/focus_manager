import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class TimePickerField extends StatelessWidget {
  const TimePickerField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.onIconPressed,
  });

  final TextEditingController controller;
  final String hintText;
  final void Function()? onIconPressed;

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(color: AppColors.whiteColor, fontSize: 14);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          hintText,
          style: const TextStyle(
            color: AppColors.whiteColor,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 5),
        TextField(
          controller: controller,
          style: textStyle,
          textAlign: TextAlign.left,
          decoration: InputDecoration(
            hintText: hintText,
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.borderColor)),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.primaryPinkColor)),
            hintStyle: textStyle,
            labelStyle: textStyle,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            suffix: IconButton(
              onPressed: onIconPressed,
              padding: EdgeInsets.zero,
              icon: const Icon(
                Icons.timer_outlined,
                color: AppColors.whiteColor,
                size: 25,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
