import 'package:flutter/material.dart';

import 'package:super_store/view/home/grid_data.dart';
import 'package:super_store/view/home/home.dart';

class HomeData extends StatelessWidget {
  const HomeData({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return listResponse == null
        ? Center(child: CircularProgressIndicator())
        : GridData();
  }
}
