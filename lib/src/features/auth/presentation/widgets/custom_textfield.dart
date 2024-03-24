// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String labelText;
  final String? Function(String?)? validator;
  const CustomTextField({
    required this.controller,
    required this.hintText,
    required this.labelText,
    super.key,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            labelText,
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: Color.fromRGBO(0, 0, 0, 1),
            ),
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: controller,
            // focusNode: _model.textFieldFocusNode,
            autofocus: true,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: Color.fromRGBO(168, 164, 168, 1),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color.fromRGBO(131, 166, 193, 1),
                ),
                borderRadius: BorderRadius.circular(4),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color.fromRGBO(131, 166, 193, 1),
                ),
                borderRadius: BorderRadius.circular(4),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color.fromRGBO(131, 166, 193, 1),
                ),
                borderRadius: BorderRadius.circular(4),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color.fromRGBO(131, 166, 193, 1),
                ),
                borderRadius: BorderRadius.circular(4),
              ),
              filled: true,
              fillColor: const Color.fromRGBO(255, 255, 255, 1),
            ),
            // style: FlutterFlowTheme.of(context).bodyMedium,
            validator: validator,
          ),
        ],
      ),
    );
  }
}
