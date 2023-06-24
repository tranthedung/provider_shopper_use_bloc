import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider1/cart/bloc/cart_bloc.dart';
import 'package:provider1/cart/ui/product_tile_widget.dart';
import 'package:provider1/home/bloc/home_bloc.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  void initState() {
    cartBloc.add(CartInitialEvent());
    super.initState();
  }

  final CartBloc cartBloc = CartBloc();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartBloc, CartState>(
      bloc: cartBloc,
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case CartLoadingState:
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          case CartLoadedSuccessState:
            final successState = state as CartLoadedSuccessState;
            return Scaffold(
              appBar: AppBar(
                title: Text("CataLog"),
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.shopping_basket),
                  ),
                ],
              ),
              body: ListView.builder(
                  itemCount: successState.products.length,
                  itemBuilder: (context, index) {
                    return ProductTileWidget(
                      productDataModel: successState.products[index],
                      cartBloc: cartBloc,
                    );
                  }),
            );
          default:
            return SizedBox();
        }
      },
    );
  }
}
