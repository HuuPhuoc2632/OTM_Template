import 'dart:ui';

class Constants {
  static String baseUrl = 'https://ctv.itbee-gitlab.com';
  static const String baseDomain = 'https://lazu.com.vn';
  static String env = 'DEV';
  static const String nameApp = 'ITBee Affiliate';
  static const String companyId = "cl5ag44qj00231o2xfhnfpjxf";
  static const urlAboutUs = "https://lazuvietnam.com/gioi-thieu/";
  static const urlSupportCenter = "https://lazuvietnam.com/faq-lazu-viet-nam/";
  static const urlPolicy = "https://lazuvietnam.com/thoa-thuan-nguoi-dung/";
  static const urlPaymentGuide = "$baseDomain/policy/payment-instructions";
  static const urlPaymentPolicy = "$baseDomain/policy/payment-policy";
  static const urlPrivacyPolicy =
      "$baseDomain/policy/personal-information-privacy-policy";
  static const urlCustomerSupportPolicy =
      "$baseDomain/policy/customer-support-policy";
  static const urlBuyingInstructions = "$baseDomain/policy/buying-instructions";
  static const urlBuyingInstructionsApp =
      "$baseDomain/policy/buying-instructions-app";

  static const String dateEmpty = "--:--";
  static const String dateFormat = "dd/MM/yyyy";
  static const String dateFormatOriginal = "yyyy-MM-dd";
  static const String networkDateFormat = "MM/dd/yyyy";
  static const String loanOffsetDateFormat = "dd MMM yyyy";
  static const String hourMinuteFormat = "HH:mm";
  static const String dateHourFormat = "MMM dd yyyy,";
  static const String dateTimeFormat = "dd/MM/yyyy HH:mm:ss";
  static const String dateTimeFormatServer = "MM/dd/yyyy h:mm:ss";
  static const String dateMonth = "MMMM";
  static const String timeFormat = "HH:mm:ss";
  static const String dateMonthFormat = "EEEE, dd/MM";
  static const String monthFormat = "dd/MM";
  static const String dateMonthYearFormat = "EEEE, dd/MM/yyyy";
  static const String dateMonthTimeFormat = "dd/MM HH:mm:ss";
  static const String timeDateMonthYearFormat = "HH:mm dd/MM/yyyy";
  static const String monthYearFormat = "MM/yyyy";
  static const String dateFormatWithDayOfWeek = "EEEE, dd/MM/yyyy";
  static const String dateFormatWithHourAndMinute = 'dd/MM/yyyy - HH:mm';
  static const String dateTimeFormatUntilMinute = 'dd/MM/yyyy HH:mm';
  static const String emptyDateTimeFormatUntilMinute = '--/--/---- --:--';
  static const String emptyDateFormat = '--/--/----';
  static const String dateFormatWithMonthAndYear = 'MM - yyyy';

  static const double borderRadiusButton = 25.0;
  static const double borderRadiusCard = 12.0;
  static const double borderRadiusInput = 12.0;

  static const int debounceTime = 1000;
  static const int limitDeliveryAddress = 10;
  static const int limitPageSize = 20;

  static const colorDataAlpha = {
    "a": Color.fromRGBO(226, 95, 81, 1),
    "b": Color.fromRGBO(242, 96, 145, 1),
    "c": Color.fromRGBO(187, 101, 202, 1),
    "d": Color.fromRGBO(149, 114, 207, 1),
    "e": Color.fromRGBO(120, 132, 205, 1),
    "f": Color.fromRGBO(91, 149, 249, 1),
    "g": Color.fromRGBO(72, 194, 249, 1),
    "h": Color.fromRGBO(69, 208, 226, 1),
    "i": Color.fromRGBO(38, 166, 154, 1),
    "j": Color.fromRGBO(82, 188, 137, 1),
    "k": Color.fromRGBO(155, 206, 95, 1),
    "l": Color.fromRGBO(212, 227, 74, 1),
    "m": Color.fromRGBO(254, 218, 16, 1),
    "n": Color.fromRGBO(247, 192, 0, 1),
    "o": Color.fromRGBO(255, 168, 0, 1),
    "p": Color.fromRGBO(255, 138, 96, 1),
    "q": Color.fromRGBO(194, 194, 194, 1),
    "r": Color.fromRGBO(143, 164, 175, 1),
    "s": Color.fromRGBO(162, 136, 126, 1),
    "t": Color.fromRGBO(163, 163, 163, 1),
    "u": Color.fromRGBO(175, 181, 226, 1),
    "v": Color.fromRGBO(179, 155, 221, 1),
    "w": Color.fromRGBO(194, 194, 194, 1),
    "x": Color.fromRGBO(124, 222, 235, 1),
    "y": Color.fromRGBO(188, 170, 164, 1),
    "z": Color.fromRGBO(173, 214, 125, 1),
  };
}

class StorageKeys {
  static const token = 'accessToken';
  static const refreshToken = "refreshToken";
  static const firstTime = "firstTime";
  static const cart = 'cart';
  static const userType = 'type';
  static const deliveryUnit = 'delivery_unit';
  static const delivery = 'delivery';
  static const status = 'status';
  static const orderStatus = 'order_status';
  static const type = 'type';
  static const gender = 'gender';
  static const commonData = 'commonData';
  static const viewedProduct = 'viewedProduct';
  static const fcmToken = 'fcm_token';
  static const searchHistory = 'searchHistory';
}

abstract class LevelAccount {
  static const ctv = "ctv";
  static const agency = "đại lý";
  static const distributor = "nhà phân phối";
}

abstract class LevelCodeAccount {
  static const ctv = "LV0";
  static const agency = "LV1";
  static const distributor = "LV2";
}

abstract class MinMaxQuantity {
  static const min = 1;
  static const max = 999;
}

abstract class SaleChannel {
  static const threeLevel = "3C";
  static const tradition = "GT";
}


const double defaultPadding = 12.0;
const double defaultBorderRadious = 12.0;
const Duration defaultDuration = Duration(milliseconds: 300);
bool isOnline = true;

// final passwordValidator = MultiValidator([
//   RequiredValidator(errorText: 'Password is required'),
//   MinLengthValidator(8, errorText: 'password must be at least 8 digits long'),
//   PatternValidator(r'(?=.*?[#?!@$%^&*-])',
//       errorText: 'passwords must have at least one special character')
// ]);

// final emaildValidator = MultiValidator([
//   RequiredValidator(errorText: 'Email is required'),
//   EmailValidator(errorText: "Enter a valid email address"),
// ]);

const pasNotMatchErrorText = "passwords do not match";
