import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/constants/colors.dart';

class TimerScreen extends StatelessWidget {
  const TimerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Let\'s focus for',
            style: TextStyle(
              color: AppColors.whiteColor,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 50),
          Stack(
            alignment: Alignment.center,
            children: [
              const SizedBox(
                height: 250,
                width: 250,
                child: CircularProgressIndicator(
                  strokeWidth: 18,
                  strokeCap: StrokeCap.round,
                  backgroundColor: AppColors.chartBgColor,
                  value: 0.5,
                  color: AppColors.primaryPinkColor,
                ),
              ),
              Text(
                '9:54',
                style: GoogleFonts.jost(
                  color: AppColors.whiteColor,
                  fontSize: 65,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: const Text('PAUSE'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
