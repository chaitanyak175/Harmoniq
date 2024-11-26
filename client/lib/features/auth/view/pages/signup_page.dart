import 'package:client/core/theme/app_pallete.dart';
import 'package:client/features/auth/view/widgets/email_username_textfield.dart';
import 'package:client/features/auth/view/widgets/password_textfield.dart';
import 'package:client/features/auth/view/widgets/signup_button.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  String? passwordErrorMessage;
  bool isLoading = false;

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _passwordController.addListener(
      () {
        setState(() {
          passwordErrorMessage = _passwordController.text.length < 8 &&
                  _passwordController.text.isNotEmpty
              ? "Password should be at least 8 characters."
              : null;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: ListView(
          children: [
            const SizedBox(
              height: 80,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 25),
              child: Text(
                'Sign Up',
                style: TextStyle(
                  fontFamily: 'Nothing',
                  color: Colors.white,
                  fontSize: 40,
                ),
              ),
            ),
            const SizedBox(
              height: 80,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: RichText(
                text: const TextSpan(
                    text: 'Name',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Gilroy',
                      fontSize: 15,
                    ),
                    children: [
                      TextSpan(
                        text: '*',
                        style: TextStyle(
                          color: AppPallete.pinkColor,
                          fontSize: 15,
                        ),
                      ),
                    ]),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: Emailpasswordtextfield(
                controller: _nameController,
                text: 'Your Username',
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: RichText(
                text: const TextSpan(
                  text: 'Email',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Gilroy',
                    fontSize: 15,
                  ),
                  children: [
                    TextSpan(
                      text: '*',
                      style: TextStyle(
                        color: AppPallete.pinkColor,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: Emailpasswordtextfield(
                controller: _emailController,
                text: 'hello@company.com',
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: RichText(
                text: const TextSpan(
                    text: 'Password',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Gilroy',
                      fontSize: 15,
                    ),
                    children: [
                      TextSpan(
                        text: '*',
                        style: TextStyle(
                          color: AppPallete.pinkColor,
                          fontSize: 15,
                        ),
                      ),
                    ]),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: Passwordtextfield(
                controller: _passwordController,
                text: 'Your Password',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: SizedBox(
                height: 25,
                child: passwordErrorMessage != null
                    ? Text(
                        passwordErrorMessage!,
                        style: const TextStyle(
                          color: Color.fromARGB(255, 181, 57, 48),
                          fontFamily: 'Gilroy',
                        ),
                      )
                    : null,
              ),
            ),
            const SizedBox(
              height: 130,
            ),
            Center(
              child: SizedBox(
                width: 365,
                height: 50,
                child: SignupButton(
                  buttonText: 'Sign up',
                  onPressed: () {},
                  isLoading: isLoading,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
