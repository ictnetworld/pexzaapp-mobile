import 'package:flutter/material.dart';

class InfoField extends StatefulWidget {
  final String placeholder;
  final bool obscure;
  final TextEditingController controller;
  final Widget suffix;
  final TextInputAction inputAction;
  final TextInputType inputType;
  final Function(String) validator;
  final FocusNode focusNode;
  final ValueChanged<String> onChanged;
  final ValueChanged<String> onSubmitted;
  final Widget prefix;
  final int textLength;
  final bool enabled;

  const InfoField(
      {Key key,
      @required this.placeholder,
      this.obscure = false,
      @required this.controller,
      this.suffix,
      this.inputAction,
      this.inputType,
      this.validator,
      this.focusNode,
      this.onChanged,
      this.onSubmitted,
      this.prefix,
      this.textLength,
      this.enabled = true})
      : super(key: key);

  @override
  _InfoFieldState createState() => _InfoFieldState();
}

class _InfoFieldState extends State<InfoField> {
  bool isVisible;

  @override
  void initState() {
    super.initState();
    isVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      child: TextFormField(
        maxLength: widget.textLength,
        onFieldSubmitted: widget.onSubmitted,
        onChanged: widget.onChanged,
        focusNode: widget.focusNode,
        validator: widget.validator,
        keyboardType: widget.inputType,
        textInputAction: widget.inputAction,
        obscureText: !isVisible && widget.obscure,
        controller: widget.controller,
        decoration: InputDecoration(
          enabled: widget.enabled,
          prefixIcon: widget.prefix,
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.green),
          ),
          suffixIcon: widget.obscure
              ? IconButton(
                  color: isVisible ? Colors.grey[800] : Color(0xff2079A5),
                  icon: isVisible
                      ? Icon(Icons.visibility_off)
                      : Icon(Icons.visibility),
                  onPressed: () {
                    setState(() {
                      isVisible = !isVisible;
                    });
                  },
                )
              : null,
          labelText: widget.placeholder,
          labelStyle: TextStyle(
            color: Colors.grey[300],
          ),
        ),
      ),
    );
  }
}
