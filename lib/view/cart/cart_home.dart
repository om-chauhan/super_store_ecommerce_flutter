import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:super_store/view/appbar/app_name.dart';
import 'package:super_store/config/constraints.dart';
import 'package:super_store/model/cart_model.dart';
import 'package:super_store/view/cart/cart_item_tile.dart';

import 'package:super_store/view/login/login_home.dart';

class CartHome extends StatefulWidget {
  @override
  _CartHomeState createState() => _CartHomeState();
}

class _CartHomeState extends State<CartHome> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartItems>(context);
    return SafeArea(
      child: Scaffold(
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
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: cart.items.length,
                itemBuilder: (ctx, i) => CartItemTile(
                  id: cart.items.values.toList()[i].id,
                  productId: cart.items.keys.toList()[i],
                  price: cart.items.values.toList()[i].price,
                  quantity: cart.items.values.toList()[i].quantity,
                  name: cart.items.values.toList()[i].name,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future signOut() async {
    await _auth.signOut();
  }
}
