class RegexUtil {
  static bool _regexMatch(String str, String regex) =>
      RegExp(regex).hasMatch(str);

  static const _regNumbers = [
    '^[0-9]*\$', // 数字
    '^([1-9][0-9]*)+(.[0-9]{1,2})?\$', // 非零开头的最多带两位小数的数字
    '^(\\-)?\\d+(\\.\\d{1,2})?\$', // 带1-2位小数的正数或负数
    '^(\\-|\\+)?\\d+(\\.\\d+)?\$', // 正数、负数、和小数
    '^[0-9]+(.[0-9]{2})?\$', // 有两位小数的正实数
    '^[0-9]+(.[0-9]{1,3})?\$', // 有1~3位小数的正实数
    '^[1-9]\\d*\$', // 非零的正整数
    '^-[1-9]\\d*\$', // 非零的负整数
    '^\\d+\$', // 非负整数
    '^-[1-9]\\d*|0\$', // 非正整数
    '^\\d+(\\.\\d+)?\$', // 非负浮点数
    '^((-\\d+(\\.\\d+)?)|(0+(\\.0+)?))\$', // 非正浮点数
    '^[1-9]\\d*\\.\\d*|0\\.\\d*[1-9]\\d*\$', // 正浮点数
    '^-([1-9]\\d*\\.\\d*|0\\.\\d*[1-9]\\d*)\$', // 负浮点数
    '^(-?\\d+)(\\.\\d+)?\$' // 浮点数
  ];

  static const _regStrings = [
    '^[\\u4e00-\\u9fa5]{0,}\$', // 汉字
    '^[A-Za-z0-9]+\$', // 英文和数字
    '^[A-Za-z]+\$', // 由26个英文字母组成的字符串
    '^[A-Z]+\$', // 由26个大写英文字母组成的字符串
    '^[a-z]+\$', // 由26个小写英文字母组成的字符串
    '^[a-z0-9A-Z_]+\$', // 由数字、26个英文字母或者下划线组成的字符串
    '^[\\u4E00-\\u9FA5A-Za-z0-9_]+\$', // 中文、英文、数字包括下划线
    '^[\\u4E00-\\u9FA5A-Za-z0-9]+\$', // 中文、英文、数字但不包括下划线等符号
    "[^%&',;=?\$\\x22]+", // 可以输入含有^%&',;=?$\"等字符
    '[^~\\x22]+' // 含有~的字符
  ];

  static bool isStringReg(String str, int type) =>
      _regexMatch(str, _regStrings[type]);
  static bool isNumberReg(String str, int type) =>
      _regexMatch(str, _regNumbers[type]);
  static bool isEmail(String str) =>
      _regexMatch(str, '^\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*\$');
  static bool isPhoneNumber(String str) =>
      _regexMatch(str, '^(\\(\\d{3,4}-)|\\d{3.4}-)?\\d{7,8}\$');
  static bool isCellPhoneNumber(String str) => _regexMatch(str,
      '^(13[0-9]|14[5|7]|15[0|1|2|3|5|6|7|8|9]|18[0|1|2|3|5|6|7|8|9])\\d{8}\$');
  static bool isChinesePhoneNumber(String str) =>
      _regexMatch(str, '\\d{3}-\\d{8}|\\d{4}-\\d{7}');
  static bool isIdCardNumber(String str) =>
      _regexMatch(str, '^\\d{15}|\\d{18}\$');
  static bool isShortIdCardNumber(String str) =>
      _regexMatch(str, '^([0-9]){7,18}(x|X)?\$');
  static bool isUrl(String str) => _regexMatch(str, '[a-zA-z]+://[^\\s]*');
  static bool isDomain(String str) => _regexMatch(str,
      '[a-zA-Z0-9][-a-zA-Z0-9]{0,62}(/.[a-zA-Z0-9][-a-zA-Z0-9]{0,62})+/.?');
  static bool isValidAccount(String str) =>
      _regexMatch(str, '^[a-zA-Z][a-zA-Z0-9_]{5,31}\$');
  static bool isValidPassword(String str) =>
      _regexMatch(str, '^[a-zA-Z]\\w{5,31}\$');
  static bool isStrongPassword(String str) =>
      _regexMatch(str, '^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z]).{8,10}\$');
  static bool isDate(String str) =>
      _regexMatch(str, '^\\d{4}-\\d{1,2}-\\d{1,2}');
  static bool isValidXml(String str) =>
      _regexMatch(str, '^([a-zA-Z]+-?)+[a-zA-Z0-9]+\\\\.[x|X][m|M][l|L]\$');
  static bool isBlankLine(String str) => _regexMatch(str, '\\n\\s*\\r');
  static bool isValidHtml(String str) =>
      _regexMatch(str, '<(\\S*?)[^>]*>.*?</\\1>|<.*? />');
  static bool isValidQQNumber(String str) => _regexMatch(str, '[1-9][0-9]{4,}');
  static bool isValidPostCode(String str) =>
      _regexMatch(str, '[1-9]\\d{5}(?!\\d)');
  static bool isValidIPAddress(String str) => _regexMatch(str,
      '((?:(?:25[0-5]|2[0-4]\\\\d|[01]?\\\\d?\\\\d)\\\\.){3}(?:25[0-5]|2[0-4]\\\\d|[01]?\\\\d?\\\\d))');
}
