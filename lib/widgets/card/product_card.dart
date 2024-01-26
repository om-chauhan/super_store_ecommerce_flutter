import 'package:super_store_e_commerce_flutter/imports.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;
  const ProductCard({Key? key, required this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    final cart = Provider.of<CartProvider>(context);
    return Container(
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.blue, width: 0.5),
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        onTap: () => openImage(context, size),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                clipBehavior: Clip.antiAlias,
                child: Image.network(
                  product.image!,
                  height: size.height,
                  width: double.infinity,
                  fit: BoxFit.contain,
                  colorBlendMode: BlendMode.overlay,
                ),
              ),
            ),
            const SizedBox(height: 5.0),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: TextBuilder(
                      text: product.title!,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      maxLines: 3,
                      textOverflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: TextBuilder(
                          text: product.category,
                          fontSize: 12,
                          color: Colors.white,
                        )),
                  ),
                  const SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.only(left: 2, right: 2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const TextBuilder(
                              text: '₹ ',
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                            TextBuilder(
                              text: product.price!.round().toString(),
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ],
                        ),
                        IconButton(
                          splashColor: Colors.blue,
                          tooltip: 'Add to cart',
                          onPressed: () {
                            final ScaffoldMessengerState addToCartMsg = ScaffoldMessenger.of(context);
                            addToCartMsg.showSnackBar(
                              SnackBar(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                backgroundColor: Colors.black,
                                action: SnackBarAction(
                                    label: 'Go to Cart',
                                    onPressed: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (_) => const Cart()));
                                    }),
                                behavior: SnackBarBehavior.floating,
                                content: const TextBuilder(text: 'Product added to cart'),
                              ),
                            );
                            CartModel cartModel = CartModel(
                                id: product.id!,
                                title: product.title!,
                                price: product.price!,
                                image: product.image!,
                                category: product.category!,
                                quantity: 1,
                                totalPrice: product.price!);
                            cart.addItem(cartModel);
                            // cart.addItem(product.id.toString(), product.title!, product.price, product.image!, product.category!);
                          },
                          icon: const Icon(Icons.add_shopping_cart_rounded),
                          color: Colors.blue,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  openImage(BuildContext context, Size size) {
    showDialog(
      context: context,
      useSafeArea: true,
      barrierDismissible: true,
      builder: (context) {
        return AlertDialog(
          actionsPadding: EdgeInsets.zero,
          buttonPadding: EdgeInsets.zero,
          contentPadding: const EdgeInsets.all(8),
          iconPadding: EdgeInsets.zero,
          elevation: 0,
          title: SizedBox(
            width: size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const TextBuilder(text: 'Image'),
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.close,
                      size: 30,
                      color: Colors.black,
                    ))
              ],
            ),
          ),
          content: InteractiveViewer(
            minScale: 0.1,
            maxScale: 1.9,
            child: Image.network(
              product.image!,
              height: size.height * 0.5,
              width: size.width,
            ),
          ),
        );
      },
    );
  }
}
