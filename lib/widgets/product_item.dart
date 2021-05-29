import 'package:flutter/material.dart';
import 'package:project/screens/product_detail_screen.dart';
import 'package:provider/provider.dart';
import '../providers/product.dart';

class ProductItem extends StatelessWidget {
  // final String id;
  // final String title;
  // final String imageUrl;
  // final double price;

  // ProductItem(this.id, this.title, this.imageUrl, this.price);
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(ProductDetailScreen.routeName,
                arguments: product.id);
          },
          child: Image.asset(
            product.imgUrl,
            fit: BoxFit.cover,
          ),
        ),
        header: GridTileBar(
          backgroundColor: Colors.black12,
          leading: Text(
            'Rs. ' + product.price.toString(),
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black54,
          leading: Consumer<Product>(
            builder: (context, product, _) => IconButton(
              icon: Image.asset(
                product.isFavourite
                    ? 'assets/images/favor.png'
                    : 'assets/images/fav.png',
                fit: BoxFit.cover,
                height: 30,
              ),
              onPressed: () {
                product.toggleFavouriteStatus();
              },
            ),
          ),
          title: Text(
            product.title,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12),
          ),
          trailing: IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {},
            // color: Theme.of(context).accentColor,
          ),
        ),
      ),
    );
  }
}
