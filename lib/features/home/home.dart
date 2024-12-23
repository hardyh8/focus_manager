import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../core/constants/colors.dart';
import '../../core/router/routes.dart';
import '../calendar/domain/schedule_bloc/schedule_bloc.dart';

class Home extends StatefulWidget {
  const Home({super.key, required this.navigationShell});
  final StatefulNavigationShell navigationShell;
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<BottomNavigationBarItem> items = List.empty(growable: true);
  final List<IconData> icons = [
    Icons.dashboard,
    Icons.timer_outlined,
    Icons.calendar_today_outlined,
    // Icons.analytics_outlined,
  ];

  final List<String> sidebarItemPaths = [
    AppRoute.dashboard.name,
    AppRoute.timer.name,
    AppRoute.calendar.name,
  ];

  @override
  Widget build(BuildContext context) {
    items = List.empty(growable: true);
    for (var i = 0; i < icons.length; i++) {
      items.add(
        BottomNavigationBarItem(
          backgroundColor: AppColors.backgroundColor,
          label: '',
          icon: Icon(
            icons[i],
            color: widget.navigationShell.currentIndex == i
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
          if (value != widget.navigationShell.currentIndex) {
            /* setState(() {
              selectedItem = value;
            }); */
            context.goNamed(sidebarItemPaths[value], extra: false);
          }
        },
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ScheduleBloc(),
          ),
        ],
        child: SafeArea(
          child: widget.navigationShell,
        ),
      ),
    );
  }
}
