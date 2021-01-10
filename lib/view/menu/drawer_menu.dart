import 'package:flutter/material.dart';
import 'package:super_store/view/appbar/app_name.dart';
import 'package:super_store/view/appbar/small_app_icon.dart';

import 'package:super_store/view/cart/cart_home.dart';
import 'package:super_store/view/home/home.dart';
import 'package:url_launcher/url_launcher.dart';

class DrawerMenu extends StatefulWidget {
  const DrawerMenu({
    Key key,
  }) : super(key: key);

  @override
  _DrawerMenuState createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Container(
            height: 170.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 100.0,
                  width: 100.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(
                      Radius.circular(40.0),
                    ),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 5.0,
                        color: Colors.black,
                        offset: Offset(5.0, 5.0),
                      ),
                    ],
                  ),
                  child: CircleAvatar(
                    backgroundImage: AssetImage('images/face_image.jpg'),
                    backgroundColor: Colors.yellow,
                  ),
                ),
                Container(
                  height: 70.0,
                  width: 15.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Omprakash',
                      style: TextStyle(
                          fontSize: 30.0, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'krissh1209@gmail.com',
                      style: TextStyle(
                          fontSize: 15.0, fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
            // color: Colors.green,
            height: 400,
            child: ListView(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Home()));
                  },
                  child: ListTile(
                    leading: Icon(Icons.home),
                    title: Text(
                      "Home",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => CartHome()));
                  },
                  child: ListTile(
                    leading: Icon(Icons.shopping_bag),
                    title: Text(
                      "Cart",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    _launchURL();
                  },
                  child: ListTile(
                    leading: Icon(Icons.code),
                    title: Text(
                      "Source code",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    _createEmail();
                  },
                  child: ListTile(
                    leading: Icon(Icons.email),
                    title: Text(
                      "Contact",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    showAboutDialog(
                      context: context,
                      applicationIcon: SmallAppIcon(),
                      //applicationName: 'Super Store',
                      applicationVersion: '1.0.0+1',
                      applicationLegalese: 'Show me',
                    );
                  },
                  child: ListTile(
                    leading: Icon(Icons.info),
                    title: Text(
                      "About App",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.center,
            height: 100.0,
            decoration: BoxDecoration(),
            child: Column(
              children: [
                AppName(),
                Text('Ecommerce App using Rest Api.'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _launchURL() async {
    const url =
        "https://github.com/om-chauhan/Super-Store-Ecommerce-App-using-REST-Api-in-Flutter";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _createEmail() async {
    const emailaddress =
        'mailto:krissh1209@gmail.com?subject=Can we Talk?&body=I have Job offer for you.';

    if (await canLaunch(emailaddress)) {
      await launch(emailaddress);
    } else {
      throw 'Could not Email';
    }
  }
}
