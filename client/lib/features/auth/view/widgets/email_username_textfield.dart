import 'package:client/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';

class EmailUsernameTextfield extends StatefulWidget {
  final TextEditingController controller;
  final String text;
  const EmailUsernameTextfield({
    super.key,
    required this.controller,
    required this.text,
  });

  @override
  State<EmailUsernameTextfield> createState() => _EmailUsernameTextfieldState();
}

class _EmailUsernameTextfieldState extends State<EmailUsernameTextfield> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      keyboardType: TextInputType.text,
      style: const TextStyle(
        color: AppPallete.whiteColor,
        fontFamily: 'Gilroy',
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
