import 'package:flutter/material.dart';
import 'package:pos_mobile/constant/color.dart';
import 'package:pos_mobile/widget/appbar.dart';
import 'package:pos_mobile/widget/form_login.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: Color(0XFFF8F7F4),
        appBar: MyAppBar(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20, right: 120),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("LET’S START TO IMPROVE YOUR SALES",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w900,
                          color: blackColor,
                        )),
                    Text(
                      "sign in with your shop account to start managing",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: blackColor,
                      ),
                    )
                  ]),
            ),
            FormLogin(),
          ],
        ));
  }
}
