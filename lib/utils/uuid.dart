// ignore_for_file: deprecated_member_use

// ignore: depend_on_referenced_packages
import 'package:uuid/uuid.dart';

String generateUuid({String? time}) {
  // LocalService localService = Get.find();
  // var token = localService.tenantToken?.accessToken ?? "";
  // Map<String, dynamic> decodedToken = {};
  // try {
  //   decodedToken = JwtDecoder.decode(token);
  // } catch (err) {}
  // var tenantUserId = decodedToken["tenantId"];
  String currentTime = time ?? DateTime.now().microsecondsSinceEpoch.toString();
  var name = currentTime;
  print(name);
  return Uuid().v5(Uuid.NAMESPACE_URL, name);
}

generateDistincUuid({required DateTime date, required List<String> idList}) {
  var id = generateUuid(time: date.microsecondsSinceEpoch.toString());
  if (!idList.contains(id)) return id;
  var newDate =
      date.add(Duration(seconds: 12 * 30 * 24 * 60 * 60)); // cộng thêm 1 năm

  return generateDistincUuid(date: newDate, idList: idList);
}
