class ObscureTextUtil {
  ObscureTextUtil._();

  static String obscureText(String text) {
    return text.replaceAll(RegExp('.'), '*');
  }

  static String obfuscateEmail(String email) {
    // Split the email into the local part and domain part
    final parts = email.split('@');
    if (parts.length != 2) {
      // Return the original email if it doesn't contain exactly one @ symbol
      return email;
    }

    final localPart = parts[0];
    final domainPart = parts[1];

    // Ensure there's enough length to obfuscate
    if (localPart.length > 2) {
      final obfuscatedLocal = localPart[0] +
          '*' * (localPart.length - 2) +
          localPart[localPart.length - 1];
      return '$obfuscatedLocal@$domainPart';
    } else {
      // If the local part is too short, return it as is
      return email;
    }
  }
}
