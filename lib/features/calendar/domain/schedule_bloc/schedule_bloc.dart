import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// import '../../../../core/utils/get_it/get_it_instance.dart';
// import '../../data/api/schedule_task_db.dart';
import '../entities/schedule_event.dart';

part 'schedule_event.dart';
part 'schedule_state.dart';

class ScheduleBloc extends Bloc<ScheduleEvent, ScheduleState> {
  ScheduleBloc() : super(ScheduleInitial()) {
    on<ScheduleCreateEvent>(_onCreate);
    on<ScheduleEditEvent>(_onEdit);
  }

  void _onCreate(ScheduleCreateEvent event, Emitter<ScheduleState> emit) {
    // var db = getIt.get<ScheduleTaskDb>();
    // db.insert(event.task);
    emit(ScheduleCreated(task: event.task));
  }

  void _onEdit(ScheduleEditEvent event, Emitter<ScheduleState> emit) {}
}
