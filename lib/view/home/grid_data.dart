import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:super_store/config/constraints.dart';
import 'package:super_store/model/cart_model.dart';

import 'package:super_store/view/home/home.dart';

class GridData extends StatefulWidget {
  const GridData({
    Key key,
  }) : super(key: key);

  @override
  _GridDataState createState() => _GridDataState();
}

class _GridDataState extends State<GridData> {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartItems>(context);
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      shrinkWrap: true,
      itemCount: listResponse.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {},
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Container(
              width: 100.0,
              height: 200.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(20.0),
                ),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 1.0,
                    color: Colors.black38,
                    offset: Offset(5.0, 5.0),
                  )
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image.network(
                      listResponse[index]['Image'],
                      height: 70.0,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      listResponse[index]['Name'],
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      listResponse[index]['Category'],
                      style: TextStyle(fontSize: 12.0),
                    ),
                  ),
                  SizedBox(
                    height: 2.0,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 2.0,
                      right: 2.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              '₹',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Constraints.RUPEES_COLOR,
                              ),
                            ),
                            Text(
                              listResponse[index]['Price'].toString(),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Constraints.RUPEES_COLOR,
                              ),
                            ),
                          ],
                        ),
                        new GestureDetector(
                          child: IconButton(
                            splashColor: Colors.blue,
                            tooltip: 'Add to cart',
                            onPressed: () {
                              final ScaffoldMessengerState addToCartMsg =
                                  ScaffoldMessenger.of(context);
                              addToCartMsg.showSnackBar(
                                const SnackBar(
                                    content: Text('Product added sucessfully')),
                              );
                              cart.addItem(
                                  listResponse[index]['Id'].toString(),
                                  listResponse[index]['Name'],
                                  listResponse[index]['Price']);
                            },
                            icon: Icon(Icons.add_shopping_cart_rounded),
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
