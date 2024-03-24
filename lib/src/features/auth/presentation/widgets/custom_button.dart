import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    required this.onTap,
    required this.text,
    super.key,
  });
  final VoidCallback onTap;

  final String text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 57,
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color.fromRGBO(89, 158, 217, 1),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: Color.fromRGBO(252, 252, 252, 1),
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
