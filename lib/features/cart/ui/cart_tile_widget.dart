import 'package:flutter/material.dart';
import 'package:state_management/features/cart/cart_bloc.dart';
import 'package:state_management/features/cart/cart_event.dart';
import 'package:state_management/features/home/bloc/bloc_event.dart';
import 'package:state_management/features/home/product_models/product_model.dart';

class CartListTileWidget extends StatefulWidget {
  final CartBloc bloc;
  dynamic cartItem;
  CartListTileWidget({super.key, required this.cartItem, required this.bloc});

  @override
  State<CartListTileWidget> createState() => _CartListTileWidgetState();
}

class _CartListTileWidgetState extends State<CartListTileWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          height: 200,
          width: 200,
          decoration: BoxDecoration(
              image: DecorationImage(image: NetworkImage(widget.cartItem.url))),
        ),
        Text(widget.cartItem.name),
        Text(widget.cartItem.unit),
        Text(widget.cartItem.quantity),
        Row(
          children: [
            IconButton(
                onPressed: () {
                  // widget.bloc.add(CartRemovedEvent());
                },
                icon: const Icon(Icons.favorite_border)),
            IconButton(
                onPressed: () {
                  widget.bloc.add(CartRemovedEvent(item: widget.cartItem));
                },
                icon: const Icon(Icons.shopping_basket))
          ],
        )
      ],
    );
  }
}
