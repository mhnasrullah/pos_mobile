import 'package:flutter/material.dart';
import 'package:pos_mobile/constant/color.dart';

class FormRegister extends StatefulWidget {
  const FormRegister({Key? key}) : super(key: key);

  @override
  State<FormRegister> createState() => _FormRegisterState();
}

class _FormRegisterState extends State<FormRegister> {
  final _formKey = GlobalKey<FormState>();

  final shopnameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmationPasswordController = TextEditingController();

  void handleLogin() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Processing Data')));
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
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
                    child: Text("Shop Name"),
                  ),
                  TextFormField(
                    controller: shopnameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: const BorderSide(color: greyColor)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: const BorderSide(color: greyColor)),
                      contentPadding:
                          const EdgeInsets.only(left: 20, right: 20),
                      hintText: 'Enter your shop name',
                      labelStyle: const TextStyle(
                        color: blackColor,
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your shopname';
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
                      child: Text("Email"),
                    ),
                    TextFormField(
                      controller: emailController,
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
                      controller: passwordController,
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
                    )
                  ],
                )),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Text("Confirmation Password"),
                    ),
                    TextFormField(
                      controller: confirmationPasswordController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your confirmation password';
                        }

                        if (value != passwordController.text) {
                          return 'Password does not match';
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
                        hintText: 'Enter your confirmation password',
                        labelStyle: const TextStyle(
                          color: blackColor,
                        ),
                      ),
                      cursorColor: const Color(0XFF6E6D7A),
                    )
                  ],
                )),
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
                      "Join",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
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
                        "You already have an account? ",
                        style: TextStyle(color: blackColor),
                      ),
                      Text(
                        "Enter here",
                        style: TextStyle(
                            fontWeight: FontWeight.w700, color: blackColor),
                      )
                    ],
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              )
            ],
          ),
        ));
  }
}
