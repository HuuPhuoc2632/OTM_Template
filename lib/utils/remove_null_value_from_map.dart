Map<String, dynamic> removeNullValueFromMap(Map<String, dynamic> map) {
  Map<String, dynamic> result = {};
  map.forEach((key, value) {
    if (value != null) {
      result[key] = value;
    }
  });
  return result;
}
