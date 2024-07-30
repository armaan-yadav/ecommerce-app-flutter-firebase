import 'package:flutter/material.dart';
import 'package:new_app/models/product_model.dart';

class ProductDescription extends StatefulWidget {
  const ProductDescription({super.key, required this.product});
  final ProductModel product;

  @override
  State<ProductDescription> createState() => _ProductDescriptionState();
}

class _ProductDescriptionState extends State<ProductDescription> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              widget.product.name,
              style: TextStyle(fontSize: 30),
            ),
            Image.network(widget.product.imageUrl),
            Text(widget.product.description),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "₹ ${(int.parse(widget.product.price)) * quantity}",
                  style: TextStyle(fontSize: 30),
                ),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () {
                        setState(() {
                          quantity++;
                        });
                      },
                      iconSize: 35,
                    ),
                    Text(
                      quantity.toString(),
                      style: const TextStyle(
                        fontSize: 30,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.remove),
                      onPressed: () {
                        setState(() {
                          if (quantity > 0) {
                            quantity--;
                          }
                        });
                      },
                      iconSize: 35,
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
