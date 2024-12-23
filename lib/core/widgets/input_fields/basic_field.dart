import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class BasicField extends StatelessWidget {
  const BasicField({
    super.key,
    required this.controller,
    required this.hintText,
  });
  final TextEditingController controller;
  final String hintText;

  @override
  Widget build(BuildContext context) {
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
          style: const TextStyle(
            color: AppColors.whiteColor,
          ),
          decoration: InputDecoration(
            hintText: hintText,
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.borderColor)),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.primaryPinkColor)),
          ),
        ),
      ],
    );
  }
}
