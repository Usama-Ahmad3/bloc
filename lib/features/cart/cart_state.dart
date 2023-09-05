import 'package:state_management/features/home/product_models/product_model.dart';

abstract class CartState {}

abstract class CartActionState extends CartState {}

class CartInitial extends CartState {}

class SuccessState extends CartState {
  final List<ProductModel> cartItems;

  SuccessState({required this.cartItems});
}

class RemovedSuccessCartState extends CartActionState {}
