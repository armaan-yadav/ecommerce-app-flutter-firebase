import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:new_app/models/product_model.dart';

class FavouriteProvider extends ChangeNotifier {
  final List<ProductModel> _favouriteProducts = [];

  UnmodifiableListView<ProductModel> get favouriteProducts =>
      UnmodifiableListView(_favouriteProducts);

  void addProductsToFavourite(ProductModel product) {
    _favouriteProducts.add(product);
    notifyListeners();
  }

  void removeProductsFromFavourite(ProductModel product) {
    _favouriteProducts.remove(product);
    notifyListeners();
  }

  bool isFavouriteProduct(ProductModel product) {
    return _favouriteProducts.contains(product);
  }
}
