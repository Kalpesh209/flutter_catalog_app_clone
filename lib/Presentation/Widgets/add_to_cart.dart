import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_catalog_app_clone/Business/app_store.dart';
import 'package:flutter_catalog_app_clone/Models/cart_model.dart';
import 'package:flutter_catalog_app_clone/Models/catalog_model.dart';
import 'package:velocity_x/velocity_x.dart';

class AddToCartWidget extends StatelessWidget {
  final Item catalog;
  AddToCartWidget({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [AddMutation, RemoveMutation]);
    final CartModel cart = (VxState.store as AppStore).cart;
    bool isInCart = cart.items.contains(catalog);
    return ElevatedButton(
      onPressed: () {
        if (!isInCart) {
          AddMutation(catalog);
        }
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
            Theme.of(context).colorScheme.onBackground),
        shape: MaterialStateProperty.all(StadiumBorder()),
      ),
      child: isInCart
          ? Icon(
              Icons.done,
              color: Theme.of(context).scaffoldBackgroundColor,
            )
          : Icon(
              CupertinoIcons.cart_badge_plus,
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
    );
  }
}
