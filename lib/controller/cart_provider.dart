import 'package:super_store_e_commerce_flutter/imports.dart';

class CartProvider with ChangeNotifier {
  final List<CartModel> _items = [];

  List<CartModel> get items {
    return [..._items];
  }

  int get itemCount => _items.length;

  void addItem(CartModel cartModel) {
    int index = _items.indexWhere((item) => item.id == cartModel.id);
    if (index != -1) {
      // Item already exists, update quantity and price
      CartModel existingItem = _items[index];
      CartModel updatedItem = existingItem.copyWith(
        quantity: existingItem.quantity! + cartModel.quantity!,
        totalPrice: existingItem.totalPrice! + cartModel.totalPrice!,
      );
      _items[index] = updatedItem;
    } else {
      // Item doesn't exist, add it to the list
      _items.add(cartModel);
    }
    notifyListeners();
  }

  void removeItem(int id) {
    _items.removeWhere((element) => element.id == id);
    notifyListeners();
  }

  void increaseQuantity(int id) {
    final index = _items.indexWhere((e) => e.id == id);
    _items[index].quantity = _items[index].quantity! + 1;
    _items[index].totalPrice = _items[index].price! * _items[index].quantity!;
    notifyListeners();
  }

  void decreaseQuantity(int id) {
    final index = _items.indexWhere((e) => e.id == id);
    if (_items[index].quantity! > 1) {
      _items[index].quantity = _items[index].quantity! - 1;
      _items[index].totalPrice = _items[index].price! * _items[index].quantity!;
    }
    notifyListeners();
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }

  void removeSingleItem(int id) {
    final index = _items.indexWhere((e) => e.id == id);
    if (_items[index].quantity! > 1) {
      _items[index].quantity = _items[index].quantity! - 1;
      _items[index].totalPrice = _items[index].price! * _items[index].quantity!;
    } else {
      _items.removeWhere((element) => element.id == id);
    }
    notifyListeners();
  }

  int totalPrice() {
    double totalPrice = 0;
    for (int i = 0; i < _items.length; i++) {
      totalPrice += _items[i].totalPrice!;
    }
    notifyListeners();
    if (kDebugMode) {
      print('Total Price: $totalPrice');
    }
    return totalPrice.round();
  }
}
