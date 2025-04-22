part of 'fetch_cart_bloc.dart';

@immutable
sealed class FetchCartEvent {}

class FetchAllCartEvent extends FetchCartEvent {}
