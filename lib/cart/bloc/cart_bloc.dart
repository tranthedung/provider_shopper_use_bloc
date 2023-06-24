import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:provider1/data/buy_data.dart';
import 'package:provider1/data/grocery_data.dart';

import '../model/cart_product_date.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<CartInitialEvent>(cartInitialEvent);
    on<CartClickToButtonPayEvent>(cartClickToButtonPayEvent);
    on<CartAddItemsEvent>(cartAddItemsEvent);
  }

  FutureOr<void> cartInitialEvent(
      CartInitialEvent event, Emitter<CartState> emit) {
    // emit(CartLoadingState());
    // await Future.delayed(Duration(seconds: 1));
    emit(CartLoadedSuccessState(
        products: GroceryData.groceryProducts
            .map((e) => ProductDataModel(
                id: e['id'],
                name: e['name'],
                price: e['price'],
                imageUrl: e['imageUrl']))
            .toList()));
  }

  FutureOr<void> cartClickToButtonPayEvent(
      CartClickToButtonPayEvent event, Emitter<CartState> emit) {
    print(" pay button is clicked successfull");
    emit(CartShowItemsToPayState());
  }

  FutureOr<void> cartAddItemsEvent(
      CartAddItemsEvent event, Emitter<CartState> emit) {
    print('Items is added');
    buyItems.add(event.clickedProduct);
    emit(CartAddItemState());
  }
}
