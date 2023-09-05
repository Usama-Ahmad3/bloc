import 'package:bloc/bloc.dart';
import 'package:state_management/data/cartList.dart';

import 'cart_event.dart';
import 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<InitialCartEvent>(
        (event, emit) => emit(SuccessState(cartItems: cartList)));
    on<CartRemovedEvent>((event, emit) {
      cartList.remove(event.item);
      emit(RemovedSuccessCartState());
      emit(SuccessState(cartItems: cartList));
    });
  }
}
