import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_catalog_app_clone/AppUtils/app_routes.dart';
import 'package:flutter_catalog_app_clone/Business/app_store.dart';
import 'package:flutter_catalog_app_clone/Models/cart_model.dart';
import 'package:flutter_catalog_app_clone/Models/catalog_model.dart';
import 'package:flutter_catalog_app_clone/Presentation/Widgets/catalog_header.dart';
import 'package:flutter_catalog_app_clone/Presentation/Widgets/catalog_list.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:velocity_x/velocity_x.dart';

/*
Title:HomePageScreen
Purpose:HomePageScreen
Created On :
Edited On:
Author: Kalpesh Khandla
*/

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePageScreen> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    final catalogJson = await rootBundle.loadString("asset/files/catalog.json");
    final decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final cart = (VxState.store as AppStore).cart;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      floatingActionButton: VxBuilder(
        mutations: const {
          AddMutation,
          RemoveMutation,
        },
        builder: (ctx, _, __) => FloatingActionButton(
          onPressed: () => Navigator.pushNamed(
            context,
            AppRoutes.cartpageRoute,
          ),
          backgroundColor: Theme.of(context).colorScheme.onBackground,
          child: Icon(
            CupertinoIcons.cart,
            color: Theme.of(context).scaffoldBackgroundColor,
          ),
        ).badge(
          color: Vx.gray200,
          size: 22,
          count: cart.items.length,
          textStyle: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CatalogHeaderWidget(),
              if (CatalogModel.items.isNotEmpty)
                CatalogListWidget(
                  catalogModel: CatalogModel(),
                ).py16().expand()
              else
                Column(
                  children: [
                    const SizedBox(
                      height: 100,
                    ),
                    Lottie.asset(
                      "asset/files/truck.json",
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
