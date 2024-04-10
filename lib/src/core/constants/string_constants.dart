class StringConstants {
  StringConstants._();

// dio exceptions
  static const dioExceptionCanceltxt = 'Request to API server was cancelled';
  static const dioExceptionConnectionTimeOutTxt =
      'Connection timeout with API server';
  static const dioExceptionreciveTimeoUt =
      'Receive timeout in connection with API server';
  static const dioExceptionConnectionErr = 'No Internet connection found';
  static const dioExceptionsendTimeout =
      'Send timeout in connection with API server';
  static const dioExceptionUnknowntxt = 'Unexpected error occurred';
  static const dioExcpetiondefaultError = 'Something went wrong';
  static const dioExceptionSomethingWentWrong = 'Oops something went wrong';
  static const dioExceptionSessionExpiredtxt =
      'Your session has expired. Please login again';

  // regexr
  static const String onlyAlphaNumRegexr = r'^[A-Za-z0-9]+$';
  static const String onlyNumericValueRegexr = r'^[0-9]*$';
  static const String onlyDecimalValueRegexr = r'^-?\d*(\.\d+)?$';
  static const String decimalValueMultipleOfPointFiveRegex =
      r'^[0-9]+(\.0|\.5)?$';
  static const String decialRangeZeroTo24Regex =
      r'^(0|24|([01]?[0-9]|2[0-3])(\.0|(\.[05])?)?)$';
  static const String numericRangeZeroTo200Regexr =
      r'^(([01]?[0-9]?[0-9])|(200))$';
  static const first4CharsAsLettersAndLast7AsDigitsWithNoSpclCharsRegexr =
      r'^(?=(?:[^A-Za-z\r\n]*[A-Za-z]){4})(?=(?:[^0-9\r\n]*[0-9]){7})[A-Za-z0-9]+$';
  static const alphaNumericWithSpaceRegexr =
      r'^[-a-zA-Z0-9-()]+(\s+[-a-zA-Z0-9-()]+)*$';
  static const alphaNumericCharsWithNoSpaceStartOrEndRegexr =
      r'^(?! )[A-Za-z0-9]+(?: [A-Za-z0-9]+)*(?! )$';
  static const alphaNumericCharsWithNoSpaceRegexr = r'^[a-zA-Z0-9,]*$';
  static const noSpaceAllowedBtwValuesRegexr = r'^\S*$';
  //static const onlyDoubleCharsRegexr = r'^0*[1-9]\d*\.?\d{1,3}$';
  static const onlyDoubleCharsRegexr =
      r'^(0*\.([1-9]\d{0,2}|\d[1-9]\d{0,1}|\d{2}[1-9])|[1-9]\d*(\.\d{1,3})?)$';
  //static const onlyNumericCharsRegexr = r'^0*[1-9]\d*$';
  static const onlyAlphaCharsRegexr = r'^[a-zA-Z0 ]*$';
  static const onlyCharsRegexr = r'^[a-zA-Z]+$';
  static const onlyDigitsRegexr = r'^[0-9]+$';
  static const noLeadingTrailingSpaceRegexr = r'^\S(.*\S)?$';
  static const alphanumericOnlyRegexr = r'^[a-zA-Z0-9 ]*$';
}
