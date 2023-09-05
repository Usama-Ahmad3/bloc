import 'package:state_management/features/home/product_models/product_model.dart';

abstract class BlocEvent {}

class InitialEvent extends BlocEvent {}

class HomeWishlistButtonClickedEvent extends BlocEvent {
  final ProductModel list;

  HomeWishlistButtonClickedEvent({required this.list});
}

class HomecartButtonClickedEvent extends BlocEvent {
  final ProductModel list;

  HomecartButtonClickedEvent({required this.list});
}

class HomeWishlistNavigateEvent extends BlocEvent {}

class HomecartNavigateEvent extends BlocEvent {}
