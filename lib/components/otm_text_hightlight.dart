// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:otm_template/utils/extension.dart';

class OtmTextHighlighting extends StatelessWidget {
  final String text;
  final String? textSearch;
  final Color? color;
  final TextStyle? style;
  final bool? caseSensitive;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final bool? softWrap;
  final TextOverflow? overflow;
  final double? textScaleFactor;
  final int? maxLines;
  final Locale? locale;
  final StrutStyle? strutStyle;
  final TextWidthBasis? textWidthBasis;
  final TextHeightBehavior? textHeightBehavior;
  final bool isFeed;
  final bool useRegExp;

  const OtmTextHighlighting({
    super.key,
    required this.text,
    this.textSearch,
    this.color = Colors.yellow,
    this.style = const TextStyle(
      color: Colors.black,
    ),
    this.caseSensitive = true,
    this.textAlign = TextAlign.start,
    this.textDirection,
    this.softWrap = true,
    this.overflow = TextOverflow.clip,
    this.textScaleFactor = 1.0,
    this.maxLines,
    this.locale,
    this.strutStyle,
    this.textWidthBasis = TextWidthBasis.parent,
    this.textHeightBehavior,
    this.isFeed = false,
    this.useRegExp = false,
  });

  @override
  Widget build(BuildContext context) {
    final feedSpan = isFeed
        ? TextSpan(
            text: '${"feed".tr()}: ',
            style: TextStyle().copyWith(color: Color(0XFF747474)),
          )
        : TextSpan();

    // * Highlight all accented words with RegEx
    List<String> highlights = [];
    if (textSearch != null && textSearch!.isNotEmpty) {
      highlights = textSearch!.trim().split(' ');
      highlights.removeWhere((element) => element == "");
      // inspect(highlights);

      if (useRegExp) {
        List<String> newHighlights = [];
        for (var element in highlights) {
          newHighlights.add(convertToRegExp(element));
        }

        highlights.clear();
        for (var i = 0; i < newHighlights.length; i++) {
          String excel = newHighlights[i].trim();
          // if (newHighlights[i].length < 2) continue;
          RegExp reg = RegExp(excel, caseSensitive: false, unicode: true);
          var matches = reg.allMatches(text);
          for (final Match m in matches) {
            String match = m[0]!;
            highlights.add(match);
          }
        }
        highlights.toSet().toList();
      }
    }

    if (text == '') {
      return _richText(TextSpan(children: [feedSpan, _normalSpan(text)]));
    }
    if (highlights.isEmpty) {
      return _richText(TextSpan(children: [feedSpan, _normalSpan(text)]));
    }
    for (int i = 0; i < highlights.length; i++) {
      if (highlights[i].isEmpty) {
        return _richText(TextSpan(children: [feedSpan, _normalSpan(text)]));
      }
    }

    List<TextSpan> _spans = [feedSpan];
    int _start = 0;

    String _lowerCaseText = text.toLowerCase();
    List<String> _lowerCaseHighlights = [];
    for (var element in highlights) {
      _lowerCaseHighlights.add(element.toLowerCase());
    }

    while (true) {
      Map<int, String> _highlightsMap = {};
      if (caseSensitive!) {
        for (int i = 0; i < highlights.length; i++) {
          int _index = -1;
          _index = text.indexOf(highlights[i], _start);
          if (_index == -1) {
            _index = text.removeDiacritics().indexOf(highlights[i], _start);
          }
          if (_index >= 0) {
            _highlightsMap.putIfAbsent(_index, () => highlights[i]);
          }
        }
      } else {
        for (int i = 0; i < highlights.length; i++) {
          int _index = -1;
          _index = _lowerCaseText.indexOf(_lowerCaseHighlights[i], _start);
          if (_index == -1) {
            _index = _lowerCaseText
                .removeDiacritics()
                .indexOf(_lowerCaseHighlights[i].removeDiacritics(), _start);
          }
          if (_index >= 0) {
            _highlightsMap.putIfAbsent(_index, () => highlights[i]);
          }
        }
      }

      if (_highlightsMap.isNotEmpty) {
        List<int> _indexes = [];
        _highlightsMap.forEach((key, value) => _indexes.add(key));

        int _currentIndex = _indexes.reduce(min);
        String _currentHighlight = text.substring(_currentIndex,
            _currentIndex + _highlightsMap[_currentIndex]!.length);

        if (_currentIndex == _start) {
          _spans.add(_highlightSpan(_currentHighlight));
          _start += _currentHighlight.length;
        } else {
          _spans.add(_normalSpan(text.substring(_start, _currentIndex)));
          _spans.add(_highlightSpan(_currentHighlight));
          _start = _currentIndex + _currentHighlight.length;
        }
      } else {
        _spans.add(_normalSpan(text.substring(_start, text.length)));
        break;
      }
    }

    return _richText(TextSpan(children: _spans));
  }

  TextSpan _highlightSpan(String value) {
    if (style!.color == null) {
      return TextSpan(
        text: value,
        style: style!.copyWith(
          color: Colors.black,
          backgroundColor: color,
        ),
      );
    } else {
      return TextSpan(
        text: value,
        style: style!.copyWith(
          backgroundColor: color,
        ),
      );
    }
  }

  TextSpan _normalSpan(String value) {
    if (style!.color == null) {
      return TextSpan(
        text: value,
        style: style!.copyWith(
          color: Colors.black,
        ),
      );
    } else {
      return TextSpan(
        text: value,
        style: style,
      );
    }
  }

  RichText _richText(TextSpan text) {
    return RichText(
      key: key,
      text: text,
      textAlign: textAlign!,
      // textDirection: textDirection,
      softWrap: softWrap!,
      overflow: overflow!,
      textScaler: TextScaler.linear(textScaleFactor!),
      maxLines: maxLines,
      locale: locale,
      strutStyle: strutStyle,
      textWidthBasis: textWidthBasis!,
      textHeightBehavior: textHeightBehavior,
    );
  }

  convertToRegExp(String keyword) {
    var temp = keyword;
    temp = temp.removeUTF8Character();
    temp = temp.trim(); // ! Just in case...
    temp = RegExp.escape(
        temp); // ! Fix special chars when searching with RegExp later

    var newKeyword =
        temp.toLowerCase().replaceAll(RegExp(r'(e|ê)'), '[eèéêếẹẻẽềềểễệ]');
    newKeyword =
        newKeyword.replaceAll(RegExp(r'(a|ă|â)'), '[aáàảâãăạảấầẩẫậắằẳẵặ]');
    newKeyword = newKeyword.replaceAll(RegExp(r'(u|ư)'), '[uùúũưụủứừửữự]');
    newKeyword =
        newKeyword.replaceAll(RegExp(r'(o|ô|ơ)'), '[oòóôõọỏốồổỗộớờởỡợơ]');
    newKeyword = newKeyword.replaceAll(RegExp(r'i'), '[iìíĩịỉ]');
    newKeyword = newKeyword.replaceAll(RegExp(r'y'), '[yýỳỷỹỵ]');
    newKeyword = newKeyword.replaceAll(RegExp(r'd'), '[dđ]');
    return newKeyword;
  }
}
