// ignore_for_file: type_literal_in_constant_pattern

import 'dart:async';
import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:otm_template/constants/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Config get and put method to cache data using Shared Preferences
class LocalCache {
  const LocalCache();
  static const secureStorage = FlutterSecureStorage();
  static late SharedPreferences cache;
  static Future<void> init() async {
    cache = await SharedPreferences.getInstance();
  }

  static Future<String?> getSecured(
    String key,
  ) async {
    try {
      return await secureStorage.read(key: key);
    } catch (e) {
      return null;
    }
  }

  static Future<void> putSecured(String key, String value) async {
    await secureStorage.write(key: key, value: value);
  }

  static Future<void> deleteSecured(String key) async {
    await secureStorage.delete(key: key);
  }

  // Get value of a key
  static Object? get(
    String key,
  ) {
    return cache.get(key);
  }

  // static CommonData getCommonData() {
  //   final commonData = cache.getString(StorageKeys.commonData);
  //   if (commonData != null) {
  //     return CommonData.fromJson(jsonDecode(commonData));
  //   }
  //   return CommonData();
  // }

  // Create/ Update a Key, Value pair into cache
  static Future<void> put(String key, dynamic value) async {
    switch (value.runtimeType) {
      case int:
        cache.setInt(key, value);
        break;
      case bool:
        cache.setBool(key, value);
        break;
      case double:
        cache.setDouble(key, value);
        break;
      case List:
        cache.setStringList(key, value);
        break;
      // case CommonData:
      //   cache.setString(key, jsonEncode(value));
      //   break;
      case String:
      default:
        cache.setString(key, value);
        break;
    }
  }

  // Remove a Key, Value pair from cache
  static Future<void> remove(String key) async {
    await cache.remove(key);
  }

  // Remove a list of Keys from cache
  static Future<void> removeKeys(List<String> keys) async {
    keys.map((key) async => await cache.remove(key));
  }

  static Future<dynamic> clear() async {
    return await cache.clear();
  }
}
