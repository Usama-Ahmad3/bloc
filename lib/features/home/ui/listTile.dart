import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:state_management/features/home/bloc/bloc_event.dart';
import 'package:state_management/features/home/product_models/product_model.dart';

import '../bloc/bloc_bloc.dart';

class ListTileWidget extends StatefulWidget {
  final BlocBloc bloc;
  dynamic productList;
  ListTileWidget({super.key, required this.productList, required this.bloc});

  @override
  State<ListTileWidget> createState() => _ListTileWidgetState();
}

class _ListTileWidgetState extends State<ListTileWidget> {
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
              image:
                  DecorationImage(image: NetworkImage(widget.productList.url))),
        ),
        Text(widget.productList.name),
        Text(widget.productList.unit),
        Text(widget.productList.quantity),
        Row(
          children: [
            IconButton(
                onPressed: () {
                  widget.bloc.add(
                      HomecartButtonClickedEvent(list: widget.productList));
                },
                icon: const Icon(Icons.favorite_border)),
            IconButton(
                onPressed: () {
                  widget.bloc.add(
                      HomeWishlistButtonClickedEvent(list: widget.productList));
                },
                icon: const Icon(Icons.shopping_basket))
          ],
        )
      ],
    );
  }
}
