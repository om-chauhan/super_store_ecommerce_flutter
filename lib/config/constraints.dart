import 'package:flutter/material.dart';

class Constraints {
  Constraints._();

  static const String APP_TITLE = 'Super Store';

  //Color
  static const Color APP_BAR_HOME_BG_COLOR = Colors.white;
  static const Color RUPEES_COLOR = Color(0xff005DFF);
  static const Color APP_BAR_MENU_ICON_COLOR = Color(0xff005DFF);
  static const Color APP_BAR_HOME_TEXT1_COLOR = Color(0xff005DFF);
  static const Color APP_BAR_HOME_TEXT2_COLOR = Colors.green;

  //Menu
  static const List<String> MENU_NAME = [
    'Home',
    'My Cart',
    'GitHub',
    'About Us',
  ];
  static const List<IconData> MENU_ICON = [
    Icons.home,
    Icons.shopping_bag,
    Icons.code,
    Icons.info,
  ];
}
