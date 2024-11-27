import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../../../../core/constants/colors.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: AppColors.whiteColor,
          ),
        ),
        title: const Text(
          'Schedule',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: AppColors.whiteColor,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            _buildDatePicker(),
            const SizedBox(height: 20),
            Expanded(
              child: SfCalendar(
                view: CalendarView.day,
                dataSource: _getCalendarDataSource(),
                timeSlotViewSettings: const TimeSlotViewSettings(
                  timeIntervalHeight: 60,
                  startHour: 6,
                  endHour: 20,
                  timeFormat: 'h a',
                  timeTextStyle: TextStyle(
                    color: AppColors.borderColor,
                    fontSize: 12,
                  ),
                ),
                viewHeaderHeight: 0,
                headerHeight: 0,
                todayHighlightColor: AppColors.primaryPinkColor,
                backgroundColor: AppColors.backgroundColor,
                appointmentTextStyle: const TextStyle(
                  color: AppColors.whiteColor,
                  fontSize: 14,
                ),
                appointmentBuilder: (context, calendarAppointmentDetails) {
                  final appointment = calendarAppointmentDetails
                      .appointments.first as Appointment;
                  return _buildCustomAppointmentTile(appointment);
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        backgroundColor: AppColors.primaryPinkColor,
        onPressed: () {},
        elevation: 8,
        child: const Icon(
          Icons.add,
          size: 32,
          color: AppColors.whiteColor,
        ),
      ),
    );
  }

  Widget _buildCustomAppointmentTile(Appointment appointment) {
    return Container(
      margin: const EdgeInsets.fromLTRB(25, 2, 4, 2),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: appointment.color,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: appointment.color.withOpacity(0.6),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            appointment.subject,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          if (appointment.notes != null) ...[
            const SizedBox(height: 4),
            Text(
              appointment.notes!,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.white70,
              ),
            ),
          ],
          const SizedBox(height: 8),
          Text(
            '${_formatTime(appointment.startTime)} - ${_formatTime(appointment.endTime)}',
            style: const TextStyle(
              fontSize: 12,
              color: Colors.white54,
            ),
          ),
        ],
      ),
    );
  }

  String _formatTime(DateTime dateTime) {
    return "${dateTime.hour > 12 ? dateTime.hour - 12 : dateTime.hour}:${dateTime.minute.toString().padLeft(2, '0')} ${dateTime.hour >= 12 ? 'PM' : 'AM'}";
  }

  Widget _buildDatePicker() {
    final days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri'];
    final dates = ['12', '13', '14', '15', '16'];

    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: SizedBox(
        height: 70,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: days.length,
          separatorBuilder: (context, index) => const SizedBox(width: 18),
          itemBuilder: (context, index) {
            final isSelected = index == 0; // Assume the first day is selected
            return GestureDetector(
              onTap: () {},
              child: AspectRatio(
                aspectRatio: 1,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? AppColors.primaryPinkColor
                        : AppColors.greyColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        days[index],
                        style: const TextStyle(
                          color: AppColors.whiteColor,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        dates[index],
                        style: const TextStyle(
                          color: AppColors.whiteColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  _DataSource _getCalendarDataSource() {
    return _DataSource(<Appointment>[
      Appointment(
        startTime: DateTime.now().add(const Duration(hours: 0)),
        endTime: DateTime.now().add(const Duration(hours: 2)),
        subject: 'Desk research',
        color: Colors.grey[800]!,
      ),
      Appointment(
        startTime: DateTime.now().add(const Duration(hours: 3)),
        endTime: DateTime.now().add(const Duration(hours: 5)),
        subject: 'Kickoff agenda',
        notes: "Remember to include Jean's notes",
        color: AppColors.secondaryPurpleColor,
      ),
      Appointment(
        startTime: DateTime.now().add(const Duration(hours: 6)),
        endTime: DateTime.now().add(const Duration(hours: 8)),
        subject: 'Dribbble shot prep',
        color: AppColors.calendarblueColor,
      ),
    ]);
  }
}

class _DataSource extends CalendarDataSource {
  @override
  String? getNotes(int index) {
    List<Appointment> source = appointments as List<Appointment>;
    return source[index].notes;
  }

  _DataSource(List<Appointment> source) {
    appointments = source;
  }
}
