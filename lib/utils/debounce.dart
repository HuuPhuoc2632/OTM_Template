import 'package:easy_debounce/easy_throttle.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:otm_template/constants/constants.dart';

runDebounce(String tag, VoidCallback action, {Duration? duration}) {
  EasyThrottle.throttle(
    tag,
    duration ?? Duration(milliseconds: Constants.debounceTime),
    action,
  );
}
