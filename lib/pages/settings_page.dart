import 'package:flutter/material.dart';
import 'package:minimal_ecommerce_app/components/my_switch.dart';
import 'package:minimal_ecommerce_app/themes/theme_provider.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool light = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Settings"),
        centerTitle: true,
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          MySwitch(
            title: 'Dark mode',
            value: light,
            onChange: (bool value) {
              setState(() {
                light = value;
                Provider.of<ThemeProvider>(context, listen: false)
                    .toggleTheme();
              });
            },
          )
        ],
      ),
    );
  }
}
