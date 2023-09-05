import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management/data/cartList.dart';
import 'package:state_management/data/wishlistItems.dart';
import 'package:state_management/features/home/product_models/product_model.dart';

import '../../../data/grocery.dart';
import 'bloc_event.dart';
import 'bloc_state.dart';

class BlocBloc extends Bloc<BlocEvent, BlocState> {
  BlocBloc() : super(BlocInitial()) {
    on<InitialEvent>((event, emit) async {
      emit(LoadingState());
      await Future.delayed(Duration(seconds: 3));
      emit(SuccessState(
          product: GroceryData.groceryProducts
              .map((e) => ProductModel(
                  name: e['name'],
                  quantity: e['quantity'],
                  unit: e['unit'],
                  url: e['url']))
              .toList()));
    });
    on<HomeWishlistNavigateEvent>((event, emit) {
      emit(NavigateToWishlistPageState());
      print('Wishlist Clicked');
    });
    on<HomeWishlistButtonClickedEvent>((event, emit) {
      cartList.add(event.list);
      print('HomeWishlistButton Clicked');
      emit(HomeProductWishlisted());
    });
    on<HomecartNavigateEvent>((event, emit) {
      emit(NavigateToCartPageState());
      print('Cart Clicked');
    });
    on<HomecartButtonClickedEvent>((event, emit) {
      wishlist.add(event.list);
      print('HomeCartButton Clicked');
      emit(HomeProductCarted());
    });
  }
}
