import 'package:flutter/material.dart';

class Styles {
  Styles._();

  /// 13/20/400
  static TextStyle s13() {
    return const TextStyle(fontSize: 13, height: 20 / 13);
  }

  /// 14/20/400
  static TextStyle s14() {
    return const TextStyle(fontSize: 14, height: 20 / 14);
  }

  /// 15/20/400
  static TextStyle s15() {
    return const TextStyle(fontSize: 15, height: 20 / 15);
  }

  /// 18/28/400
  static TextStyle s18() {
    return const TextStyle(fontSize: 18, height: 28 / 18);
  }

  /// 16/16/400
  static TextStyle s16() {
    return const TextStyle(fontSize: 16, height: 1);
  }

  /// 10/12/400
  static TextStyle s10() {
    return const TextStyle(fontSize: 10, height: 12 / 10);
  }

  /// 24/32/400
  static TextStyle s24() {
    return const TextStyle(fontSize: 24, height: 32 / 24);
  }

  /// 12/12/400
  static TextStyle s12() {
    return const TextStyle(fontSize: 12, height: 1);
  }

  /// 20/28/400
  static TextStyle s20() {
    return const TextStyle(fontSize: 20, height: 28 / 20);
  }

  /// 8/8/400
  static TextStyle s8() {
    return const TextStyle(fontSize: 8, height: 8 / 8);
  }
}

extension XStyles on TextStyle {
  TextStyle withColor(Color color) {
    return copyWith(color: color);
  }

  TextStyle withHeight(double height) {
    return copyWith(height: height);
  }

  TextStyle withSize(double fontSize) {
    return copyWith(fontSize: fontSize);
  }

  TextStyle withWeight(FontWeight fontWeight) {
    return copyWith(fontWeight: fontWeight);
  }

  TextStyle withStyle(FontStyle fontStyle) {
    return copyWith(fontStyle: fontStyle);
  }

  TextStyle withOverflow(TextOverflow overflow) {
    return copyWith(overflow: overflow);
  }

  TextStyle withLetterSpacing(double spacing) {
    return copyWith(letterSpacing: spacing);
  }
}
