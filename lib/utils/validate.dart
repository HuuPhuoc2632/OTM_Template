bool containEmoji(String s) {
  return s.contains(RegExp(
      r'(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])'));
}

bool isValidEmail(String email) {
  // Regular expression pattern to check email format
  String pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
  RegExp regex = RegExp(pattern);
  return regex.hasMatch(email);
}

bool isValidNickname(String nickname,
    {bool hideToast = false, bool? isDialog = false}) {
  return RegExp("^[a-zA-Z0-9가-힣!@#\$%^&*(),.?:{}|<>]{3,8}\$")
          .hasMatch(nickname) &&
      !nickname.contains(" ") &&
      !containEmoji(nickname);
}

bool isValidPassword(String password) {
  return RegExp(
          "(?=.*[a-zA-Z])(?=.*[0-9])[a-zA-Z0-9\$&+,:;=?@#|'<>.^*()%!-]{8,20}\$")
      .hasMatch(password);
}

String removeDiacritics(String str) {
  final diacriticChars =
      'àáảãạăắằẳẵặâấầẩẫậèéẻẽẹêếềểễệìíỉĩịòóỏõọôốồổỗộơớờởỡợùúủũụưứừửữựỳýỷỹỵđÀÁẢÃẠĂẮẰẲẴẶÂẤẦẨẪẬÈÉẺẼẸÊẾỀỂỄỆÌÍỈĨỊÒÓỎÕỌÔỐỒỔỖỘƠỚỜỞỠỢÙÚỦŨỤƯỨỪỬỮỰỲÝỶỸỴĐ';
  final nonDiacriticChars =
      'aaaaaaaaaaaaaaaaaeeeeeeeeeeeiiiiiooooooooooooooooouuuuuuuuuuuyyyyydAAAAAAAAAAAAAAAAAEEEEEEEEEEEIIIIIOOOOOOOOOOOOOOOOOUUUUUUUUUUUYYYYYD';
  final buffer = StringBuffer();

  for (var i = 0; i < str.length; i++) {
    final char = str[i];
    final index = diacriticChars.indexOf(char);

    if (index >= 0) {
      buffer.write(nonDiacriticChars[index]);
    } else {
      buffer.write(char);
    }
  }

  return buffer.toString();
}

bool isValidNotEmptyTextField(String text) {
  return text.trim().isNotEmpty;
}

bool isValidPhone(String text) {
  var status = isValidNotEmptyTextField(text);
  return status;
}
