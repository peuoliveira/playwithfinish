import 'package:flutter/material.dart';
import 'package:playwith_customer_app/core/services/auth_service.dart';
import 'package:playwith_customer_app/design_system/pw_scaffold.dart';
import 'package:playwith_customer_app/screens/lesson_menu_screen.dart';
import 'package:sign_in_button/sign_in_button.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    final appLogoWidth = MediaQuery.of(context).size.width / 4;

    return PWScaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/piano_guy_x2.png',
                  width: appLogoWidth,
                ),
                const Text(
                  'Bem vindo!',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'Acesse sua conta pelo google',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            SignInButton(
              Buttons.google,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              padding: EdgeInsets.zero,
              text: '    Login With Google', // 'Entrar Com Google'
              clipBehavior: Clip.antiAliasWithSaveLayer,
              elevation: 10,
              onPressed: () async {
                // TODO(Peu):
                final result = await AuthService.signInWithGoogle();
                if (result != null && mounted) {
                  Navigator.pushNamed(context, LessonMenuScreen.id);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
