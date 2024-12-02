import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task3/controllers/product_controller.dart';
import 'package:task3/views/cart_screen.dart';

class ProductListScreen extends StatelessWidget {
  ProductListScreen({super.key});

  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Get.to(() => CartScreen());
            },
          )
        ],
      ),
      body: Obx(() {
        return ListView.builder(
          itemCount: productController.products.length,
          itemBuilder: (context, index) {
            final product = productController.products[index];
            return ListTile(
              title: Text(product.name),
              subtitle: Text('\$${product.price.toStringAsFixed(2)}'),
              trailing: ElevatedButton(
                onPressed: () {
                  productController.addToCart(product);
                  Get.snackbar(
                    'Added to Cart',
                    '${product.name} has been added to the cart!',
                    snackPosition: SnackPosition.BOTTOM,
                  );
                },
                child: Text('Add'),
              ),
            );
          },
        );
      }),
    );
  }
}
