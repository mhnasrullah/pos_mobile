import 'package:flutter/material.dart';
import 'package:pos_mobile/constant/color.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return myAppBar();
  }
}

Widget myAppBar() {
  return AppBar(
    surfaceTintColor: Colors.transparent,
    backgroundColor: bgColor,
    title: Container(
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
  );
}
