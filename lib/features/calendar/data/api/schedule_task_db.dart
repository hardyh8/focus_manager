import 'package:drift/drift.dart';

import '../../../../core/utils/get_it/get_it_instance.dart';
import '../../../../data/local_db.dart';
import '../models/schedule_task_model.dart';

class ScheduleTaskDb {
  Future<int> insert(ScheduleEventModel model) async {
    final database = getIt.get<AppDatabase>();
    try {
      int data = await database
          .into(database.scheduleTaskModel)
          .insert(ScheduleTaskModelCompanion(
            subject: Value(model.subject),
            notes: Value(model.note),
            fromTime: Value(model.fromTime),
            toTime: Value(model.toTime),
            isCompleted: Value(model.isCompleted),
            isFailed: Value(model.isFailed),
          ));
      return data;
    } catch (er) {
      return -1;
    }
  }

  Future<ScheduleEventModel?> get(int id) async {
    final database = getIt.get<AppDatabase>();
    try {
      var data = await (database.select(database.scheduleTaskModel)
            ..where((tbl) => tbl.id.equals(id)))
          .getSingle();
      ScheduleEventModel session = ScheduleEventModel(
        subject: data.subject,
        note: data.notes,
        fromTime: data.fromTime,
        toTime: data.toTime,
        isCompleted: data.isCompleted,
        isFailed: data.isFailed,
      );
      return session;
    } catch (er) {
      return null;
    }
  }

  Future<List<ScheduleEventModel>> getAll() async {
     final database = getIt.get<AppDatabase>();
    List<ScheduleEventModel> list = List.empty(growable: true);
    try {
      List<ScheduleTaskModelData> data =
          await database.select(database.scheduleTaskModel).get();
      for (var element in data) {
        ScheduleEventModel session = ScheduleEventModel(
          subject: element.subject,
          note: element.notes,
          fromTime: element.fromTime,
          toTime: element.toTime,
          isCompleted: element.isCompleted,
          isFailed: element.isFailed,
        );
        list.add(session);
      }
    } catch (er) {
      //
    }
    return list;
  }

  Future<int> update(ScheduleEventModel model) async {
    final database = getIt.get<AppDatabase>();
    try {
      int data = await (database.update(database.scheduleTaskModel)
            ..where((tbl) => tbl.id.equals(model.id)))
          .write(
        ScheduleTaskModelCompanion(
          subject: Value(model.subject),
          notes: Value(model.note),
          fromTime: Value(model.fromTime),
          toTime: Value(model.toTime),
          isCompleted: Value(model.isCompleted),
          isFailed: Value(model.isFailed),
        ),
      );
      return data;
    } catch (er) {
      return -1;
    }
  }

  Future<int> delete(int id) async {
    final database = getIt.get<AppDatabase>();
    try {
      int data = await (database.delete(database.scheduleTaskModel)
            ..where((tbl) => tbl.id.equals(id)))
          .go();
      return data;
    } catch (er) {
      return -1;
    }
  }
}
