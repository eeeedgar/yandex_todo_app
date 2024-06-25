import 'package:flutter/material.dart';

@immutable
class CustomAppColors extends ThemeExtension<CustomAppColors> {
  const CustomAppColors(
      {required this.supportSeparator,
      required this.supportOverlay,
      required this.labelPrimary,
      required this.labelSecondary,
      required this.labelTertiary,
      required this.labelDisable,
      required this.red,
      required this.green,
      required this.blue,
      required this.gray,
      required this.grayLight,
      required this.white,
      required this.backPrimary,
      required this.backSecondary,
      required this.backElevated});

  factory CustomAppColors.light() => const CustomAppColors(
        supportSeparator: Color.fromRGBO(0, 0, 0, 0.2),
        supportOverlay: Color.fromRGBO(0, 0, 0, 0.06),
        labelPrimary: Color.fromRGBO(0, 0, 0, 1),
        labelSecondary: Color.fromRGBO(0, 0, 0, 0.6),
        labelTertiary: Color.fromRGBO(0, 0, 0, 0.3),
        labelDisable: Color.fromRGBO(0, 0, 0, 0.15),
        red: Color.fromRGBO(255, 59, 48, 1),
        green: Color.fromRGBO(52, 199, 89, 1),
        blue: Color.fromRGBO(0, 122, 255, 1),
        gray: Color.fromRGBO(142, 142, 147, 1),
        grayLight: Color.fromRGBO(209, 209, 214, 1),
        white: Color.fromRGBO(255, 255, 255, 1),
        backPrimary: Color.fromRGBO(247, 246, 242, 1),
        backSecondary: Color.fromRGBO(255, 255, 255, 1),
        backElevated: Color.fromRGBO(255, 255, 255, 1),
      );

  factory CustomAppColors.dark() => const CustomAppColors(
        supportSeparator: Color.fromRGBO(255, 255, 255, 0.2),
        supportOverlay: Color.fromRGBO(0, 0, 0, 0.32),
        labelPrimary: Color.fromRGBO(255, 255, 255, 1),
        labelSecondary: Color.fromRGBO(255, 255, 255, 0.6),
        labelTertiary: Color.fromRGBO(255, 255, 255, 0.4),
        labelDisable: Color.fromRGBO(255, 255, 255, 0.15),
        red: Color.fromRGBO(255, 69, 58, 1),
        green: Color.fromRGBO(50, 215, 75, 1),
        blue: Color.fromRGBO(10, 132, 255, 1),
        gray: Color.fromRGBO(142, 142, 147, 1),
        grayLight: Color.fromRGBO(72, 72, 74, 1),
        white: Color.fromRGBO(255, 255, 255, 1),
        backPrimary: Color.fromRGBO(22, 22, 24, 1),
        backSecondary: Color.fromRGBO(37, 37, 40, 1),
        backElevated: Color.fromRGBO(60, 60, 63, 1),
      );

  final Color? supportSeparator;
  final Color? supportOverlay;
  final Color? labelPrimary;
  final Color? labelSecondary;
  final Color? labelTertiary;
  final Color? labelDisable;
  final Color? red;
  final Color? green;
  final Color? blue;
  final Color? gray;
  final Color? grayLight;
  final Color? white;
  final Color? backPrimary;
  final Color? backSecondary;
  final Color? backElevated;

  @override
  CustomAppColors copyWith({
    Color? supportSeparator,
    Color? supportOverlay,
    Color? labelPrimary,
    Color? labelSecondary,
    Color? labelTertiary,
    Color? labelDisable,
    Color? red,
    Color? green,
    Color? blue,
    Color? gray,
    Color? grayLight,
    Color? white,
    Color? backPrimary,
    Color? backSecondary,
    Color? backElevated,
  }) {
    return CustomAppColors(
      supportSeparator: supportSeparator ?? this.supportSeparator,
      supportOverlay: supportOverlay ?? this.supportOverlay,
      labelPrimary: labelPrimary ?? this.labelPrimary,
      labelSecondary: labelSecondary ?? this.labelSecondary,
      labelTertiary: labelTertiary ?? this.labelTertiary,
      labelDisable: labelDisable ?? this.labelDisable,
      red: red ?? this.red,
      green: green ?? this.green,
      blue: blue ?? this.blue,
      gray: gray ?? this.gray,
      grayLight: grayLight ?? this.grayLight,
      white: white ?? this.white,
      backPrimary: backPrimary ?? this.backPrimary,
      backSecondary: backSecondary ?? this.backSecondary,
      backElevated: backElevated ?? this.backElevated,
    );
  }

  @override
  CustomAppColors lerp(CustomAppColors? other, double t) {
    if (other is! CustomAppColors) {
      return this;
    }
    return CustomAppColors(
      supportSeparator: Color.lerp(supportSeparator, other.supportSeparator, t),
      supportOverlay: Color.lerp(supportOverlay, other.supportOverlay, t),
      labelPrimary: Color.lerp(labelPrimary, other.labelPrimary, t),
      labelSecondary: Color.lerp(labelSecondary, other.labelSecondary, t),
      labelTertiary: Color.lerp(labelTertiary, other.labelTertiary, t),
      labelDisable: Color.lerp(labelDisable, other.labelDisable, t),
      red: Color.lerp(red, other.red, t),
      green: Color.lerp(green, other.green, t),
      blue: Color.lerp(blue, other.blue, t),
      gray: Color.lerp(gray, other.gray, t),
      grayLight: Color.lerp(grayLight, other.grayLight, t),
      white: Color.lerp(white, other.white, t),
      backPrimary: Color.lerp(backPrimary, other.backPrimary, t),
      backSecondary: Color.lerp(backSecondary, other.backSecondary, t),
      backElevated: Color.lerp(backElevated, other.backElevated, t),
    );
  }
}
