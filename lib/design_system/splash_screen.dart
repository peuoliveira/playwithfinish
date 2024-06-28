import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:playwith_customer_app/constants.dart';
import 'package:playwith_customer_app/design_system/pw_scaffold.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final splashLogoWidth = MediaQuery.of(context).size.width / 3;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeColors['Dark'],
      themeMode: ThemeMode.dark,
      home: PWScaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/logo.png',
                width: splashLogoWidth,
              ),
              const CircularProgressIndicator.adaptive(backgroundColor: Colors.white),
            ],
          ),
        ),
      ).animate().fadeIn(
            delay: const Duration(milliseconds: 0),
            duration: const Duration(milliseconds: 200),
          ),
    );
  }
}
