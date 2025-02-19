import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping/data/api_service/api_service.dart';
import 'package:shopping/data/models/model.dart';
import 'package:shopping/features/presentation/provider_service/cart_provider.dart';
import 'package:shopping/features/presentation/screens/cart_screen.dart';

import '../widgets/product_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent.shade700,
        title: const Text(
          'Product List',
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CartScreen(),
                  ),
                );
              },
              icon: Icon(Icons.shopping_cart,color: Colors.white,))
        ],
      ),
      body: FutureBuilder<List<Product>>(
        future: ApiService().feachProducts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Text("List Loading Failed");
          }
          final products = snapshot.data;
          return GridView.builder(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            itemCount: products!.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.75,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10),
            itemBuilder: (context, index) {
              final product = products?[index];
              return GestureDetector(
                child: ProductCard(
                  onTap: () {
                    Provider.of<CartProvider>(context, listen: false)
                        .addToCart(product!);
                  },
                  product: product,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
