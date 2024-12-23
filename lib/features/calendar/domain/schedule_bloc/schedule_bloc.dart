import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/get_it/get_it_instance.dart';
import '../../data/models/schedule_task_model.dart';
import '../../data/repo/schedule_task_repo.dart';
import '../entities/schedule_event_entity.dart';

part 'schedule_event.dart';
part 'schedule_state.dart';

class ScheduleBloc extends Bloc<ScheduleEvent, ScheduleState> {
  late ScheduleTaskRepo repo;

  ScheduleBloc() : super(const ScheduleInitial(taskList: [])) {
    repo = getIt.get<ScheduleTaskRepo>();
    on<ScheduleCreateEvent>(_onCreate);
    on<ScheduleEditEvent>(_onEdit);
    on<ScheduleCompletedEvent>(_onComplete);
    on<ScheduleFailedEvent>(_onFail);
    on<ScheduleInitializeEvent>(_onInitialize);
  }

  void _onCreate(ScheduleCreateEvent event, Emitter<ScheduleState> emit) async {
    var task = event.task;
    var isd = await repo.insert(ScheduleEventModel(
      fromTime: task.fromTime,
      toTime: task.toTime,
      isCompleted: false,
      isFailed: false,
      note: task.note,
      subject: task.subject,
    ));
    log(isd.toString());
    emit(ScheduleCreated(task: event.task, taskList: state.taskList));
  }

  void _onEdit(ScheduleEditEvent event, Emitter<ScheduleState> emit) {
    updateTask(event.task);
  }

  void _onComplete(ScheduleCompletedEvent event, Emitter<ScheduleState> emit) {
    updateTask(event.task);
  }

  void _onFail(ScheduleFailedEvent event, Emitter<ScheduleState> emit) {
    updateTask(event.task);
  }

  void updateTask(ScheduleEventEntity task) {
    repo.update(ScheduleEventModel(
      id: task.id,
      fromTime: task.fromTime,
      toTime: task.toTime,
      isCompleted: false,
      isFailed: false,
      note: task.note,
      subject: task.subject,
    ));
  }

  void _onInitialize(
    ScheduleInitializeEvent event,
    Emitter<ScheduleState> emit,
  ) async {
    emit(const ScheduleLoading(taskList: []));
    await repo.getAll();
    var taskList = repo.scheduleTasks;
    emit(ScheduleInitial(taskList: taskList));
  }
}
