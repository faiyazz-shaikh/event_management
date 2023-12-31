import 'package:flutter/material.dart';
import 'package:flutter_app/core/resources/font_manager.dart';

TextStyle _getTextStyle(
  double fontSize,
  FontWeight fontWeight,
  Color color,
  FontStyle fontStyle,
) {
  return TextStyle(
    fontSize: fontSize,
    fontFamily: FontConstants.fontFamily,
    color: color,
    fontWeight: fontWeight,
    fontStyle: fontStyle,
  );
}

TextStyle _getTextStyleWithNoSize(
  FontWeight fontWeight,
  Color color,
  FontStyle fontStyle,
) {
  return TextStyle(
    fontFamily: FontConstants.fontFamily,
    color: color,
    fontWeight: fontWeight,
    fontStyle: fontStyle,
  );
}

TextStyle _whichTextStyle(
  double fontSize,
  FontWeight fontWeight,
  Color color,
  FontStyle fontStyle,
) {
  return fontSize == 0
      ? _getTextStyleWithNoSize(fontWeight, color, fontStyle)
      : _getTextStyle(fontSize, fontWeight, color, fontStyle);
}

TextStyle getLightStyle({
  required Color color,
  double fontSize = FontSize.s0,
  FontStyle fontStyle = FontStyle.normal,
}) {
  return _whichTextStyle(fontSize, FontWeightManager.light, color, fontStyle);
}

TextStyle getNormalStyle({
  required Color color,
  double fontSize = FontSize.s0,
  FontStyle fontStyle = FontStyle.normal,
}) {
  return _whichTextStyle(
    fontSize,
    FontWeightManager.regular,
    color,
    fontStyle,
  );
}

TextStyle getMediumStyle({
  required Color color,
  double fontSize = FontSize.s0,
  FontStyle fontStyle = FontStyle.normal,
}) {
  return _whichTextStyle(
    fontSize,
    FontWeightManager.medium,
    color,
    fontStyle,
  );
}

TextStyle getBoldStyle({
  required Color color,
  double fontSize = FontSize.s0,
  FontStyle fontStyle = FontStyle.normal,
}) {
  return _whichTextStyle(fontSize, FontWeightManager.bold, color, fontStyle);
}
