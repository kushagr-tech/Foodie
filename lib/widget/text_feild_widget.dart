// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class TextFeildWidget extends StatefulWidget {
  final TextInputType keyboardType;
  final IconData icon;
  final String title_text;  
  final TextEditingController controller;  
  final Color color;

  const TextFeildWidget({super.key, required this.keyboardType, required this.icon, required this.title_text, required this.color, required this.controller});

  @override
  State<TextFeildWidget> createState() => _TextFeildWidgetState();
}

class _TextFeildWidgetState extends State<TextFeildWidget> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
                  keyboardType: widget.keyboardType,
                  decoration: InputDecoration(
                    prefixIcon: Icon(widget.icon , color: widget.color),
                    hintText: widget.title_text,
                    hintStyle: TextStyle(color: widget.color),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: widget.color),
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: widget.color),
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                  ),
                  style: TextStyle(color: widget.color),
                );
  }
}