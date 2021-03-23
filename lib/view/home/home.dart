import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'package:super_store/view/appbar/app_name.dart';
import 'package:super_store/config/constraints.dart';

import 'package:super_store/view/home/home_data.dart';
import 'package:super_store/view/login/login_home.dart';
import 'package:super_store/view/menu/drawer_menu.dart';

class Home extends StatefulWidget {
  final User user;

  const Home({Key key, this.user}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

List listResponse;

class _HomeState extends State<Home> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future fetchProducts() async {
    final String url =
        'https://raw.githubusercontent.com/om-chauhan/dummy-data/main/super-store-product.json';
    final response = await http.get(url);

    if (response.statusCode == 200) {
      setState(() {
        listResponse = json.decode(response.body);
      });
    }
  }

  void logOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Constraints.APP_BAR_MENU_ICON_COLOR),
          elevation: 0.0,
          automaticallyImplyLeading: true,
          backgroundColor: Constraints.APP_BAR_HOME_BG_COLOR,
          actions: [
            InkWell(
              onTap: () {
                signOut().whenComplete(() {
                  Get.off(LoginHome());
                });
              },
              child: Padding(
                padding: EdgeInsets.all(
                  10.0,
                ),
                child: Icon(Icons.power_settings_new),
              ),
            ),
          ],
          title: AppName(),
        ),
        drawer: DrawerMenu(),
        body: HomeData(),
      ),
    );
  }

  Future signOut() async {
    await _auth.signOut();
  }
}
