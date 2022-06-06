import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:personal_helper/components/profilebar.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class Calendario extends StatefulWidget {
  const Calendario({Key? key}) : super(key: key);

  @override
  State<Calendario> createState() => _CalendarioState();
}

class _CalendarioState extends State<Calendario> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF00261d),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Container(
                color: const Color(0xFF00261d),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child:
                          const ProfileBar(exibirSaud: true, exibirBack: false),
                    ),
                  ],
                ),
              ),
            ),
            FloatingActionButton(
                child: const Icon(Icons.arrow_downward),
                backgroundColor: const Color(0xFF32A18A),
                onPressed: () {
                  Navigator.of(context).pushNamed('/dashboard');
                }),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: SfCalendar(
                  backgroundColor: Color(0xFF237C6A),
                  view: CalendarView.month,
                  selectionDecoration: BoxDecoration(color: Colors.red),
                  dataSource: MeetingDataSource(_getDataSource()),
                  monthViewSettings: const MonthViewSettings(
                      appointmentDisplayMode:
                          MonthAppointmentDisplayMode.appointment),
                  showNavigationArrow: true,
                  todayTextStyle: TextStyle(
                    color: Colors.amber,
                  ),
                  cellBorderColor: Colors.white,
                  todayHighlightColor: Colors.blueGrey.shade400),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text('Próximos Compromissos',
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }
}

List<Meeting> _getDataSource() {
  final List<Meeting> meetings = <Meeting>[];
  final DateTime today = DateTime.now();
  final DateTime startTime =
      DateTime(today.year, today.month, today.day, 9, 0, 0);
  final DateTime endTime = startTime.add(const Duration(hours: 2));
  meetings.add(Meeting(
      'Conference', startTime, endTime, const Color(0xFF0F8644), false));
  return meetings;
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Meeting> source) {
    appointments = source;
  }
  @override
  DateTime getStartTime(int index) {
    return appointments![index].from;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments![index].to;
  }

  @override
  String getSubject(int index) {
    return appointments![index].eventName;
  }

  @override
  Color getColor(int index) {
    return appointments![index].background;
  }

  @override
  bool isAllDay(int index) {
    return appointments![index].isAllDay;
  }
}

class Meeting {
  Meeting(this.eventName, this.from, this.to, this.background, this.isAllDay);

  String eventName;
  DateTime from;
  DateTime to;
  Color background;
  bool isAllDay;
}
