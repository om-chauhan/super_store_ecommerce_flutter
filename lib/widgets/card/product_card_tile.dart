import 'package:super_store/imports.dart';

class ProductCardTile extends StatelessWidget {
  final dynamic data;
  const ProductCardTile({Key? key, this.data}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final cart = Provider.of<CartItems>(context);
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          useSafeArea: true,
          barrierDismissible: false,
          builder: (context) {
            return AlertDialog(
              actionsPadding: EdgeInsets.zero,
              buttonPadding: EdgeInsets.zero,
              contentPadding: EdgeInsets.all(8),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextBuilder(text: 'Details'),
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.close))
                ],
              ),
              content: InteractiveViewer(
                minScale: 0.1,
                maxScale: 1.9,
                child: Image.network(
                  data['image'],
                  height: size.height * 0.5,
                  width: size.width,
                ),
              ),
            );
          },
        );
      },
      child: Card(
        color: Colors.white,
        margin: EdgeInsets.zero,
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              flex: 4,
              child: ClipRRect(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                child: Image.network(
                  data['image']!,
                  height: size.height,
                  width: size.width,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 5.0),
            Expanded(
              flex: 3,
              child: Padding(
                padding: EdgeInsets.all(5.0),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: TextBuilder(
                        text: data['title'],
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        maxLines: 2,
                        textOverflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: TextBuilder(text: data!['category'].toString(), fontSize: 12.0),
                    ),
                    const SizedBox(height: 2.0),
                    Padding(
                      padding: EdgeInsets.only(left: 2, right: 2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              TextBuilder(
                                text: '₹',
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),
                              TextBuilder(
                                text: data!['price'].toString(),
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),
                            ],
                          ),
                          GestureDetector(
                            child: IconButton(
                              splashColor: Colors.blue,
                              tooltip: 'Add to cart',
                              onPressed: () {
                                final ScaffoldMessengerState addToCartMsg = ScaffoldMessenger.of(context);
                                addToCartMsg.showSnackBar(
                                  const SnackBar(content: TextBuilder(text: 'Product added successfully')),
                                );
                                cart.addItem(data!['id'].toString(), data!['title']!, data!['price'], data!['image'],
                                    data!['category']);
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
          ],
        ),
      ),
    );
  }
}
