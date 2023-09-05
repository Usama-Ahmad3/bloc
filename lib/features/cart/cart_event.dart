import 'package:state_management/features/home/product_models/product_model.dart';

abstract class CartEvent {}

class InitialCartEvent extends CartEvent {}

class CartSuccessEvent extends CartEvent {}

class CartRemovedEvent extends CartEvent {
  final ProductModel item;

  CartRemovedEvent({required this.item});
}
