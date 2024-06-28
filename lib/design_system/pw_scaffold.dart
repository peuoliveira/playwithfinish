import 'package:flutter/material.dart';

class PWScaffold extends StatelessWidget {
  final Widget? drawer;
  final PreferredSizeWidget? appBar;
  final Widget body;
  @override
  final Key? key;

  const PWScaffold({
    Key? key,
    this.drawer,
    this.appBar,
    required this.body,
  })  : key = key,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final appBackgroundWidth = MediaQuery.of(context).size.width;
    final appBackgroundHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      key: key,
      drawer: drawer,
      appBar: appBar,
      body: Stack(
        children: [
          Opacity(
            opacity: 0.5,
            child: Image.asset(
              'assets/images/background.png',
              width: appBackgroundWidth,
              height: appBackgroundHeight,
              fit: BoxFit.cover,
            ),
          ),
          body,
        ],
      ),
    );
  }
}
