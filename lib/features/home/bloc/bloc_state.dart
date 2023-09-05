import 'package:state_management/features/home/product_models/product_model.dart';

abstract class BlocState {}

abstract class HomeActionState extends BlocState {}

class BlocInitial extends BlocState {}

class LoadingState extends BlocState {}

class SuccessState extends BlocState {
  final List<ProductModel> product;
  SuccessState({required this.product});
}

class NavigateToWishlistPageState extends HomeActionState {}

class NavigateToCartPageState extends HomeActionState {}

class ErrorState extends BlocState {}

class HomeProductCarted extends HomeActionState {}

class HomeProductWishlisted extends HomeActionState {}
