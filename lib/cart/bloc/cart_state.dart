part of 'cart_bloc.dart';

@immutable
abstract class CartState {}

class CartInitial extends CartState {}
class CartLoadingState extends CartState{}

class CartLoadedSuccessState extends CartState {
  final List<ProductDataModel> products;

  CartLoadedSuccessState({
    required this.products,
  });
}
class CartShowItemsToPayState extends CartState{
}
class CartAddItemState extends CartState{
  
}

