import 'package:flutter/material.dart';

import '../../core/constants/colors.dart';
import '../calendar/presentation/screen/calender_view.dart';
import '../dashboard/presentation/screen/dashboard_screen.dart';
import '../timer/presentation/screen/timer_screen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Widget> bottomNavWidgets = [
    const DashboardScreen(),
    const TimerScreen(),
    const CalendarScreen(),
  ];
  List<BottomNavigationBarItem> items = List.empty(growable: true);
  int selectedItem = 0;
  final List<IconData> icons = [
    Icons.dashboard,
    Icons.timer_outlined,
    Icons.calendar_today_outlined,
    Icons.analytics_outlined,
  ];

  @override
  Widget build(BuildContext context) {
    items = List.empty(growable: true);
    for (var i = 0; i < bottomNavWidgets.length; i++) {
      items.add(
        BottomNavigationBarItem(
          label: '',
          icon: Icon(
            icons[i],
            color: selectedItem == i
                ? AppColors.primaryPinkColor
                : AppColors.whiteColor,
          ),
        ),
      );
    }
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      bottomNavigationBar: BottomNavigationBar(
        useLegacyColorScheme: false,
        backgroundColor: AppColors.backgroundColor,
        items: items,
        onTap: (value) {
          if (value != selectedItem) {
            setState(() {
              selectedItem = value;
            });
          }
        },
      ),
      body: SafeArea(
        child: bottomNavWidgets[selectedItem],
      ),
    );
  }
}
