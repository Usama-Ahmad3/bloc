// ignore_for_file: constant_pattern_never_matches_value_type

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management/features/cart/ui/cart.dart';
import 'package:state_management/features/home/bloc/bloc_event.dart';
import 'package:state_management/features/home/ui/listTile.dart';
import 'package:state_management/features/wishList/ui/wishlist.dart';

import '../bloc/bloc_bloc.dart';
import '../bloc/bloc_state.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    bloc.add(InitialEvent());
    super.initState();
  }

  final BlocBloc bloc = BlocBloc();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BlocBloc, BlocState>(
      bloc: bloc,
      buildWhen: (previus, current) => current is! HomeActionState,
      listenWhen: (previus, current) => current is HomeActionState,
      listener: (context, state) {
        if (state is NavigateToCartPageState) {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => const CartScreen()));
        } else if (state is NavigateToWishlistPageState) {
          Navigator.push(context,
              MaterialPageRoute(builder: (_) => const WishlistScreen()));
        } else if (state is HomeProductCarted) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('Item Saved')));
        } else if (state is HomeProductWishlisted) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('Item Saved')));
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case LoadingState:
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          case SuccessState:
            var succesState = state as SuccessState;
            return Scaffold(
                appBar: AppBar(title: const Text("Grocery BLoc"), actions: [
                  IconButton(
                      onPressed: () {
                        bloc.add(HomeWishlistNavigateEvent());
                      },
                      icon: const Icon(Icons.favorite_border)),
                  IconButton(
                      onPressed: () {
                        bloc.add(HomecartNavigateEvent());
                      },
                      icon: const Icon(Icons.shopping_basket))
                ]),
                body: ListView.builder(
                    itemCount: succesState.product.length,
                    itemBuilder: ((context, index) {
                      return ListTileWidget(
                        productList: succesState.product[index],
                        bloc: bloc,
                      );
                    })));
          case ErrorState:
            return const Scaffold(
              body: Center(child: Text('Error')),
            );
          default:
            return const SizedBox();
        }
      },
    );
  }
}
