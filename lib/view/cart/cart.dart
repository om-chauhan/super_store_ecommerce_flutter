import 'package:super_store_e_commerce_flutter/imports.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: const AppNameWidget(),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Container(
              height: 25,
              width: 25,
              alignment: Alignment.center,
              decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.black),
              child: TextBuilder(
                text: cart.itemCount.toString(),
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 10,
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: ListView.separated(
          padding: const EdgeInsets.all(15),
          itemCount: cart.items.length,
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          itemBuilder: (BuildContext context, int i) {
            return CartCard(cart: cart.items[i]);
          },
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(height: 10.0);
          },
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: MaterialButton(
          height: 60,
          color: Colors.black,
          minWidth: size.width,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          onPressed: () {
            final ScaffoldMessengerState buyNow = ScaffoldMessenger.of(context);
            buyNow.showSnackBar(
              SnackBar(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                backgroundColor: Colors.black,
                behavior: SnackBarBehavior.floating,
                content: const TextBuilder(text: 'Thank you for shopping with us'),
              ),
            );
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextBuilder(text: '₹ ${cart.totalPrice()}', color: Colors.white, fontWeight: FontWeight.w600, fontSize: 20),
              const SizedBox(width: 10.0),
              const TextBuilder(
                text: 'Pay Now',
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.normal,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
