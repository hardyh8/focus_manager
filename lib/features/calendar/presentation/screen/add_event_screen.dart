import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/widgets/buttons/primary_button.dart';
import '../../../../core/widgets/input_fields/basic_field.dart';
import '../../../../core/widgets/input_fields/time_picker_field.dart';
import '../../domain/entities/schedule_event_entity.dart';
import '../../domain/schedule_bloc/schedule_bloc.dart';

class AddEventScreen extends StatefulWidget {
  const AddEventScreen({super.key, required this.isEdit});
  final bool isEdit;
  @override
  State<AddEventScreen> createState() => _AddEventScreenState();
}

class _AddEventScreenState extends State<AddEventScreen> {
  final TextEditingController subjectController = TextEditingController();
  final TextEditingController notesController = TextEditingController();
  final TextEditingController fromTimeController = TextEditingController();
  final TextEditingController toTimeController = TextEditingController();

  @override
  void initState() {
    fromTimeController.text = '0:0';
    toTimeController.text = '0:0';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        elevation: 0,
        title: const Text(
          'Add Event',
          style: TextStyle(
            color: AppColors.whiteColor,
            fontSize: 26,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                BasicField(
                  controller: subjectController,
                  hintText: 'Subject',
                ),
                const SizedBox(height: 15),
                BasicField(
                  controller: notesController,
                  hintText: 'Notes',
                ),
                const SizedBox(height: 15),
                TimePickerField(
                  controller: fromTimeController,
                  hintText: 'From Time',
                  onIconPressed: () async {
                    TimeOfDay? data = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    );
                    if (data != null) {
                      setState(() {
                        fromTimeController.text = '${data.hour}:${data.minute}';
                      });
                    }
                  },
                ),
                const SizedBox(height: 15),
                TimePickerField(
                  controller: toTimeController,
                  hintText: 'To Time',
                  onIconPressed: () async {
                    TimeOfDay? data = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    );
                    if (data != null) {
                      setState(() {
                        toTimeController.text = '${data.hour}:${data.minute}';
                      });
                    }
                  },
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: BlocProvider(
                          create: (context) => ScheduleBloc(),
                          child: PrimaryButton(
                            data: 'Save',
                            onPressed: () {
                              onButtonPressed(context);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onButtonPressed(BuildContext context) {
    var fromSplits = fromTimeController.text.split(':');
    var fromHour = int.tryParse(fromSplits[0]) ?? 0;
    var fromMinute = int.tryParse(fromSplits[1]) ?? 0;

    var toSplits = toTimeController.text.split(':');
    var toHour = int.tryParse(toSplits[0]) ?? 0;
    var toMinute = int.tryParse(toSplits[1]) ?? 0;

    var now = DateTime.now();
    var fromTime = DateTime(
      now.year,
      now.month,
      now.day,
      fromHour,
      fromMinute,
    );
    var toTime = DateTime(
      now.year,
      now.month,
      now.day,
      toHour,
      toMinute,
    );

    var scheduleEventEntity = ScheduleEventEntity(
      fromTime: fromTime,
      toTime: toTime,
      note: notesController.text,
      subject: subjectController.text,
    );
    if (widget.isEdit) {
      context
          .read<ScheduleBloc>()
          .add(ScheduleEditEvent(task: scheduleEventEntity));
    } else {
      context
          .read<ScheduleBloc>()
          .add(ScheduleCreateEvent(task: scheduleEventEntity));
    }
  }
}
