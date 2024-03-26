import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class TimeZone {
  static  TimeZone? _this;
  factory TimeZone() => _this ?? TimeZone._();

  TimeZone._() {
    tz.initializeTimeZones();
  }

  Future<String> getTimeZoneName() async =>
      await FlutterTimezone.getLocalTimezone();

  Future<tz.Location> getLocation([String? timeZoneName]) async {
    if (timeZoneName == null || timeZoneName.isEmpty) {
      timeZoneName = await getTimeZoneName();
    }
    return tz.getLocation(timeZoneName);
  }
}
