import 'package:flutter/material.dart';
import 'package:new_app/constants/routes.dart';
import 'package:new_app/screens/products_per_category/products_per_category.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem(
      {super.key,
      required this.imageUrl,
      required this.id,
      required this.name});
  final String imageUrl;
  final String id;
  final String name;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Routes.instance.push(
            ProductsPerCategory(
              categoryId: id,
              categoryName: name,
            ),
            context);
      },
      child: Container(
        height: 170,
        width: 160,
        decoration: BoxDecoration(
          // boxShadow: const [BoxShadow(blurRadius: 2)],
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          border: Border.all(color: Colors.black38),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Image.network(
                imageUrl,
              ),
            ),
            Text(
              name,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
