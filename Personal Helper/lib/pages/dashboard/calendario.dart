import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:personal_helper/pages/dashboard/dashboard.dart';

import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../../components/profilebar.dart';

class Calendario extends StatefulWidget {
  const Calendario({Key? key}) : super(key: key);

  @override
  State<Calendario> createState() => _CalendarioState();
}

class _CalendarioState extends State<Calendario> {
  TextEditingController _consultaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF32A18A),
      body: Container(
        padding: EdgeInsets.only(top: 48, bottom: 64),
        child: Column(children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: const ProfileBar(exibirSaud: true, exibirBack: false),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FloatingActionButton(
              child: const Icon(Icons.arrow_downward),
              backgroundColor: const Color(0xFF32A18A),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => Dashboard()),
                );
              },
            ),
          ),
          Expanded(
            child: SfCalendar(
              backgroundColor: Color(0xFF32A18A),
              view: CalendarView.month,
              selectionDecoration: BoxDecoration(color: Colors.transparent),
              showNavigationArrow: true,
              todayTextStyle: TextStyle(
                color: Colors.white,
              ),
              dataSource: MeetingDataSource(_getDataSource()),
              monthViewSettings: const MonthViewSettings(
                  appointmentDisplayMode: MonthAppointmentDisplayMode.indicator,
                  showAgenda: true),
              cellBorderColor: Colors.black,
            ),
          ),
        ]),
      ),
    );
  }
}

List<Meeting> _getDataSource() {
  final List<Meeting> meetings = <Meeting>[];
  final DateTime today = DateTime.now();
  final DateTime startTime =
      DateTime(today.year, today.month, today.day, 9, 0, 0);
  final DateTime endTime = startTime.add(const Duration(hours: 10));
  meetings.add(Meeting('Oftalmologista', today, endTime,
      Color.fromARGB(255, 5, 23, 219), false));
  meetings.add(Meeting('Cardiologista', DateTime(2022, 06, 17, 10),
      DateTime(2022, 06, 12, 10), Color.fromARGB(255, 219, 5, 5), false));

  meetings.add(Meeting('Otorrinolaringologista', DateTime(2022, 06, 21, 11),
      DateTime(2022, 06, 12, 10), Color.fromARGB(255, 45, 102, 26), false));

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
