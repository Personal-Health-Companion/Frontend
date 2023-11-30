import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CalendarPanel(),
    );
  }
}

class CalendarPanel extends StatefulWidget {
  const CalendarPanel({super.key});

  @override
  State<CalendarPanel> createState() => _CalendarPanelState();
}

class _CalendarPanelState extends State<CalendarPanel> {

  DateTime? selectedDay;
  DateTime focusedDay = DateTime.now();

  @override
  void initState() {
    super.initState();
    update();
  }

  void update() {
    // context.read<ScheduleListProvider>().updateScheduleList(1);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        TableCalendar(
          firstDay: DateTime.utc(2020, 3, 6),
          lastDay: DateTime.utc(2030, 3, 6),
          focusedDay: focusedDay,
          selectedDayPredicate: (day) {
            return isSameDay(selectedDay, day);
          },
          onFormatChanged: (format) {
            if (selectedDay != null) {
              setState(() {});
            }
          },
          availableCalendarFormats: const {
            CalendarFormat.month: 'Today',
            CalendarFormat.twoWeeks: 'Today',
            CalendarFormat.week: 'Today',
          },
          headerStyle: const HeaderStyle(
            formatButtonVisible: true,
            titleTextStyle: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold),
                // color: AppColor.main),
          ),
          calendarStyle: const CalendarStyle(
            //marker 관련
              canMarkersOverflow: false,
              markersAutoAligned: true,
              markerSize: 10,
              markerDecoration: BoxDecoration(
                color: Color(0xFF065535),
                shape: BoxShape.circle,
              ),
              //today 관련
              isTodayHighlighted: true,
              todayDecoration: BoxDecoration(
                color: Color(0xFF065535),
                shape: BoxShape.circle,
              ),
              //selectedDay 관련
              selectedDecoration: BoxDecoration(
                  color: Color(0xFFa9d18e), shape: BoxShape.circle),
              //주말 관련
              weekendTextStyle: TextStyle(color: Colors.red)),
          onPageChanged: (pageDate) {
            setState(() {
              focusedDay = pageDate;
            });
          },
          onDaySelected: (selectedDays, _) {
            setState(() {
              selectedDay = selectedDays;
              focusedDay = selectedDays;
            });
            //sendDate(selectedDays);
            //print('User selected day $selectedDays');
          },
        ),
        Positioned(
            top: 9,
            right: 62,
            child: TextButton(
              onPressed: () {
                setState(() {
                  focusedDay = DateTime.now();
                  selectedDay = DateTime.now();
                });
              },
              child: const Text('  '),
            ))
      ],
    );
  }
}
