import 'package:super_store_e_commerce_flutter/imports.dart';

class CartCard extends StatelessWidget {
  final CartModel cart;
  const CartCard({
    Key? key,
    required this.cart,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    // final totalPrice = (cart.price! * cart.quantity!);
    final provider = Provider.of<CartProvider>(context);
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.blue, width: 0.5),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Image.network(
            cart.image!,
            height: 80,
            width: 80,
            fit: BoxFit.contain,
          ),
          const SizedBox(width: 10.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: TextBuilder(
                        text: '${cart.title} X ${cart.quantity}',
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        maxLines: 3,
                        textOverflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(width: 5),
                    InkWell(
                      onTap: () {
                        provider.removeItem(cart.id!);
                      },
                      child: Container(
                        height: 25,
                        width: 25,
                        decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.black),
                        child: const Icon(
                          Icons.close,
                          color: Colors.white,
                          size: 15,
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 10.0),
                Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: TextBuilder(
                      text: cart.category,
                      fontSize: 12,
                      color: Colors.white,
                    )),
                const SizedBox(height: 5),
                Row(
                  children: [
                    Row(
                      children: [
                        IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              provider.decreaseQuantity(cart.id!);
                            },
                            icon: const Icon(
                              Icons.remove_circle_outline,
                              color: Colors.black,
                            )),
                        TextBuilder(
                          text: cart.quantity.toString(),
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                        IconButton(
                            onPressed: () {
                              provider.increaseQuantity(cart.id!);
                            },
                            icon: const Icon(
                              Icons.add_circle_outline,
                              color: Colors.black,
                            ))
                      ],
                    ),
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const TextBuilder(
                            text: 'Total: ',
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.blue,
                          ),
                          TextBuilder(
                            text: " ₹${cart.price!.round()}",
                            fontWeight: FontWeight.w600,
                            color: Colors.blue,
                            fontSize: 18,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
