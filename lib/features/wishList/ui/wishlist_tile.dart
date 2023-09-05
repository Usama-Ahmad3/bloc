import 'package:flutter/material.dart';
import 'package:state_management/features/cart/cart_bloc.dart';
import 'package:state_management/features/cart/cart_event.dart';
import 'package:state_management/features/home/bloc/bloc_event.dart';
import 'package:state_management/features/home/product_models/product_model.dart';
import 'package:state_management/features/wishList/bloc/wishlistBloc.dart';
import 'package:state_management/features/wishList/bloc/wishlistEvent.dart';

class WishlistTileWidget extends StatefulWidget {
  final WishlistBloc bloc;
  dynamic wishlistItem;
  WishlistTileWidget(
      {super.key, required this.wishlistItem, required this.bloc});

  @override
  State<WishlistTileWidget> createState() => _WishlistTileWidgetState();
}

class _WishlistTileWidgetState extends State<WishlistTileWidget> {
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
              image: DecorationImage(
                  image: NetworkImage(widget.wishlistItem.url))),
        ),
        Text(widget.wishlistItem.name),
        Text(widget.wishlistItem.unit),
        Text(widget.wishlistItem.quantity),
        Row(
          children: [
            IconButton(
                onPressed: () {
                  widget.bloc
                      .add(RemovedWishlistEvent(list: widget.wishlistItem));
                },
                icon: const Icon(Icons.favorite_border)),
            IconButton(
                onPressed: () {
                  // widget.bloc.add(CartRemovedEvent(item: widget.cartItem));
                },
                icon: const Icon(Icons.shopping_basket))
          ],
        )
      ],
    );
  }
}
