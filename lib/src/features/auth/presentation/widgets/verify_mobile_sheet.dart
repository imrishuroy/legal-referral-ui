import 'package:flutter/material.dart';

class VerifyMobileBottonSheet extends StatefulWidget {
  const VerifyMobileBottonSheet({
    required this.mobileNo,
    required this.onVerify,
    required this.onChangeMobileNo,
    required this.onResend,
    super.key,
  });

  final String mobileNo;
  final Function(String) onVerify;
  final Function() onChangeMobileNo;
  final Function() onResend;

  @override
  State<VerifyMobileBottonSheet> createState() =>
      _VerifyEmailBottonSheetState();
}

class _VerifyEmailBottonSheetState extends State<VerifyMobileBottonSheet> {
  final _otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }
}
