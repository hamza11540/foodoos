import 'package:flutter/material.dart';

InputDecoration customInputDecoration(
    {String? labelText,
      Icon? prefixIcon,
      Widget? suffixIcon,
      TextStyle? labelTextStyle,
      String? hintText,
      TextStyle? hintTextStyle}) {
  return InputDecoration(
    suffixIcon: suffixIcon,
    labelText: labelText,
    labelStyle: labelTextStyle,
    hintText: hintText,
    prefixIcon: prefixIcon,
    hintStyle: hintTextStyle,
    counterText: "",
    filled: true,
    fillColor:  Colors.white,
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50),
        borderSide: const BorderSide(width: 0.2, color: Color(0xffF8F8F7))),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50),
        borderSide: const BorderSide(width: 0.6, color: Color(0xffF8F8F7))),
    border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50),
        borderSide: const BorderSide(width: 0.2, color: Color(0xffF8F8F7))),
      contentPadding: const EdgeInsets.only(top: 23, bottom: 23)

  );
}
