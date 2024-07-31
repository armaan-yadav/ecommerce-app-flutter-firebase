import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:new_app/constants/routes.dart';
import 'package:new_app/constants/toast.dart';
import 'package:new_app/firebase_helper/firestore/firestore_functions.dart';
import 'package:new_app/models/product_model.dart';
import 'package:new_app/provider/cart_provider.dart';
import 'package:new_app/screens/cart_page/cart_page.dart';
import 'package:provider/provider.dart';

class ProductDescription extends StatefulWidget {
  const ProductDescription({
    super.key,
    required this.product,
  });
  final ProductModel product;

  @override
  State<ProductDescription> createState() => _ProductDescriptionState();
}

class _ProductDescriptionState extends State<ProductDescription> {
  int quantity = 1;

  bool isFavourite = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var buttonTextStyle = const TextStyle(
      color: Colors.white,
      fontSize: 20,
    );

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Routes.instance.push(const CartPage(), context);
              },
              icon: const Icon(
                Icons.shopping_cart,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(widget.product.imageUrl),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.product.name,
                    style: const TextStyle(fontSize: 30),
                  ),
                  GestureDetector(
                    onTap: () => setState(() {
                      isFavourite = !isFavourite;
                      if (isFavourite) {
                        showToastMessage(
                          message: "Added to Favorites",
                          backgroundColor: Colors.red,
                        );
                      }
                    }),
                    child: Icon(
                      isFavourite ? Icons.favorite : Icons.favorite_border,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: IconButton(
                          icon: const Icon(Icons.add),
                          onPressed: () {
                            setState(() {
                              quantity++;
                            });
                            Provider.of<CartProvider>(context, listen: false)
                                .increaseProductQuantity(widget.product.id);
                          },
                          iconSize: 30,
                          color: Colors.white,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          quantity.toString(),
                          style: const TextStyle(
                            fontSize: 30,
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(50)),
                        child: IconButton(
                          icon: const Icon(
                            Icons.remove,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            setState(() {
                              if (quantity > 1) {
                                Provider.of<CartProvider>(context,
                                        listen: false)
                                    .decreaseProductQuantity(widget.product.id);
                              }
                            });
                          },
                          iconSize: 30,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "₹ ${(int.parse(widget.product.price)) * quantity}",
                    style: const TextStyle(fontSize: 30),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        Provider.of<CartProvider>(context, listen: false)
                            .addCartProduct(widget.product, quantity);
                      },
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          const RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero),
                        ),
                      ),
                      child: const Text(
                        "Add to Cart",
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.blue),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          const RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                          ),
                        ),
                      ),
                      child: Text(
                        "Buy Now",
                        style: buttonTextStyle,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                widget.product.description,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
