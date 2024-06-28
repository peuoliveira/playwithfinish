// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class AppIconButton extends StatelessWidget {
  final void Function() onPressed;
  final Widget icon;

  const AppIconButton({
    Key? key,
    required this.onPressed,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: icon,
      //  Icon(
      //   icon,
      //   color: Colors.white,
      //   size: 42,
      // ),
      // tooltip: 'Open Navigation Menu', // TODO:
    );
  }
}
