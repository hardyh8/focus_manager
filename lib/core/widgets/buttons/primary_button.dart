import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class PrimaryButton extends StatelessWidget {
  final void Function()? onPressed;
  final String data;

  const PrimaryButton({super.key, this.onPressed, required this.data});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(AppColors.primaryPinkColor),
        padding: WidgetStateProperty.all(
          const EdgeInsets.symmetric(horizontal: 25, vertical: 8),
        ),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide.none,
          ),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        data,
        style: const TextStyle(
          color: AppColors.whiteColor,
          fontSize: 14,
        ),
      ),
    );
  }
}
