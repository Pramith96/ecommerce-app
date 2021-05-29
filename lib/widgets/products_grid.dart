import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './product_item.dart';
import '../providers/product_provider.dart';

class ProductsGrid extends StatelessWidget {
  final bool isFav;

  ProductsGrid(this.isFav);
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<ProductProvder>(context);
    final products = isFav ? productsData.favouriteItem : productsData.items;
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: products.length,
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        // create: (context) => products[i],
        value: products[i],
        child: ProductItem(
            //     products[i].id, products[i].title,
            // products[i].imgUrl, products[i].price
            ),
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 4,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10),
    );
  }
}
