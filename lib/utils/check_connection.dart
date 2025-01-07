import 'dart:async';
import 'dart:io';

// Check if phone is connected to internet or not using StreamController
class ConnectionHelper {
  static Future<bool> hasConnection() async {
    try {
      final result = await InternetAddress.lookup("google.com");
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      }
      return false;
    } on SocketException catch (_) {
      return false;
    }
  }
}
