import 'package:flutter/material.dart';
import 'package:new_app/constants/routes.dart';
import 'package:new_app/models/product_model.dart';
import 'package:new_app/provider/favourite_provider.dart';
import 'package:new_app/screens/cart_page/cart_page.dart';
import 'package:new_app/widgets/product_item.dart';
import 'package:provider/provider.dart';

class FavouritesPage extends StatefulWidget {
  const FavouritesPage({super.key});

  @override
  State<FavouritesPage> createState() => _FavouritesPageState();
}

class _FavouritesPageState extends State<FavouritesPage> {
  List<ProductModel> favouriteProducts = [];

  @override
  Widget build(BuildContext context) {
    final favProvider = Provider.of<FavouriteProvider>(context);

    favouriteProducts = favProvider.favouriteProducts;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Favourites"),
        actions: [
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
                itemCount: favouriteProducts.length,
                itemBuilder: (context, index) {
                  final currentProduct = favouriteProducts[index];
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
