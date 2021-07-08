import 'package:add_2_calendar/add_2_calendar.dart';

import 'package:flutter/services.dart' show rootBundle;

class CalendarService {
  Future<void> addEvent() async {
    final icsString = await rootBundle.loadString('assets/Calendrier.ics');

    final Event event = Event(
        title: "Event title",
        description: "Event desription",
        location: "Event location",
        recurrence: Recurrence(frequency: Frequency.weekly, rRule: icsString),
        startDate: DateTime.now().add(Duration(days: 1)),
        endDate: DateTime.now().add(Duration(days: 1, hours: 4)),
        iosParams: IOSParams(reminder: Duration(days: 1)),
        androidParams: AndroidParams(emailInvites: ["t.senilh@gmail.com"]));

    await Add2Calendar.addEvent2Cal(event);
  }
}
