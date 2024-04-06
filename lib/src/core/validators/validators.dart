class Validator {
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    final emailRegExp = RegExp(
      r'^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    ); // Regex for email validation
    if (!emailRegExp.hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  // validate mobile
  static String? validateMobile(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your mobile number';
    }

    final phoneRegExp = RegExp(
      r'^(\+?\d{1,4}[\s-]?)?\d{10}$',
    ); // Regex for phone number validation
    if (!phoneRegExp.hasMatch(value)) {
      return 'Please enter a valid mobile number';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password';
    } else if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your name';
    }
    return null;
  }

  static String? validateFirstName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your first name';
    }
    return null;
  }

  static String? validateLastName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your last name';
    }
    return null;
  }

  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your phone number';
    }
    final phoneRegExp = RegExp(
      r'^\d{10}$',
    ); // Regex for phone number validation
    if (!phoneRegExp.hasMatch(value)) {
      return 'Please enter a valid phone number';
    }
    return null;
  }

  static String? validateAddress(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your address';
    }
    return null;
  }

  static String? validateCity(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your city';
    }
    return null;
  }

  static String? validateLicenseName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your name as in license';
    }
    return null;
  }

  static String? validateIssueDate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter the issue date';
    }

    final dateRegExp = RegExp(
      r'^\d{2}\/\d{2}\/\d{4}$',
    );

    if (!dateRegExp.hasMatch(value)) {
      return 'Please enter a valid date in the format dd/mm/yyyy';
    }
    return null;
  }

  static String? validateLicenseNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your license number';
    }
    return null;
  }

  static String? validateIssueState(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter the issue state';
    }
    return null;
  }
}
