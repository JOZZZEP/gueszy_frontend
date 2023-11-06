import 'package:flutter/material.dart';
import 'package:gueszy/screens/menu/register_screen.dart';
import 'package:gueszy/widgets/round_button_float.dart';
import 'package:gueszy/widgets/rounded_text_field.dart';
import 'package:gueszy/widgets/text_custom.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Image(
                      image: NetworkImage(
                          'https://img.sgp1.vultrobjects.com/tutorial_1.png'),
                      // width: 20,
                      height: 300,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Column(
                  textDirection: TextDirection.ltr,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const TextCustom(
                      "Login",
                      size: 30,
                      isBold: true,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const RoundedTextField(
                      "user name",
                    ),
                    const RoundedTextField(
                      "password",
                      isPassword: true,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const RoundButtonFloat(
                      "Sign in",
                      textColor: Colors.black,
                      textSize: 20,
                      buttonColor: Colors.yellow,
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Row(
                      children: [
                        const TextCustom(
                          "Don't have an account?",
                          color: Colors.white,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        InkWell(
                          child: const TextCustom("Sign Up", isBold: true),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const RegisterPage()));
                          },
                        )
                      ],
                    )
                  ],
                ),
              )
              // Padding(padding: const EdgeInsets.only(),child: Image.network('https://img.sgp1.vultrobjects.com/tutorial_1.png'))
            ],
          ),
        ),
      ),
    );
  }
}
