import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:new_app/constants/toast.dart';
import 'package:new_app/models/product_model.dart';

class CartProvider extends ChangeNotifier {
  final List<Map<String, dynamic>> _cartProductsList = [];

  UnmodifiableListView<Map<String, dynamic>> get cartProductsList =>
      UnmodifiableListView(_cartProductsList);

  void addCartProduct(ProductModel item, int quantity) {
    final object = {
      "id": item.id,
      "product": item,
      "quantity": quantity,
    };

    bool alreadyExists = false;
    for (var element in _cartProductsList) {
      if (element.containsValue(object["id"])) {
        alreadyExists = true;
      }
    }

    if (alreadyExists == false) {
      _cartProductsList.add(object);
      showToastMessage(
        message: "Added to cart",
      );
      notifyListeners();
    }
  }

  void removeCartProduct(ProductModel item) {
    int index = -1;
    for (var element in _cartProductsList) {
      if (element["product"] == item) {
        index = _cartProductsList.indexOf(element);
      }
    }
    if (index != -1) {
      _cartProductsList.removeAt(index);
    }
    notifyListeners();
  }

  void increaseProductQuantity(String id) {
    int index = _cartProductsList.indexWhere((element) => element["id"] == id);

    Map<String, dynamic> temp = _cartProductsList.elementAt(index);

    Map<String, dynamic> a = {...temp, "quantity": temp["quantity"] + 1};
    _cartProductsList.removeAt(index);
    _cartProductsList.insert(index, a);

    notifyListeners();
  }

  void decreaseProductQuantity(String id) {
    int index = _cartProductsList.indexWhere((element) => element["id"] == id);

    Map<String, dynamic> temp = _cartProductsList.elementAt(index);
    if (temp["quantity"] > 1) {
      Map<String, dynamic> a = {...temp, "quantity": temp["quantity"] - 1};
      _cartProductsList.removeAt(index);
      _cartProductsList.insert(index, a);
    } else {
      _cartProductsList.remove(temp);
    }
    notifyListeners();
  }

  int getQuantityById(String id) {
    List<Map<String, dynamic>> a = _cartProductsList
        .where(
          (element) => element["id"] == id,
        )
        .toList();
    return a[0]["quantity"];
  }
}
