import 'package:get/get.dart';
import 'package:task3/models/product_model.dart';

class ProductController extends GetxController {
  var products = <Product>[
    Product(id: 1, name: 'Laptop', price: 999.99),
    Product(id: 2, name: 'Phone', price: 699.99),
    Product(id: 3, name: 'Headphones', price: 199.99),
    Product(id: 4, name: 'Carger', price: 38.99),
    Product(id: 5, name: 'Adapter', price: 9.99),
    Product(id: 6, name: 'Mouse', price: 49.99),
  ].obs;

  var cart = <Product>[].obs;

  void addToCart(Product product) {
    cart.add(product);
  }

  void removeFromCart(Product product) {
    cart.remove(product);
  }

  double get totalPrice => cart.fold(0, (sum, item) => sum + item.price);
}
