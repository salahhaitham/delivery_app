import 'package:flutter/material.dart';

class OpenStatusChecker {
  static bool isOpenNow({
    required String openTime,
    required String closeTime,
  })
  {
    final now = _toMinutes(TimeOfDay.now());
    final open = _toMinutes(_parseTime(openTime));
    final close = _toMinutes(_parseTime(closeTime));

    if (open <= close) {
      return now >= open && now < close;
    }

    return now >= open || now <= close;
  }

  static int _toMinutes(TimeOfDay time) {
    return time.hour * 60 + time.minute;
  }

  static TimeOfDay _parseTime(String time) {
    final part = time.split(":");
    return TimeOfDay(
      hour: int.parse(part[0]),
      minute: int.parse(part[1]),
    );
  }
}