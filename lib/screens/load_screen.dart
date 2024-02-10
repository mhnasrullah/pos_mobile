import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pos_mobile/constant/color.dart';
import 'package:pos_mobile/service/auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoadScreen extends StatefulWidget {
  const LoadScreen({Key? key}) : super(key: key);

  @override
  State<LoadScreen> createState() => _LoadScreenState();
}

class _LoadScreenState extends State<LoadScreen> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  void _checkToken() async {
    try {
      final String token = (await _prefs).getString('token') ?? "";
      final response = await AuthService.checkToken(token: token);

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
        if (!context.mounted) return;
        Navigator.pushReplacementNamed(context, "/login");
      }
    } catch (e) {
      Navigator.pushReplacementNamed(context, "/login");
    }
  }

  @override
  void initState() {
    super.initState();
    _checkToken();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: const Color(0xFFE9EADD),
          ),
          child: const Text(
            'TUKUO',
            style: TextStyle(
              color: blackColor,
              fontFamily: 'Lato',
              fontWeight: FontWeight.w700,
              fontSize: 20,
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 16),
          child: SizedBox(
            width: 16,
            height: 16,
            child: CircularProgressIndicator(
              color: blackColor,
              strokeWidth: 2,
              strokeCap: StrokeCap.square,
            ),
          ),
        )
      ],
    )));
  }
}
