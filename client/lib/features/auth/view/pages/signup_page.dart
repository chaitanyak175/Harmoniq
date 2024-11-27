import 'package:client/constants/assets_constants.dart';
import 'package:client/core/theme/app_pallete.dart';
import 'package:client/features/auth/view/pages/login_page.dart';
import 'package:client/features/auth/view/widgets/email_textfield.dart';
import 'package:client/features/auth/view/widgets/password_textfield.dart';
import 'package:client/features/auth/view/widgets/signup_button.dart';
import 'package:client/features/auth/view/widgets/username_textfield.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  static route() => MaterialPageRoute(builder: (context) => const SignupPage());
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
  final _scrollController = ScrollController();
  final _passwordFocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();

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

    _passwordFocusNode.addListener(() {
      if (_passwordFocusNode.hasFocus) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _scrollController.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        scrolledUnderElevation: 0.0,
        backgroundColor: AppPallete.blackColor,
        automaticallyImplyLeading: false,
        title: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                AssetsConstants.appIcon,
                width: 70,
                height: 70,
              ),
              const Text(
                'Harmoniq',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Lovelace',
                  fontSize: 22,
                ),
              )
            ],
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        controller: _scrollController,
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 60,
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
                height: 60,
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
                child: UsernameTextfield(
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
                child: EmailTextfield(
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
                  focusNode: _passwordFocusNode,
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
                height: 120,
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
              const SizedBox(
                height: 10,
              ),
              Center(
                child: RichText(
                  text: TextSpan(
                    text: 'Already have an account?',
                    style: const TextStyle(
                      fontSize: 16,
                      color: AppPallete.whiteColor,
                      fontFamily: 'Gilroy',
                    ),
                    children: [
                      TextSpan(
                        text: ' Log In',
                        style: const TextStyle(
                          color: AppPallete.pinkColor,
                          fontSize: 16,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushReplacement(
                              context,
                              LoginPage.route(),
                            );
                          },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
