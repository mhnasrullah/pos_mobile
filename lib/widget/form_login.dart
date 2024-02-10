import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pos_mobile/constant/color.dart';
import 'package:pos_mobile/service/auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FormLogin extends StatefulWidget {
  const FormLogin({Key? key}) : super(key: key);

  @override
  State<FormLogin> createState() => _FormLoginState();
}

class _FormLoginState extends State<FormLogin> {
  final _formKey = GlobalKey<FormState>();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void handleLogin() async {
    ScaffoldFeatureController<SnackBar, SnackBarClosedReason> snackBar =
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Processing Data'),
    ));

    if (_formKey.currentState!.validate()) {
      final response = await AuthService.login(
          email: _emailController.text, password: _passwordController.text);

      if (!context.mounted) return;

      snackBar.close();
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body)["data"];

        await (await _prefs).setString('token', data["token"]);
        await (await _prefs).setString(
            "data",
            jsonEncode({
              "email": data["email"],
              "id": data["id"],
              "shopname": data["shopname"]
            }));

        if (!context.mounted) return;
        Navigator.pushReplacementNamed(context, "/main");
      } else {
        final message = jsonDecode(response.body)["message"][0]["message"];
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(message),
          backgroundColor: Colors.red,
        ));
      }
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Padding(
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 50, bottom: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text("Email"),
                  ),
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: const BorderSide(color: greyColor)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: const BorderSide(color: greyColor)),
                      contentPadding:
                          const EdgeInsets.only(left: 20, right: 20),
                      hintText: 'Enter your email',
                      labelStyle: const TextStyle(
                        color: blackColor,
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your email';
                      }
                      if (!value.contains('@')) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                    cursorColor: const Color(0XFF6E6D7A),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Text("Password"),
                    ),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: const BorderSide(color: greyColor)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: const BorderSide(color: greyColor)),
                        contentPadding:
                            const EdgeInsets.only(left: 20, right: 20),
                        hintText: 'Enter your password',
                        labelStyle: const TextStyle(
                          color: blackColor,
                        ),
                      ),
                      cursorColor: const Color(0XFF6E6D7A),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: SizedBox(
                        width: double.infinity,
                        height: 45,
                        child: FilledButton(
                          style: const ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll<Color>(blackColor)),
                          onPressed: handleLogin,
                          child: const Text(
                            "Enter",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: TextButton(
                  style: const ButtonStyle(
                      overlayColor:
                          MaterialStatePropertyAll<Color>(Colors.white)),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account? ",
                        style: TextStyle(color: blackColor),
                      ),
                      Text(
                        "Register",
                        style: TextStyle(
                            fontWeight: FontWeight.w700, color: blackColor),
                      )
                    ],
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/register');
                  },
                ),
              )
            ],
          ),
        ));
  }
}
