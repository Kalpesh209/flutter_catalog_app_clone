import 'package:flutter/material.dart';
import 'package:flutter_catalog_app_clone/Business/app_store.dart';
import 'package:flutter_catalog_app_clone/Models/cart_model.dart';
import 'package:flutter_catalog_app_clone/Presentation/Widgets/catalog_image.dart';
import 'package:velocity_x/velocity_x.dart';

/*
Title:CartScreen
Purpose:CartScreen
Created On :
Edited On:
Author: Kalpesh Khandla
*/

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CartModel cart = (VxState.store as AppStore).cart;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "Cart".text.color(context.theme.colorScheme.secondary).make(),
      ),
      body: Column(
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: _CartList(),
          )),
          if (cart.items.isNotEmpty)
            "Swipe left to delete".text.color(Colors.grey).make().p16(),
          Divider(),
          _CartTotal(),
        ],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  const _CartTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CartModel cart = (VxState.store as AppStore).cart;
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          VxConsumer(
            notifications: {},
            mutations: {RemoveMutation},
            builder: (context, store, status) {
              return Text(
                "\$${cart.totalprice}",
                style: TextStyle(
                    color: Theme.of(context).colorScheme.primary, fontSize: 35),
              );
            },
          ),
          SizedBox(
            width: 30,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.secondary,
                minimumSize: Size(120, 50)),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Buying not supported yet!"),
                ),
              );
            },
            child: Text(
              "Buy",
              style: TextStyle(
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveMutation]);
    final CartModel cart = (VxState.store as AppStore).cart;
    return cart.items.isEmpty
        ? "Cart is Empty"
            .text
            .xl2
            .color(context.theme.colorScheme.secondary)
            .makeCentered()
        : ListView.builder(
            itemCount: cart.items.length,
            itemBuilder: (context, index) {
              final cartItem = cart.items[index];
              return SizedBox(
                width: double.infinity,
                child: Dismissible(
                  key: Key(cartItem.id.toString()),
                  direction: DismissDirection.endToStart,
                  onDismissed: (direction) {
                    RemoveMutation(cartItem);
                  },
                  child: VxBox(
                    child: Row(
                      children: [
                        Hero(
                          tag: Key(cartItem.id.toString()),
                          child: CatalogImageWidget(
                            image: cartItem.image,
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              cartItem.name.text.lg
                                  .color(context.theme.colorScheme.secondary)
                                  .bold
                                  .make(),
                              cartItem.desc.text
                                  .color(context.theme.colorScheme.secondary)
                                  .make(),
                              10.heightBox,
                              "\$${cartItem.price}"
                                  .text
                                  .bold
                                  .xl
                                  .color(context.theme.colorScheme.secondary)
                                  .make(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                      .color(context.theme.colorScheme.tertiary) // Card color
                      .rounded
                      .square(150)
                      .make()
                      .py16(),
                ),
              );
            },
          );
  }
}
