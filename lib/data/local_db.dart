import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

import '../features/timer/data/models/focus_time_model.dart';
part 'local_db.g.dart';

@DriftDatabase(tables: [FocusTimeModel])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return driftDatabase(name: 'my_database');
  }
}
