import 'package:abc_cash_and_carry/models/categories_model.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  // final Category category;

  final CatData? category;

  Color? color;

  CategoryCard({required this.category, this.color});

  @override
  Widget build(BuildContext context) {
    return category!.name == null
        ? SizedBox()
        : SizedBox(
            height: 120,
            width: 170,
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),

              elevation: 2,
              // color: Color(category.color!),
              color: color,
              margin: EdgeInsets.all(6),

              child: Center(
                child: Text(
                  category!.name == null ? '' : category!.name.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14),
                ),
              ),
            ),
          );
  }
}
