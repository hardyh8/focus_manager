import 'package:drift/drift.dart';

import '../../../../core/utils/get_it/get_it_instance.dart';
import '../../../../data/local_db.dart';
import '../models/focus_time_model.dart';

class FocusTimeDb {
  Future<int> insert(FocusTimeSessionModel model) async {
    final database = getIt.get<AppDatabase>();
    try {
      int data = await database
          .into(database.focusTimeModel)
          .insert(FocusTimeModelCompanion.insert(
            completedSecond: model.completedSecond,
            createdAt: Value(model.completionDateTime),
          ));
      return data;
    } catch (er) {
      return -1;
    }
  }

  Future<FocusTimeSessionModel?> get(int id) async {
    final database = getIt.get<AppDatabase>();
    try {
      FocusTimeModelData data = await (database.select(database.focusTimeModel)
            ..where((tbl) => tbl.id.equals(id)))
          .getSingle();
      FocusTimeSessionModel session = FocusTimeSessionModel(
        id: data.id,
        completedSecond: data.completedSecond,
        completionDateTime: data.createdAt,
      );
      return session;
    } catch (er) {
      return null;
    }
  }

  Future<List<FocusTimeSessionModel>> getAll() async {
    final database = getIt.get<AppDatabase>();
    List<FocusTimeSessionModel> list = List.empty(growable: true);
    try {
      List<FocusTimeModelData> data =
          await database.select(database.focusTimeModel).get();
      for (var element in data) {
        FocusTimeSessionModel session = FocusTimeSessionModel(
          id: element.id,
          completedSecond: element.completedSecond,
          completionDateTime: element.createdAt,
        );
        list.add(session);
      }
    } catch (er) {
      //
    }
    return list;
  }

  Future<int> update(FocusTimeSessionModel model) async {
    final database = getIt.get<AppDatabase>();
    try {
      int data = await (database.update(database.focusTimeModel)
            ..where((tbl) => tbl.id.equals(model.id)))
          .write(
        FocusTimeModelCompanion(
          completedSecond: Value(model.completedSecond),
          createdAt: Value(model.completionDateTime),
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
      int data = await (database.delete(database.focusTimeModel)
            ..where((tbl) => tbl.id.equals(id)))
          .go();
      return data;
    } catch (er) {
      return -1;
    }
  }
}
