import 'package:client/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Passwordtextfield extends StatefulWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final String text;
  const Passwordtextfield({
    super.key,
    required this.controller,
    required this.text,
    required this.focusNode,
  });

  @override
  State<Passwordtextfield> createState() => _PasswordtextfieldState();
}

class _PasswordtextfieldState extends State<Passwordtextfield> {
  bool _obscureText = true;
  bool showPasswordIcon = false;

  void toggleShowPassword() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: widget.focusNode,
      obscureText: _obscureText,
      controller: widget.controller,
      keyboardType: TextInputType.visiblePassword,
      style: const TextStyle(
        color: AppPallete.whiteColor,
        fontFamily: 'Gilroy',
      ),
      onChanged: (value) {
        setState(() {
          showPasswordIcon = value.isNotEmpty;
        });
      },
      onTapOutside: (PointerDownEvent event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      decoration: InputDecoration(
        hintText: widget.text,
        hintStyle: const TextStyle(
          color: Color.fromARGB(255, 121, 120, 120),
          fontFamily: 'Gilroy',
        ),
        suffixIcon: showPasswordIcon
            ? IconButton(
                highlightColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                style: const ButtonStyle(splashFactory: NoSplash.splashFactory),
                enableFeedback: true,
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                  HapticFeedback.heavyImpact();
                },
                icon: _obscureText
                    ? const ImageIcon(
                        AssetImage('assets/images/eyeIconOpen.png'),
                        color: AppPallete.whiteGreyColor,
                      )
                    : const ImageIcon(
                        AssetImage('assets/images/eyeIconClosed.png'),
                        color: AppPallete.whiteGreyColor,
                      ),
              )
            : null,
        floatingLabelBehavior: FloatingLabelBehavior.always,
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
