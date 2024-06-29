import 'package:flutter_catalog_app_clone/Models/cart_model.dart';
import 'package:flutter_catalog_app_clone/Models/catalog_model.dart';
import 'package:velocity_x/velocity_x.dart';

class AppStore extends VxStore {
  late CatalogModel catalog;
  late CartModel cart;

  AppStore() {
    catalog = CatalogModel();
    cart = CartModel();
    cart.catalog = catalog;
  }
}
