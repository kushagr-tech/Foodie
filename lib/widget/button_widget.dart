import 'package:flutter/material.dart';
import '../constants/constants.dart';

class ButtonWidget extends StatefulWidget {
  final String title;
  final double width;
  final Function onPressed;
  final BuildContext context;
  const ButtonWidget({super.key, required this.title, required this.width, required this.onPressed, required this.context});

  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
                  width: widget.width,
                  child: ElevatedButton(
                    onPressed: () {widget.onPressed(context);},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ThemeWhite,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 16.0),
                      child: Text(
                        widget.title,
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: ThemeOrangeAccent,
                        ),
                      ),
                    ),
                  ),
                );
  }
}