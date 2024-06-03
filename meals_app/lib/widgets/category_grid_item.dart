import 'package:flutter/material.dart';

import '../models/category.dart';

class category_grid_item extends StatelessWidget {
  const category_grid_item({
    super.key,
    required this.category,
    required this.onselectcategory,
  });

  final Category category;
  final void Function() onselectcategory;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      splashColor: Theme.of(context).primaryColor,
      onTap: onselectcategory,
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              colors: [
                category.color.withOpacity(0.55),
                category.color.withOpacity(0.9)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            )),
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
        ),
      ),
    );
  }
}
