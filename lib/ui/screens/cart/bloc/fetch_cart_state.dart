part of 'fetch_cart_bloc.dart';

@immutable
sealed class FetchCartState {}

final class FetchCartInitialState extends FetchCartState {}
final class FetchCartLoadingState extends FetchCartState {}
final class FetchCartLoadedState extends FetchCartState {
  List<CartModel> cartItems;
  FetchCartLoadedState({required this.cartItems});
}
final class FetchCartErrorState extends FetchCartState {
  String errorMsg;
  FetchCartErrorState({required this.errorMsg});
}
