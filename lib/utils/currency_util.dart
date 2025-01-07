// ignore_for_file: depend_on_referenced_packages

import 'package:intl/intl.dart';

String? getCurrencyKShow(Object? value) {
  if (value == null) return "0";
  if (value is String) {
    try {
      return getCurrencyKShow(double.parse(value));
    } catch (e) {
      return value;
    }
  } else if (value is num) {
    if (value < 999) {
      return value.toString();
    } else {
      return '${NumberFormat("#,###").format(value / 1000)}k';
    }
  } else {
    return "error";
  }
}

String getCurrencyFullShow(Object? value) {
  if (value == null) return "0";
  if (value is String) {
    try {
      return getCurrencyFullShow(double.parse(value));
    } catch (e) {
      return value;
    }
  } else if (value is num) {
    if (value < 999) {
      return value.toString();
    } else {
      return NumberFormat("#,###").format(value);
    }
  } else {
    return "error";
  }
}
