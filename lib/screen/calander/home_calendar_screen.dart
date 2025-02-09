import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class HomeCalendarScreen extends StatelessWidget {
  const HomeCalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calendar'),
      ),
      body: SfCalendar(
        // Main calendar configuration
        view: CalendarView.month,
        allowedViews: const [
          CalendarView.day,
          CalendarView.week,
          CalendarView.workWeek,
          CalendarView.month,
          CalendarView.schedule,
        ],

        allowDragAndDrop: true,

        // Appearance customization
        cellBorderColor: Colors.grey[300],
        backgroundColor: Colors.white,
        todayHighlightColor: Colors.blue,
        selectionDecoration: BoxDecoration(
          border: Border.all(color: Colors.blue, width: 2),
          borderRadius: BorderRadius.circular(4),
        ),

        // Month view specific settings
        monthViewSettings: const MonthViewSettings(
          showAgenda: true,
          appointmentDisplayMode: MonthAppointmentDisplayMode.appointment,
          appointmentDisplayCount: 4,
          agendaStyle: AgendaStyle(
            backgroundColor: Colors.white,
            appointmentTextStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),

        // Data source for events/appointments
        dataSource: MeetingDataSource(_getDataSource()),

        // Time slot view settings (for day/week views)
        timeSlotViewSettings: const TimeSlotViewSettings(
          startHour: 8,
          endHour: 20,
          nonWorkingDays: <int>[DateTime.saturday, DateTime.sunday],
          timeFormat: 'h:mm a',
          timeInterval: Duration(minutes: 30),
        ),
      ),
    );
  }
}

// Data source class to handle the calendar events
class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Meeting> meetings) {
    appointments = meetings;
  }

  @override
  DateTime getStartTime(int index) => appointments![index].from;

  @override
  DateTime getEndTime(int index) => appointments![index].to;

  @override
  String getSubject(int index) => appointments![index].eventName;

  @override
  Color getColor(int index) => appointments![index].background;

  @override
  bool isAllDay(int index) => appointments![index].isAllDay;
}

// Meeting model class to represent calendar events
class Meeting {
  Meeting(this.eventName, this.from, this.to, this.background, this.isAllDay,
      this.notes);

  String eventName;
  String notes;
  DateTime from;
  DateTime to;
  Color background;
  bool isAllDay;
}

// Helper function to generate dummy events
List<Meeting> _getDataSource() {
  final List<Meeting> meetings = <Meeting>[];
  final DateTime today = DateTime.now();
  final DateTime startTime = DateTime(today.year, today.month, today.day, 9);
  final DateTime endTime = startTime.add(const Duration(hours: 2));

  // Add some dummy meetings
  meetings.addAll([
    Meeting(
      'Team Meeting',
      startTime,
      endTime,
      const Color(0xFF0F8644),
      false,
      'Discuss about the upcoming project',
    ),
    Meeting(
      'Product Review',
      startTime.add(const Duration(days: 1)),
      endTime.add(const Duration(days: 1)),
      Colors.blue,
      false,
      "Review the product's design and features",
    ),
    Meeting(
      'Client Workshop',
      startTime.add(const Duration(days: 2)),
      endTime.add(const Duration(days: 2, hours: 2)),
      Colors.purple,
      false,
      'Discuss about the client requirements',
    ),
    Meeting(
      'Company Holiday',
      startTime.add(const Duration(days: 5)),
      startTime.add(const Duration(days: 5)),
      Colors.red,
      true,
      'National holiday',
    ),
    Meeting(
      'Project Deadline',
      startTime.add(const Duration(days: -2)),
      endTime.add(const Duration(days: -2)),
      Colors.orange,
      false,
      'Complete the project before deadline',
    ),
  ]);

  return meetings;
}
