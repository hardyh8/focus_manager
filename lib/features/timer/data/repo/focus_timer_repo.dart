import '../api/focus_time_db.dart';
import '../models/focus_time_model.dart';

class FocusTimerRepo {
  final FocusTimeDb db;

  FocusTimerRepo({
    required this.db,
  });

  final List<FocusTimeSessionModel> _focusTimeSessions =
      List.empty(growable: true);

  List<FocusTimeSessionModel> get focusTimeSessions => _focusTimeSessions;
  List<int> lastWeekDailyFocusHour = List.empty(growable: true);
  List<int> lastWeekDailyFocusMinute = List.empty(growable: true);
  List<int> currentWeekDailyFocusHour = List.empty(growable: true);
  List<int> currentWeekDailyFocusMinute = List.empty(growable: true);
  int dailyAverageFocusHours = 0;
  int dailyAveragFocusMinutes = 0;

  Future<int> insert(FocusTimeSessionModel model) async {
    return await db.insert(model);
  }

  Future<FocusTimeSessionModel?> get(int id) async {
    var focusTimeSessionModel = await db.get(id);
    if (focusTimeSessionModel != null &&
        _focusTimeSessions
            .where(
              (element) => element.id == focusTimeSessionModel.id,
            )
            .isEmpty) {
      _focusTimeSessions.add(focusTimeSessionModel);
      biffercateData();
    }
    return focusTimeSessionModel;
  }

  Future<List<FocusTimeSessionModel>> getAll() async {
    List<FocusTimeSessionModel> list = await db.getAll();
    _focusTimeSessions.clear();
    _focusTimeSessions.addAll(list);
    biffercateData();
    return list;
  }

  Future<int> update(FocusTimeSessionModel model) async {
    var i = await db.update(model);
    await getAll();
    return i;
  }

  Future<int> delete(int id) async {
    var i = await db.delete(id);
    await getAll();
    return i;
  }

  void biffercateData() {
    DateTime currentDate = DateTime.now();
    DateTime startOfWeek =
        currentDate.subtract(Duration(days: currentDate.weekday - 1));
    DateTime endOfWeek = startOfWeek.add(const Duration(days: 6));

    Map<DateTime, int> dailyFocus = {};

    for (var session in focusTimeSessions) {
      if (session.completionDateTime != null) {
        DateTime sessionDate = DateTime(session.completionDateTime!.year,
            session.completionDateTime!.month, session.completionDateTime!.day);
        if (!dailyFocus.containsKey(sessionDate)) {
          dailyFocus[sessionDate] = 0;
        }
        dailyFocus[sessionDate] =
            dailyFocus[sessionDate]! + session.completedSecond;
      }
    }

    int totalFocusSeconds =
        dailyFocus.values.fold(0, (sum, seconds) => sum + seconds);
    int totalDays = dailyFocus.keys.length;
    int dailyAverageFocusSeconds =
        totalDays > 0 ? totalFocusSeconds ~/ totalDays : 0;

    dailyAverageFocusHours = dailyAverageFocusSeconds ~/ 3600;
    dailyAveragFocusMinutes = (dailyAverageFocusSeconds % 3600) ~/ 60;

    DateTime startOfLastWeek = startOfWeek.subtract(const Duration(days: 7));
    DateTime endOfLastWeek = endOfWeek.subtract(const Duration(days: 7));
    addWeekData(dailyFocus, startOfLastWeek, endOfLastWeek,
        lastWeekDailyFocusHour, lastWeekDailyFocusMinute);

    addWeekData(dailyFocus, startOfWeek, endOfWeek, currentWeekDailyFocusHour,
        currentWeekDailyFocusMinute);
  }

  void addWeekData(Map<DateTime, int> focusData, DateTime startOfWeek,
      DateTime endOfWeek, List<int> hours, List<int> minutes) {
    for (var entry in focusData.entries) {
      if (entry.key.isAfter(startOfWeek.subtract(const Duration(days: 1))) &&
          entry.key.isBefore(endOfWeek.add(const Duration(days: 1)))) {
        int hoursFocus = entry.value ~/ 3600;
        int minutesFocus = (entry.value % 3600) ~/ 60;
        hours.add(hoursFocus);
        minutes.add(minutesFocus);
      }
    }
  }
}
