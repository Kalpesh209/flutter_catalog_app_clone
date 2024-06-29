import 'package:flutter/material.dart';
import 'package:flutter_catalog_app_clone/AppUtils/theme_provider.dart';
import 'package:provider/provider.dart';

class CatalogHeaderWidget extends StatefulWidget {
  const CatalogHeaderWidget({Key? key}) : super(key: key);

  @override
  State<CatalogHeaderWidget> createState() => _CatalogHeaderState();
}

class _CatalogHeaderState extends State<CatalogHeaderWidget> {
  bool isDarkMode = false;
  changeTheme() {
    Provider.of<ThemeProvider>(context, listen: false).changeTheme();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Catalog App",
              style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary, fontSize: 28),
            ),
            IconButton(
              onPressed: () {
                changeTheme();
              },
              icon: Provider.of<ThemeProvider>(context).isDark
                  ? Icon(
                      Icons.dark_mode,
                      size: 32,
                      color: Theme.of(context).colorScheme.secondary,
                    )
                  : Icon(
                      Icons.light_mode,
                      size: 32,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
            )
          ],
        ),
        Text(
          "Trending Products",
          style: TextStyle(
              color: Theme.of(context).colorScheme.secondary, fontSize: 14),
        )
      ],
    );
  }
}
