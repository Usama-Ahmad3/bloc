import 'package:state_management/features/home/product_models/product_model.dart';

abstract class WishlistEvent {}

class InitialWishlistEvent extends WishlistEvent {}

class RemovedWishlistEvent extends WishlistEvent {
  final ProductModel list;

  RemovedWishlistEvent({required this.list});
}

class RemovedSuccesWishlistEvent extends WishlistEvent {}
