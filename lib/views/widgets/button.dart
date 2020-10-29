import 'package:flutter/material.dart';

class AllRoundButton extends StatefulWidget {
  final String placeholder;
  final Function onTap;
  final Color textColor;
  final Color buttonColor;
  final double height;
  final double width;
  final FontWeight fontWeight;
  final bool busy;

  const AllRoundButton(
      {Key key,
      @required this.placeholder,
      this.onTap,
      this.buttonColor,
      this.textColor,
      @required this.height,
      @required this.width,
      this.fontWeight,
      this.busy = false})
      : super(key: key);
  @override
  _AllRoundButtonState createState() => _AllRoundButtonState();
}

class _AllRoundButtonState extends State<AllRoundButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        height: widget.height,
        width: widget.width,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              blurRadius: 5.0,
              color: Color(0x20000000),
              spreadRadius: 0.0,
              offset: Offset(3.5, 5.0),
            ),
          ],
          borderRadius: BorderRadius.circular(10),
          color: widget.buttonColor,
        ),
        child: Center(
          child: widget.busy
              ? CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(Colors.white))
              : Text(
                  widget.placeholder,
                  style: TextStyle(
                      color: widget.textColor,
                      fontSize: MediaQuery.of(context).size.height / 35,
                      fontWeight: widget.fontWeight),
                ),
        ),
      ),
    );
  }
}
