import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool isSecure;
  final bool isReadOnly;
  final bool needSuffixIcon;
  final IconData icon;
  final Function onTap;
  CustomTextField(
      {this.hintText, this.controller, this.keyboardType, this.isSecure,this.isReadOnly,this.icon,this.needSuffixIcon,this.onTap});

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
      ),
      child: TextFormField(
        onTap: widget.onTap,
        controller: widget.controller,
        obscureText: widget.isSecure,
        keyboardType: widget.keyboardType,
        readOnly: widget.isReadOnly,
        decoration: InputDecoration(
          disabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          hintText: "${widget.hintText}",

          contentPadding: EdgeInsets.symmetric(horizontal: 24),
          focusColor: Color(0XFFFC6A57),
          suffixIcon: widget.needSuffixIcon ?  Icon(widget.icon,color: Color(0XFF1E2039),) : null,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}
