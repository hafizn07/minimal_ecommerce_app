import 'package:flutter/material.dart';

class MySwitch extends StatefulWidget {
  final String title;
  final bool value;
  final void Function(bool)? onChange;
  const MySwitch({
    super.key,
    required this.title,
    required this.value,
    required this.onChange,
  });

  @override
  State<MySwitch> createState() => _MySwitchState();
}

class _MySwitchState extends State<MySwitch> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.fromLTRB(15, 10, 15, 10),
      padding: const EdgeInsets.all(8),
      child: SwitchListTile.adaptive(
        applyCupertinoTheme: false,
        title: Text(widget.title),
        value: widget.value,
        onChanged: widget.onChange,
      ),
    );
  }
}
