String removeUTF8Character(String keyword) {
  var newKeyword =
      keyword.toLowerCase().replaceAll(RegExp(r'[eèéêếẹẻẽềềểễệ]'), 'e');
  newKeyword = newKeyword.replaceAll(RegExp(r'[aáàảâãăạảấầẩẫậắằẳẵặ]'), 'a');
  newKeyword = newKeyword.replaceAll(RegExp(r'[uùúũưụủứừửữự]'), 'u');
  newKeyword = newKeyword.replaceAll(RegExp(r'[oòóôõọỏốồổỗộớờởỡợơ]'), 'o');
  newKeyword = newKeyword.replaceAll(RegExp(r'[iìíĩịỉ]'), 'i');
  newKeyword = newKeyword.replaceAll(RegExp(r'[yýỳỷỹỵ]'), 'y');
  newKeyword = newKeyword.replaceAll(RegExp(r'[dđ]'), 'd');
  return newKeyword;
}

bool checkIfUrlIsValid(String? input) {
  final uri = Uri.tryParse(input ?? "");
  final isUriValid =
      uri != null && uri.hasAbsolutePath && uri.scheme.startsWith('http');
  return isUriValid;
}

int customStringComparison(String a, String b) {
  final aIndex = vietnameseAlphabets.indexOf(a.split('').first);
  final bIndex = vietnameseAlphabets.indexOf(b.split('').first);

  return aIndex.compareTo(bIndex);
}

bool checkIsNullOrEmpty(String input) {
  return input.isEmpty || input == "" ? true : false;
}

List<String> vietnameseAlphabets = [
  "0",
  "1",
  "2",
  "3",
  "4",
  "5",
  "6",
  "7",
  "8",
  "9",
  "a",
  "á",
  "à",
  "ả",
  "ã",
  "ạ",
  "ă",
  "ắ",
  "ằ",
  "ẳ",
  "ẵ",
  "ặ",
  "â",
  "ấ",
  "ầ",
  "ẩ",
  "ẫ",
  "ậ",
  "b",
  "c",
  "d",
  "đ",
  "e",
  "é",
  "è",
  "ẻ",
  "ẽ",
  "ẹ",
  "ê",
  "ế",
  "ề",
  "ể",
  "ễ",
  "ệ",
  "g",
  "h",
  "i",
  "k",
  "l",
  "m",
  "n",
  "o",
  "ó",
  "ò",
  "ỏ",
  "õ",
  "ọ",
  "ô",
  "ố",
  "ồ",
  "ổ",
  "ỗ",
  "ộ",
  "ơ",
  "ớ",
  "ờ",
  "ở",
  "ỡ",
  "ợ",
  "p",
  "q",
  "r",
  "s",
  "t",
  "u",
  "ú",
  "ù",
  "ủ",
  "ũ",
  "ụ",
  "ư",
  "ứ",
  "ừ",
  "ử",
  "ữ",
  "ự",
  "v",
  "x",
  "y",
  "z"
];
