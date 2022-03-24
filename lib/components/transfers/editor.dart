import 'package:flutter/material.dart';

class Editor extends StatelessWidget {
  final TextEditingController? controller;
  final String? label;
  final String? hint;
  final IconData? icon;

  const Editor({Key? key, this.controller, this.label, this.hint, this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: controller,
        style: const TextStyle(fontSize: 12),
        decoration: InputDecoration(label: Text(label!), hintText: hint, icon: icon != null ? Icon(icon) : null),
        keyboardType: TextInputType.number,
      ),
    );
  }
}