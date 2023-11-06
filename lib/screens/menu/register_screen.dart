import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gueszy/screens/login_screen.dart';
import 'package:gueszy/widgets/rounded_text_field.dart';
import 'package:gueszy/widgets/text_custom.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 30,
              ),
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
                      "REGISTER",
                      size: 50,
                      isBold: true,
                      color: Colors.white,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const RoundedTextField(
                      "Username",
                    ),
                    const RoundedTextField(
                      "Password",
                      isPassword: true,
                      icon: Icons.lock,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.amber),
                      child: const TextCustom(
                        "Create Account",
                        size: 20,
                        isBold: true,
                      ),
                      onPressed: () {
                        Get.off(() => const RegisterPage());
                      },
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const TextCustom(
                          "have an Account?",
                          color: Colors.white,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        ElevatedButton(
                          child: const TextCustom("Login", isBold: true),
                          onPressed: () {
                            Get.off(() => const LoginScreen());
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
