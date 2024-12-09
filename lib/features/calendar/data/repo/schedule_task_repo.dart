import '../../domain/entities/schedule_event_entity.dart';
import '../api/schedule_task_db.dart';
import '../models/schedule_task_model.dart';

class ScheduleTaskRepo {
  ScheduleTaskDb db;

  ScheduleTaskRepo({
    required this.db,
  });

  final List<ScheduleEventEntity> _scheduleTasks = List.empty(growable: true);

  List<ScheduleEventEntity> get scheduleTasks => _scheduleTasks;
  int totalCompletedTask = 0;
  int totalFailedTask = 0;

  Future<int> insert(ScheduleEventModel model) async {
    var i = await db.insert(model);
    getAll();
    return i;
  }

  Future<ScheduleEventModel?> get(int id) async {
    return await db.get(id);
  }

  Future<List<ScheduleEventModel>> getAll() async {
    List<ScheduleEventModel> list = await db.getAll();
    _biffercateData(list);
    return list;
  }

  Future<int> update(ScheduleEventModel model) async {
    var i = await db.update(model);
    getAll();
    return i;
  }

  Future<int> delete(int id) async {
    var i = await db.delete(id);
    getAll();
    return i;
  }

  void _biffercateData(List<ScheduleEventModel> list) {
    List<ScheduleEventEntity> tasks = List.empty(growable: true);

    for (var task in list) {
      tasks.add(ScheduleEventEntity(
        fromTime: task.fromTime,
        toTime: task.toTime,
        id: task.id,
        note: task.note,
        subject: task.subject,
      ));
      if (task.isCompleted) totalCompletedTask++;
      if (task.isFailed) totalFailedTask++;
    }
    scheduleTasks.clear();
    scheduleTasks.addAll(tasks);
  }
}
