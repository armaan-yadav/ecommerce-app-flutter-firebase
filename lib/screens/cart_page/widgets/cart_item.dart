import 'package:flutter/material.dart';
import 'package:new_app/models/product_model.dart';
import 'package:new_app/provider/cart_provider.dart';
import 'package:provider/provider.dart';

class CartItem extends StatefulWidget {
  const CartItem({super.key, required this.product, required this.quantity});
  final ProductModel product;
  final int quantity;

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    final product = widget.product;
    quantity = widget.quantity;

    final cartProvider = Provider.of<CartProvider>(context, listen: false);

    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue),
        borderRadius: BorderRadius.circular(12),
      ),
      width: double.infinity,
      child: Row(
        children: [
          SizedBox(
            height: 100,
            width: 100,
            child: Image.network(
                errorBuilder: (context, error, stackTrace) {
                  return const Center(
                    child: Text("Error while loading"),
                  );
                },
                product.imageUrl,
                fit: BoxFit.contain,
                loadingBuilder: (BuildContext context, Widget child,
                    ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  }
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes!
                          : null,
                    ),
                  );
                }),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(product.name),
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.add),
                          onPressed: () {
                            cartProvider
                                .increaseProductQuantity(widget.product.id);
                            setState(() {
                              quantity++;
                              ;
                            });
                          },
                          iconSize: 35,
                        ),
                        Text(
                          quantity.toString(),
                        ),
                        IconButton(
                          highlightColor: Colors.blue,
                          icon: const Icon(
                            Icons.remove,
                          ),
                          onPressed: () {
                            setState(() {
                              if (quantity >= 1) {
                                cartProvider
                                    .decreaseProductQuantity(widget.product.id);
                                quantity--;
                              }
                            });
                          },
                          iconSize: 35,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Text("Add to Wishlist"),
                        IconButton(
                          onPressed: () {
                            cartProvider.removeCartProduct(product);
                          },
                          icon: const Icon(Icons.delete),
                        )
                      ],
                    )
                  ],
                ),
                Text("${(int.parse(product.price) * quantity)}"),
              ],
            ),
          )
        ],
      ),
    );
  }
}
