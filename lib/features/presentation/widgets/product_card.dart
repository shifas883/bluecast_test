import 'package:flutter/material.dart';

import '../../../data/models/model.dart';

class ProductCard extends StatelessWidget {
  final Product? product;
  final VoidCallback? onTap;
  const ProductCard({super.key, this.product,this.onTap});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black.withOpacity(0.2), width: 0.2),
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20,),
              Image.network(product?.image ?? '',
                height: 120,
                fit: BoxFit.cover,
                // color: Colors.red,
              ),
              Container(
                width: 200,
                padding: const EdgeInsets.all(8.0),
                child: Text(product?.title ?? '',
                  maxLines: 2, overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500
                  ),),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text('\$${product?.price.toStringAsFixed(2)}',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500
                  ),),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 100,right: 20,
            child: CircleAvatar(
          radius: 20,
          backgroundColor: Colors.orangeAccent,
          child: IconButton(
            color: Colors.white,
              onPressed: onTap, icon: Icon(Icons.add)),
        ))
      ],
    );
  }
}
