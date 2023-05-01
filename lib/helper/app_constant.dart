class AppConstant {
  /// email validation pattern
  static const String emailRegex =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  /// password validation pattern
  static const String passwordRegex =
      r"^((?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,15}$)";

  /// name validation pattern
  static const String nameRegex =
      r"^\s*([A-Za-z]{1,}([\.,] |[-']|| ))+[A-Za-z]+\.?\s*$";

  /// mobile validation pattern
  static const String mobileRegex = r'(^(?:[+0]9)?[0-9]{6,10}$)';

  // URL validation pattern
  static const String urlRegex =
      r"(https?|http)://([-A-Z0-9.]+)(/[-A-Z0-9+&@#/%=~_|!:,.;]*)?(\?[A-Z0-9+&@#/%=~_|!:‌​,.;]*)?";

  // Website URL validation pattern
  static const String websiteUrlRegex =
      r'(?:(?:https?|ftp):\/\/)?[\w/\-?=%.]+\.[\w/\-?=%.]+';
}
