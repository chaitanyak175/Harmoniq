import 'package:client/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';

class Emailpasswordtextfield extends StatefulWidget {
  final TextEditingController controller;
  final String text;
  const Emailpasswordtextfield({
    super.key,
    required this.controller,
    required this.text,
  });

  @override
  State<Emailpasswordtextfield> createState() => _EmailpasswordtextfieldState();
}

class _EmailpasswordtextfieldState extends State<Emailpasswordtextfield> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      keyboardType: TextInputType.text,
      style: const TextStyle(
        color: AppPallete.whiteColor,
      ),
      onTapOutside: (PointerDownEvent event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      decoration: InputDecoration(
        hintText: widget.text,
        hintStyle: const TextStyle(
          color: Color.fromARGB(255, 121, 120, 120),
          fontFamily: 'Gilroy',
        ),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: AppPallete.greyColor,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: AppPallete.whiteGreyColor,
          ),
        ),
      ),
    );
  }
}
