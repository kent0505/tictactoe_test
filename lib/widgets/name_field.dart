import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TxtField extends StatelessWidget {
  const TxtField({
    super.key,
    required this.controller,
    required this.hintText,
    this.length = 20,
    required this.onChanged,
  });

  final TextEditingController controller;
  final String hintText;

  final int length;
  final void Function() onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextField(
        controller: controller,

        // readOnly: true, // if date picker
        inputFormatters: [
          LengthLimitingTextInputFormatter(length),
        ],
        textCapitalization: TextCapitalization.sentences,
        style: const TextStyle(
          color: Colors.white,
          fontFamily: 'w400',
        ),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            vertical: 0,
            horizontal: 16,
          ),
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.white.withValues(alpha: 0.5),
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
        onChanged: (value) {
          onChanged();
        },
      ),
    );
  }
}
