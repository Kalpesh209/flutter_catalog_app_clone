import 'package:flutter/material.dart';
import 'package:flutter_catalog_app_clone/Models/catalog_model.dart';
import 'package:flutter_catalog_app_clone/Presentation/Screens/home_detail_screen.dart';
import 'package:flutter_catalog_app_clone/Presentation/Widgets/add_to_cart.dart';
import 'package:velocity_x/velocity_x.dart';
import 'catalog_image.dart';

class CatalogListWidget extends StatelessWidget {
  final CatalogModel catalogModel;
  const CatalogListWidget({
    Key? key,
    required this.catalogModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: CatalogModel.items.length,
        itemBuilder: (context, index) {
          final catalog = CatalogModel.items[index];
          return InkWell(
            child: CatalogItem(catalog: catalog),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomeDetailScreen(catalog: catalog),
              ),
            ),
          );
        });
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;

  const CatalogItem({super.key, required this.catalog});

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          Hero(
            tag: Key(
              catalog.id.toString(),
            ),
            child: CatalogImageWidget(
              image: catalog.image,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                catalog.name.text.lg
                    .color(context.theme.colorScheme.secondary)
                    .bold
                    .make(),
                catalog.desc.text
                    .color(context.theme.colorScheme.secondary)
                    .make(),
                10.heightBox,
                ButtonBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  buttonPadding: EdgeInsets.zero,
                  children: [
                    "\$${catalog.price}"
                        .text
                        .bold
                        .xl
                        .color(context.theme.colorScheme.secondary)
                        .make(),
                    AddToCartWidget(catalog: catalog)
                  ],
                ).pOnly(right: 8.0),
              ],
            ),
          )
        ],
      ),
    )
        .color(context.theme.colorScheme.tertiary) //card color
        .rounded
        .square(150)
        .make()
        .py16();
  }
}
