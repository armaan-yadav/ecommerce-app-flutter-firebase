import 'package:flutter/material.dart';
import 'package:new_app/constants/routes.dart';
import 'package:new_app/firebase_helper/firestore/firestore_functions.dart';
import 'package:new_app/models/product_model.dart';
import 'package:new_app/screens/cart_page/cart_page.dart';
import 'package:new_app/screens/favourites_page/favourites_page.dart';
import 'package:new_app/widgets/product_item.dart';

class ProductsPerCategory extends StatefulWidget {
  const ProductsPerCategory({
    super.key,
    required this.categoryId,
    required this.categoryName,
  });
  final String categoryId;
  final String categoryName;

  @override
  State<ProductsPerCategory> createState() => _ProductsPerCategoryState();
}

class _ProductsPerCategoryState extends State<ProductsPerCategory> {
  List<ProductModel> products = [];

  @override
  void initState() {
    super.initState();
    getProductsPerCategory(widget.categoryId);
  }

  void getProductsPerCategory(String id) async {
    final List<ProductModel> response =
        await FirestoreFunctions.instance.getProductsPerCategory(id);
    setState(() {
      products = response;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.categoryName,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Routes.instance.push(const FavouritesPage(), context);
            },
            icon: const Icon(Icons.favorite),
          ),
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Routes.instance.push(const CartPage(), context);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.amber,
              height: MediaQuery.of(context).size.height + 100,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final currentProduct = products[index];
                  return ProductItem(product: currentProduct);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
