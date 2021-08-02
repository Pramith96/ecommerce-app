import 'package:flutter/material.dart';
import 'package:project/widgets/app_drawer.dart';
import 'package:project/widgets/user_product_tile.dart';
import 'package:provider/provider.dart';
import '../providers/product_provider.dart';

class UserProductScreen extends StatelessWidget {
  static const routeName = 'user-product';
  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<ProductProvder>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Products'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {},
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: Padding(
          padding: EdgeInsets.all(10),
          child: ListView.builder(
            itemCount: productData.items.length,
            itemBuilder: (_, i) => Column(
              children: [
                UserProductTile(
                    productData.items[i].title, productData.items[i].imgUrl),
                Divider(),
              ],
            ),
          )),
    );
  }
}
