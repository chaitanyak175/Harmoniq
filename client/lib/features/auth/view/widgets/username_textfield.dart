import 'package:client/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';

class UsernameTextfield extends StatefulWidget {
  final TextEditingController controller;
  final String text;
  const UsernameTextfield({
    super.key,
    required this.controller,
    required this.text,
  });

  @override
  State<UsernameTextfield> createState() => _UsernameTextfieldState();
}

class _UsernameTextfieldState extends State<UsernameTextfield> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value!.trim().isEmpty) {
          return "Name is missing!";
        }
        return null;
      },
      controller: widget.controller,
      keyboardType: TextInputType.name,
      textCapitalization: TextCapitalization.words,
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
