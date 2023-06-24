part of 'buy_bloc.dart';

@immutable
abstract class BuyState {}
abstract class BuyActionState extends BuyState{
}
class BuyInitial extends BuyState {}
class BuyLoadedSuccessState extends BuyActionState{}
