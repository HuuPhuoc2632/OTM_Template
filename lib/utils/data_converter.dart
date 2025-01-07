import 'dart:convert';

List<T>? toCustomList<T>(
    List<dynamic>? data, T Function(Map<String, dynamic>) converter) {
  if (data == null) {
    return null;
  }
  return List<T>.from(data.map<T>((value) => converter(value)));
}

Map<String, T>? toCustomMap<T>(
    dynamic data, T Function(Map<String, dynamic>) converter) {
  if (data == null) {
    return null;
  }
  if (data is String) {
    data = jsonDecode(data);
  }
  return Map<String, T>.from(
      data.map((key, value) => MapEntry(key, converter(value))));
}

DateTime? toDateTime(dynamic data) {
  return DateTime.tryParse(data ?? "");
}
