import 'package:flutter/material.dart';
import 'package:project/providers/cart.dart';
import 'package:project/screens/cart_screen.dart';
import 'package:project/screens/products_overview_screen.dart';
import './screens/product_detail_screen.dart';
import './providers/product_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ProductProvder(),
        ),
        ChangeNotifierProvider(
          create: (context) => Cart(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'QuickShopping',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          accentColor: Colors.purple[300],
          fontFamily: 'Hind',
        ),
        home: ProductsOverviewScreen(),
        routes: {
          ProductDetailScreen.routeName: (context) => ProductDetailScreen(),
          CartScreen.routeName: (context) => CartScreen()
        },
      ),
    );
  }
}
