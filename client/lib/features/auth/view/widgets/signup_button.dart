import 'package:client/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class SignupButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;
  final bool isLoading;
  const SignupButton({
    super.key,
    required this.buttonText,
    required this.onPressed,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        HapticFeedback.heavyImpact();
        onPressed();
      },
      style: ButtonStyle(
        shape: WidgetStatePropertyAll<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
        backgroundColor: const WidgetStatePropertyAll(AppPallete.pinkColor),
        // overlayColor: const WidgetStatePropertyAll(Colors.transparent),
        // shadowColor: const WidgetStatePropertyAll(Colors.transparent),
        splashFactory: InkRipple.splashFactory,
      ),
      child: isLoading
          ? LoadingAnimationWidget.staggeredDotsWave(
              color: AppPallete.whiteColor, size: 35.0)
          : Text(
              buttonText,
              style: const TextStyle(
                fontSize: 20,
                color: AppPallete.whiteColor,
                fontFamily: 'Gilroy',
              ),
            ),
    );
  }
}
