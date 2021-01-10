import 'package:flutter/material.dart';
import 'package:super_store/config/constraints.dart';
import 'package:super_store/view/about/about_home.dart';
import 'package:super_store/view/cart/cart_home.dart';
import 'package:super_store/view/home/home.dart';
import 'package:url_launcher/url_launcher.dart';

class DrawerListTile extends StatefulWidget {
  const DrawerListTile({
    Key key,
  }) : super(key: key);

  @override
  _DrawerListTileState createState() => _DrawerListTileState();
}

class _DrawerListTileState extends State<DrawerListTile> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
        itemCount: Constraints.MENU_NAME.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                switch (Constraints.MENU_NAME[index]) {
                  case 'Home':
                    return Home();
                    break;
                  case 'My Cart':
                    return CartHome();
                    break;
                  case 'GitHub':
                    return _launchURL();
                    break;
                  case 'About Us':
                    return AboutHome();
                    break;

                  default:
                    return Home();
                }
              }));
            },
            child: Align(
              alignment: Alignment.center,
              child: ListTile(
                leading: Icon(Constraints.MENU_ICON[index]),
                title: Text(
                  Constraints.MENU_NAME[index],
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  _launchURL() async {
    const url = "https://google.com";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
