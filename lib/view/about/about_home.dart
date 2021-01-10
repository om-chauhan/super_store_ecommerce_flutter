import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:super_store/components/app_name.dart';
import 'package:super_store/config/constraints.dart';
import 'package:super_store/view/login/login_home.dart';

class AboutHome extends StatefulWidget {
  @override
  _AboutHomeState createState() => _AboutHomeState();
}

class _AboutHomeState extends State<AboutHome> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              iconTheme:
                  IconThemeData(color: Constraints.APP_BAR_MENU_ICON_COLOR),
              elevation: 0.0,
              automaticallyImplyLeading: true,
              backgroundColor: Constraints.APP_BAR_HOME_BG_COLOR,
              actions: [
                InkWell(
                  onTap: () {
                    signOut().whenComplete(() {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => LoginHome(),
                        ),
                      );
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
            body: Center(
              child: Text('About'),
            )));
  }

  Future signOut() async {
    await _auth.signOut();
  }
}
