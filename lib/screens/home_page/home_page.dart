import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:new_app/firebase_helper/firestore/firestore_functions.dart';
import 'package:new_app/models/category_model.dart';
import 'package:new_app/widgets/category_item.dart';
import 'package:new_app/models/product_model.dart';
import 'package:new_app/widgets/product_item.dart';
import 'package:new_app/widgets/searchbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CategoryModel> categories = [];
  List<ProductModel> bestProducts = [];
  bool isLoading = false;

  final TextEditingController searchbarController = TextEditingController();

  void getCategoryItems() async {
    isLoading = true;
    final a = await FirestoreFunctions.instance.getCategories();
    setState(() {
      categories = a;
      isLoading = false;
    });
  }

  void getBestProducts() async {
    final a = await FirestoreFunctions.instance.getBestProducts();
    isLoading = true;
    setState(() {
      bestProducts = a;
      isLoading = false;
    });
    // print(bestProducts);
  }

  @override
  void initState() {
    super.initState();
    getCategoryItems();
    getBestProducts();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Center(
            child: Container(
              alignment: Alignment.center,
              height: 30,
              width: 30,
              color: Colors.white,
              child: const CircularProgressIndicator(),
            ),
          )
        : Scaffold(
            appBar: AppBar(
              title: const Text('E-commerce App'),
              actions: [
                const Text(
                  "Hello Raj",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.person),
                  onPressed: () {
                    // Handle user profile action
                  },
                ),
              ],
            ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Heading

                  const SizedBox(height: 10),
                  // Search bar
                  Searchbar(
                    searchbarController: searchbarController,
                    onSubmit: (p0) {},
                  ),
                  const SizedBox(height: 20),
                  // Categories
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      "Categories",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  categories.isEmpty
                      ? Text("Categories is empty")
                      : SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: categories.map(
                              (e) {
                                return CategoryItem(
                                  imageUrl: e.imageUrl,
                                  id: e.id,
                                  name: e.name,
                                );
                              },
                            ).toList(),
                          ),
                        ),
                  const SizedBox(height: 20),
                  // Top Selling Items
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      "Top Selling Items",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Top selling items grid

                  bestProducts.isEmpty
                      ? Text("Best  products is empty")
                      : GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          padding: const EdgeInsets.all(10.0),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 1,
                            mainAxisSpacing: 10,
                          ),
                          itemCount: bestProducts.length,
                          itemBuilder: (context, index) {
                            final product = bestProducts[index];
                            return ProductItem(product: product);
                          },
                        ),
                ],
              ),
            ),
          );
  }
}
