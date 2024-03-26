import 'package:flutter/material.dart';
import 'package:legal_referral_ui/src/core/constants/colors.dart';

class OtpWidget extends StatelessWidget {
  const OtpWidget({
    super.key,
    required this.text1,
    required this.text2,
    required this.text3,
    required this.text4,
  });
  final TextEditingController text1;
  final TextEditingController text2;
  final TextEditingController text3;
  final TextEditingController text4;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InputBox(digit: text1),
        const SizedBox(
          width: 16,
        ),
        InputBox(digit: text2),
        const SizedBox(
          width: 16,
        ),
        InputBox(digit: text3),
        const SizedBox(
          width: 16,
        ),
        InputBox(digit: text4),
      ],
    );
  }
}

class InputBox extends StatelessWidget {
  const InputBox({
    super.key,
    required this.digit,
  });

  final TextEditingController digit;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 54,
      width: 48,
      decoration: BoxDecoration(
          border:
              Border.all(width: 1, color: LegalReferralColors.borderBlue300),
          borderRadius: BorderRadius.circular(4)),
      child: TextField(
        cursorColor: LegalReferralColors.borderBlue300,
        textAlign: TextAlign.center,
        controller: digit,
        maxLength: 1,
        decoration: const InputDecoration(
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          focusColor: Colors.transparent,
          counterText: '',
        ),
        keyboardType: TextInputType.number,
        style: const TextStyle(fontSize: 30),
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
      ),
    );
  }
}
