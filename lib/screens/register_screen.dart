import 'package:flutter/material.dart';
import 'package:pos_mobile/constant/color.dart';
import 'package:pos_mobile/widget/form_register.dart';
import 'package:pos_mobile/widget/appbar.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: Color(0XFFF8F7F4),
        appBar: MyAppBar(),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20, right: 120, top: 100),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("JOIN WITH US AND IMPROVE YOUR SALES",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w900,
                            color: blackColor,
                          )),
                      Text(
                        "create your shop account to start managing",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: blackColor,
                        ),
                      )
                    ]),
              ),
              FormRegister(),
            ],
          ),
        ));
    ;
  }
}
