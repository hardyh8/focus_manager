import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class CustomIconButton extends StatelessWidget {
  final void Function()? onPressed;
  final IconData icon;
  final double size;

  const CustomIconButton({
    super.key,
    this.onPressed,
    required this.icon,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(Colors.transparent),
        padding: WidgetStateProperty.all(
          const EdgeInsets.all(10),
        ),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
            side: const BorderSide(
              color: AppColors.primaryPinkColor,
              width: 2,
            ),
          ),
        ),
      ),
      onPressed: onPressed,
      icon: Icon(
        icon,
        size: size,
        color: AppColors.whiteColor,
      ),
    );
  }
}
