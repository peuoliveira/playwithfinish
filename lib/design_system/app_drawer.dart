import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:playwith_customer_app/components/app_bar_with_settings_icon.dart';
import 'package:playwith_customer_app/constants.dart';
import 'package:playwith_customer_app/core/services/auth_service.dart';
import 'package:playwith_customer_app/design_system/drawer_tile.dart';
import 'package:playwith_customer_app/screens/note_helper_menu_screen.dart';
import 'package:playwith_customer_app/screens/settings_screen.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({
    Key? key,
  }) : super(key: key);

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    final User user = FirebaseAuth.instance.currentUser!;

    Widget getUserPhoto() {
      return CircleAvatar(
        backgroundImage:
            user.photoURL != null ? NetworkImage(user.photoURL ?? '') : null,
        radius: 40,
      );
    }

    Widget getUserName() {
      return Text(
        user.displayName ?? '',
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      );
    }

    Widget getUserEmail() {
      return Text(
        user.email ?? '',
        style: const TextStyle(
          fontSize: 16,
          color: Colors.white,
        ),
      );
    }

    return Drawer(
      backgroundColor: primaryColor,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    getUserPhoto(),
                    const SizedBox(height: 10),
                    getUserName(),
                    getUserEmail(),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              DrawerTile(
                icon: FontAwesomeIcons.cog,
                label: 'Settings',
                onTap: () {
                  Navigator.pushNamed(context, SettingsScreen.id);
                },
              ),
              DrawerTile(
                icon: helperButton,
                label: 'Help',
                onTap: () {
                  Navigator.pushNamed(context, NoteHelperMenuScreen.id);
                },
              ),
              DrawerTile(
                onTap: () async {
                  await AuthService.signOut();
                  Navigator.pop(context);
                },
                icon: FontAwesomeIcons.rightToBracket,
                label: 'Logout',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
