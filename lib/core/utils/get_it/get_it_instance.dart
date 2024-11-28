import 'package:get_it/get_it.dart';

import '../../../data/local_db.dart';
import '../../../features/timer/data/api/focus_time_db.dart';

final getIt = GetIt.instance;

void initializeDependencies() {
  getIt.registerSingleton<AppDatabase>(AppDatabase());
  getIt.registerSingleton<FocusTimeDb>(FocusTimeDb());
}