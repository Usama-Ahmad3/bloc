import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management/features/wishList/bloc/wishlistBloc.dart';
import 'package:state_management/features/wishList/bloc/wishlistEvent.dart';
import 'package:state_management/features/wishList/bloc/wishlistState.dart';

import 'wishlist_tile.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  final WishlistBloc bloc = WishlistBloc();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bloc.add(InitialWishlistEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wishlist'),
      ),
      body: BlocConsumer(
        bloc: bloc,
        buildWhen: (previous, current) => current is WishlistState,
        listenWhen: (previous, current) => current is! WishlistActionState,
        listener: (context, state) {
          if (state is RemovedSuccessWishlist) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text('Removed')));
          }
        },
        builder: (context, state) {
          switch (state.runtimeType) {
            case SuccessState:
              final cartState = state as SuccessState;
              return ListView.builder(
                  itemCount: cartState.wishlist.length,
                  itemBuilder: ((context, index) {
                    return WishlistTileWidget(
                      wishlistItem: cartState.wishlist[index],
                      bloc: bloc,
                    );
                  }));
            default:
              return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
