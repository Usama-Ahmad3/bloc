import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management/features/cart/cart_bloc.dart';
import 'package:state_management/features/cart/cart_event.dart';
import 'package:state_management/features/cart/cart_state.dart';
import 'package:state_management/features/cart/ui/cart_tile_widget.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final CartBloc cartBloc = CartBloc();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cartBloc.add(InitialCartEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CartScreen'),
      ),
      body: BlocConsumer(
        bloc: cartBloc,
        listenWhen: (previous, current) => current is CartActionState,
        buildWhen: (previous, current) => current is! CartActionState,
        listener: (context, state) {
          if (state is RemovedSuccessCartState) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text('Item Removed')));
          } else if (state is CartSuccessEvent) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text('Item Saved')));
          }
        },
        builder: (context, state) {
          switch (state.runtimeType) {
            case SuccessState:
              final cartState = state as SuccessState;
              return ListView.builder(
                  itemCount: cartState.cartItems.length,
                  itemBuilder: ((context, index) {
                    return CartListTileWidget(
                      cartItem: cartState.cartItems[index],
                      bloc: cartBloc,
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
