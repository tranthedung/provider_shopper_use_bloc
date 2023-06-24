import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:provider1/cart/bloc/cart_bloc.dart';
import 'package:provider1/cart/model/cart_product_date.dart';
import 'package:provider1/home/bloc/home_bloc.dart';

class ProductTileWidget extends StatelessWidget {
  final ProductDataModel productDataModel;
  final CartBloc cartBloc;
  const ProductTileWidget(
      {super.key, required this.productDataModel, required this.cartBloc});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Container(
            height: 20,
            width: 20,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(productDataModel.imageUrl),
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                productDataModel.name,
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ],
          ),
          IconButton(
              onPressed: () {
                cartBloc
                    .add(CartAddItemsEvent(clickedProduct: productDataModel));
              },
              icon: Icon(Icons.add)),
        ],
      ),
    );
  }
}
