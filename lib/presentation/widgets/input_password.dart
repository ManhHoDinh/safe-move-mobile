import 'package:flutter/material.dart';

import '../../core/constraints/color_palatte.dart';
import '../../core/helper/text_styles.dart';


class InputPassword extends StatefulWidget {
  final String labelText;
  final String icon;
  final String? suffixIcon;
  final bool? isPassword;
  final TextInputType? type;
  final TextEditingController? controller;
  final String? Function(String? input)? validator;
  const InputPassword(
      {super.key,
      required this.labelText,
      required this.icon,
      this.suffixIcon,
      this.isPassword,
      this.controller,
      this.validator,
      this.type});

  @override
  State<InputPassword> createState() => _InputPasswordState();
}

class _InputPasswordState extends State<InputPassword> {
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: widget.type,
      validator: widget.validator,
      controller: widget.controller,
      obscureText: isObscure,
      enableSuggestions: widget.isPassword ?? false,
      autocorrect: widget.isPassword ?? false,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(bottom: 14),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: ColorPalette.bgTextFieldColor,
          ),
        ),
        prefixIcon: Container(
          child: Image.asset(widget.icon),
          padding: const EdgeInsets.only(right: 16),
        ),
        prefixIconConstraints: BoxConstraints(
          minWidth: 24,
        ),
        suffixIcon: Container(
          child: widget.suffixIcon != null
            ? InkWell(
                onTap: () {
                  setState(() {
                    isObscure = !isObscure;
                  });
                },
                child: Image.asset(widget.suffixIcon!)
              )
            : Image.asset(widget.icon, opacity: const AlwaysStoppedAnimation(0),),
        ),
        suffixIconConstraints: BoxConstraints(
          minWidth: 24,
        ),
        label: Container(
          child: Text(
            widget.labelText,
            style: TextStyles.h6.setColor(ColorPalette.grayText),
          ),
        ),
      ),
      onTapOutside: (event) {},
    );
  }
}

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}