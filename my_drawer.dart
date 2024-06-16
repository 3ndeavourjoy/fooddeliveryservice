import 'package:flutter/material.dart';
import 'package:fooddeliveryservice/components/my_drawer_tile.dart';
import 'package:fooddeliveryservice/pages/settings_page.dart';
import 'package:fooddeliveryservice/services/auth/auth_service.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer ({super.key});

  //logout method
  void logout (){
    final authService = AuthService();
    authService.signOut();
}

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        children: [
          //logo
          Padding(padding: const EdgeInsets.only(top: 100.0),
          child: Icon(
            Icons.food_bank_rounded,
            size: 100,
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
          ),

          Padding(padding: const EdgeInsets.all(25.0),
          child: Divider(
            color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          //home_tile
          MyDrawerTile(
            text: "H O M E",
            icon: Icons.home,
            onTap: () => Navigator.pop(context),
          ),

          MyDrawerTile(
            text: "S E T T I N G S",
            icon: Icons.settings,
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,MaterialPageRoute(
                builder: (context) => const SettingsPage(),
                ),
               );
              },
            ),
          const Spacer(),

          MyDrawerTile(
            text: "L O G O U T",
            icon: Icons.logout,
            onTap: () {
              logout();
              Navigator.pop(context);
            },
          ),

          const SizedBox(height: 25),
        ],
      )
    );
  }
}
