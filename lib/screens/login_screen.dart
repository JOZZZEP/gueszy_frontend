import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gueszy/api/user_service.dart';
import 'package:gueszy/controller/user_control.dart';
import 'package:gueszy/screens/menu/menu_screen.dart';
import 'package:gueszy/screens/menu/register_screen.dart';
import 'package:gueszy/widgets/rounded_text_field.dart';
import 'package:gueszy/widgets/text_custom.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String username = "";
  String password = "";
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const TextCustom(
                      "LOGIN",
                      size: 50,
                      isBold: true,
                      color: Colors.white,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    RoundedTextField(
                      "Username",
                      onChanged: (value) => setState(() {
                        username = value;
                      }),
                    ),
                    RoundedTextField(
                      "Password",
                      isPassword: true,
                      icon: Icons.lock,
                      onChanged: (value) => setState(() {
                        password = value;
                      }),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.amber),
                      child: const TextCustom(
                        "Login",
                        size: 20,
                        isBold: true,
                      ),
                      onPressed: () {
                        UserServices.postUser(
                                {"name": username, "password": password})
                            .then((user) => {
                                  setState(() {
                                    if (user.id != 0) {
                                      Get.put(UserControl(
                                          id: user.id,
                                          name: user.name,
                                          password: user.password,
                                          gueszyId: user.gueszyId));
                                      Get.off(() => const MenuScreen());
                                    }
                                  })
                                });
                      },
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const TextCustom(
                          "Don't have an account?",
                          color: Colors.white,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        ElevatedButton(
                          child: const TextCustom("Sign Up", isBold: true),
                          onPressed: () {
                            Get.off(() => const RegisterPage());
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
