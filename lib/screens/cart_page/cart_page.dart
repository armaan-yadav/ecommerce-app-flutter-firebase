import 'package:flutter/material.dart';
import 'package:new_app/provider/cart_provider.dart';
import 'package:new_app/screens/cart_page/widgets/cart_item.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
      ),
      body: cartProvider.cartProductsList.isEmpty
          ? SizedBox(
              width: double.infinity,
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Cart is  empty...",
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ],
              ),
            )
          : Consumer<CartProvider>(
              builder: (context, value, child) {
                final cartProductsList = value.cartProductsList;
                return ListView.builder(
                  itemCount: cartProductsList.length,
                  itemBuilder: (context, index) {
                    final currentProduct = cartProductsList[index];
                    return CartItem(
                      product: currentProduct["product"],
                      quantity: currentProduct["quantity"],
                    );
                  },
                );
              },
            ),
    );
  }
}
