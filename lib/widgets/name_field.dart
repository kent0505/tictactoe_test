import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NameField extends StatelessWidget {
  const NameField({
    super.key,
    required this.controller,
    required this.hintText,
  });

  final TextEditingController controller;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: Color(0xff204AA1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: TextField(
        controller: controller,
        inputFormatters: [
          LengthLimitingTextInputFormatter(20),
        ],
        textCapitalization: TextCapitalization.sentences,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontFamily: 'w400',
        ),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            vertical: 0,
            horizontal: 12,
          ),
          hintText: hintText,
          hintStyle: TextStyle(
            color: Color(0xff8793A8),
            fontSize: 14,
            fontFamily: 'w400',
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
        ),
        onTapOutside: (event) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
      ),
    );
  }
}
