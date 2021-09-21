import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/products_provider.dart';

import 'product_item.dart';

class ProductsGrid extends StatelessWidget {
  final bool _showOnlyFavourites;

  ProductsGrid(this._showOnlyFavourites);

  @override
  Widget build(BuildContext context) {
    //this is how to listen to changes - which will cause builder in here to rebuild
    final productsProvider = Provider.of<ProductsProvider>(context);
    final products = _showOnlyFavourites
        ? productsProvider.favouriteItems
        : productsProvider.items;
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: products.length,
      itemBuilder: (BuildContext context, index) {
        return ChangeNotifierProvider.value(
          value: products[index],
          child: ProductItem(
              // id: products[index].id,
              // title: products[index].title,
              // imageUrl: products[index].imageUrl,
              // price: products[index].price,
              ),
        );
      },
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, //amount of columns
        childAspectRatio: 3 / 2, //height-width ratio of a child
        crossAxisSpacing: 10, //spacing between columns
        mainAxisSpacing: 10, //space betwe
      ),
    );
  }
}
