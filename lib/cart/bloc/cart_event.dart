part of 'cart_bloc.dart';

@immutable
abstract class CartEvent {}

class CartInitialEvent extends CartEvent {}

class CartClickToButtonPayEvent extends CartEvent {}

class CartAddItemsEvent extends CartEvent {
  final ProductDataModel clickedProduct;

  CartAddItemsEvent({required this.clickedProduct});
}
