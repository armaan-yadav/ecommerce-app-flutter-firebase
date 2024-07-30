import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:new_app/constants/toast.dart';
import 'package:new_app/models/category_model.dart';
import 'package:new_app/models/product_model.dart';

class FirestoreFunctions {
  static FirestoreFunctions instance = FirestoreFunctions();
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<List<CategoryModel>> getCategories() async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await _firebaseFirestore.collection("categories").get();

      List<CategoryModel> categoryList = querySnapshot.docs
          .map(
            (e) => CategoryModel.fromJson(e.data()),
          )
          .toList();

      return categoryList;
    } catch (e) {
      showToastMessage(message: e.toString());
      return [];
    }
  }

  Future<List<ProductModel>> getBestProducts() async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await _firebaseFirestore.collectionGroup("products").get();

      List<ProductModel> productList = querySnapshot.docs
          .map(
            (e) => ProductModel.fromJson(e.data()),
          )
          .toList();
      return productList;
    } catch (e) {
      showToastMessage(message: e.toString());
      return [];
    }
  }

  Future<List<ProductModel>> getProductsPerCategory(String id) async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await _firebaseFirestore
              .collectionGroup("products")
              .where(
                "categoryId",
                isEqualTo: id,
              )
              .get();

      List<ProductModel> productList = querySnapshot.docs
          .map(
            (e) => ProductModel.fromJson(e.data()),
          )
          .toList();
      // print(productList);
      return productList;
    } catch (e) {
      print(e.toString());
      showToastMessage(message: e.toString());
      return [];
    }
  }

  Future<String> getCategoryName(String id) async {
    return "";
  }
}
