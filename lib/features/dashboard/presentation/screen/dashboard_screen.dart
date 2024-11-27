import 'package:flutter/material.dart';

import '../../../../core/constants/colors.dart';
import '../widgets/charts.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(26, 0, 26, 20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Focus Tasks',
                  style: TextStyle(
                    color: AppColors.whiteColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.add,
                    color: AppColors.whiteColor,
                    size: 40,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
            const Text(
              'Work',
              style: TextStyle(
                fontSize: 18,
                color: AppColors.whiteColor,
              ),
            ),
            const SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                color: AppColors.borderColor2,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: AppColors.backgroundColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Kickoff agenda',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: AppColors.whiteColor,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Remember to include Jean\'s notes',
                            style: TextStyle(
                              fontSize: 20,
                              color: AppColors.whiteColor,
                            ),
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                '9.45 AM - 11.45 AM',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: AppColors.whiteColor,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 15,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.borderColor,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Promodoro Challenge',
                          style: TextStyle(
                            fontSize: 20,
                            color: AppColors.whiteColor,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        SizedBox(height: 2),
                        Row(
                          children: [
                            Text(
                              '18/35',
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: AppColors.whiteColor,
                              ),
                            ),
                            SizedBox(width: 10),
                            Icon(
                              Icons.keyboard_double_arrow_up,
                              color: AppColors.upColor,
                              size: 40,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 30),
            const Text(
              'This week progress',
              style: TextStyle(
                fontSize: 16,
                color: AppColors.whiteColor,
              ),
            ),
            const Chart(),
          ],
        ),
      ),
    );
  }
}
