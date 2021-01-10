import 'package:flutter/material.dart';

class CartItemTile extends StatelessWidget {
  final String id;
  final String productId;
  final String price;
  final int quantity;
  final String name;

  // totalPrice() {
  //   int _price = int.parse(price);
  //   int _quantity = quantity;
  //   return _price * _quantity;
  // }

  CartItemTile({this.id, this.productId, this.price, this.quantity, this.name});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          child: FittedBox(
            child: Text('\$$price'),
          ),
        ),
        title: Text(name),
        subtitle: Text("Total: \$ ${price * quantity}"),
        trailing: Text('$quantity'),
      ),
    );
  }
}
