import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management/data/wishlistItems.dart';
import 'package:state_management/features/wishList/bloc/wishlistEvent.dart';
import 'package:state_management/features/wishList/bloc/wishlistState.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(wishlistInitialState()) {
    on<InitialWishlistEvent>((event, emit) {
      emit(SuccessState(wishlist: wishlist));
    });
    on<RemovedWishlistEvent>((event, emit) {
      wishlist.remove(event.list);
      emit(RemovedSuccessWishlist());
      emit(SuccessState(wishlist: wishlist));
    });
  }
}
