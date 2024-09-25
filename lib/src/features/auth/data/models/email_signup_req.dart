import 'dart:io';

class EmailSignUpReq {
  EmailSignUpReq({
    required this.email,
    required this.password,
    required this.firstName,
    required this.lastName,
    required this.mobile,
    this.avatarUrl,
    this.avararFile,
  });

  final String email;
  final String password;
  final String firstName;
  final String lastName;
  final String mobile;
  final String? avatarUrl;
  final File? avararFile;
}
