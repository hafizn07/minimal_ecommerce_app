import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:minimal_ecommerce_app/components/my_list_tile.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  void signOut(context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushNamed(context, '/intro_page');
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              //drawer header:User
              DrawerHeader(
                child: Center(
                  child: StreamBuilder<User?>(
                    stream: FirebaseAuth.instance.authStateChanges(),
                    builder: (context, snapshot) {
                      //user is logged in
                      if (snapshot.hasData) {
                        String username = snapshot.data?.displayName ?? "User";
                        return InkWell(
                          onTap: () => signOut(context),
                          child: Text("Welcome, $username!"),
                        );
                      } else {
                        //user is not logged in
                        return InkWell(
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.pushNamed(context, '/login_page');
                          },
                          child: const Text('Sign In!'),
                        );
                      }
                    },
                  ),
                ),
              ),

              const SizedBox(height: 25),
              //shop tile
              MyListTile(
                title: "Shop",
                icon: Icons.home,
                onTap: () => Navigator.pop(context),
              ),

              //cart tile
              MyListTile(
                title: "Cart",
                icon: Icons.shopping_cart,
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/cart_page');
                },
              ),

              //settings tile
              MyListTile(
                title: "Settings",
                icon: Icons.settings_sharp,
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/settings_page');
                },
              ),
            ],
          ),
          //exit shop tile
          Padding(
            padding: const EdgeInsets.only(bottom: 25.0),
            child: MyListTile(
              title: "Exit",
              icon: Icons.logout,
              onTap: () => Navigator.pushNamedAndRemoveUntil(
                  context, '/intro_page', (route) => false),
            ),
          ),
        ],
      ),
    );
  }
}
