import 'package:flutter/material.dart';

class ClickText extends StatefulWidget {
  final Text text;
  final Function onTap;

  const ClickText({Key key, this.text, this.onTap}) : super(key: key);
  @override
  _ClickTextState createState() => _ClickTextState();
}

class _ClickTextState extends State<ClickText> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: widget.text,
    );
  }
}