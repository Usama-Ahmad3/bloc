import 'package:state_management/features/home/product_models/product_model.dart';

abstract class WishlistState {}

abstract class WishlistActionState extends WishlistState {}

class wishlistInitialState extends WishlistState {}

class SuccessState extends WishlistState {
  final List<ProductModel> wishlist;

  SuccessState({required this.wishlist});
}

class RemovedSuccessWishlist extends WishlistState {}
