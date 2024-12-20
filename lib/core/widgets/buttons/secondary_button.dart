import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class SecondaryButton extends StatelessWidget {
  final void Function()? onPressed;
  final String data;

  const SecondaryButton({super.key, this.onPressed, required this.data});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(Colors.transparent),
        padding: WidgetStateProperty.all(
          const EdgeInsets.symmetric(horizontal: 25, vertical: 8),
        ),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: const BorderSide(
              color: AppColors.primaryPinkColor,
              width: 2,
            ),
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
