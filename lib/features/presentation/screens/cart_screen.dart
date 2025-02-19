import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping/features/presentation/provider_service/cart_provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.orangeAccent.shade700,
          title: Text("Cart",
          style: TextStyle(
            fontSize: 16,
            color: Colors.white
          ),),
          leading: InkWell(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios_new_outlined,
              color: Colors.white,
            ),
          ),
        ),
        body: ListView.builder(
            itemCount: cartProvider.cartItems.length,
            itemBuilder: (context, index) {
              final product = cartProvider.cartItems[index];
              final quantity = cartProvider.quantities[product] ?? 1;
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: Colors.black,
                    width: 0.1
                  )
                ),
                child: Row(
                  children: [
                    Image.network(product?.image ?? '',
                    height: 76,width: 76,),
                    SizedBox(width: 10,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 120,
                            child: Text(
                              maxLines: 2,
                                product?.title ?? "")),
                        Text(
                            "Quantity $quantity\nTotal: \$${(quantity * product.price).toString()}"),
                      ],
                    ),
                    Spacer(),
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              cartProvider.updateQundity(product, quantity - 1);
                            },
                            icon: Icon(Icons.remove)),
                        IconButton(
                            onPressed: () {
                              cartProvider.removeCart(product);
                            },
                            icon: Icon(Icons.delete)),
                        IconButton(
                            onPressed: () {
                              cartProvider.updateQundity(product, quantity + 1);
                            },
                            icon: Icon(Icons.add)),
                      ],
                    ),
                  ],
                ),
              );
            }));
  }
}
