import 'package:flutter/material.dart';
import 'package:super_store/config/constraints.dart';

class SmallAppIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'SUPER',
          style: TextStyle(
            color: Constraints.APP_BAR_HOME_TEXT1_COLOR,
            fontSize: 20.0,
          ),
        ),
        Text(
          'STORE',
          style: TextStyle(
            color: Constraints.APP_BAR_HOME_TEXT2_COLOR,
            fontSize: 20.0,
          ),
        ),
      ],
    );
  }
}
