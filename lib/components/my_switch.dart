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
      margin: const EdgeInsets.all(15),
      padding: const EdgeInsets.all(10),
      child: SwitchListTile(
        title: Text(widget.title),
        value: widget.value,
        onChanged: widget.onChange,
        activeColor: Theme.of(context).colorScheme.inversePrimary,
      ),
    );
  }
}
