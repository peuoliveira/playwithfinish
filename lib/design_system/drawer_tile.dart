import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:playwith_customer_app/constants.dart';

class DrawerTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const DrawerTile({
    Key? key,
    required this.icon,
    required this.label,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onTap,
      icon: FaIcon(
        icon,
        size: 16,
        color: Colors.white,
      ),
      label: Text(
        label,
        style: alertDialogTextStyle,
      ),
      style: signOutButtonDeco,
    );
  }
}
//  borderRadius: BorderRadius.circular(boxRadii),
//   color: _darkSecondaryColor,
