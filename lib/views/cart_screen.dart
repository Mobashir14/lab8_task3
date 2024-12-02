import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task3/controllers/product_controller.dart';

class CartScreen extends StatelessWidget {
  final ProductController productController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              if (productController.cart.isEmpty) {
                return Center(
                  child: Text('Your cart is empty!'),
                );
              }
              return ListView.builder(
                itemCount: productController.cart.length,
                itemBuilder: (context, index) {
                  final product = productController.cart[index];
                  return ListTile(
                    title: Text(product.name),
                    subtitle: Text('\$${product.price.toStringAsFixed(2)}'),
                    trailing: IconButton(
                      icon: Icon(Icons.remove_circle),
                      onPressed: () {
                        productController.removeFromCart(product);
                      },
                    ),
                  );
                },
              );
            }),
          ),
          Obx(() {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Total: \$${productController.totalPrice.toStringAsFixed(2)}',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
