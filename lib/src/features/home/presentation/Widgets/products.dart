import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:store_app/src/features/home/presentation/Widgets/product_card.dart';
import 'package:store_app/src/routing/route_constants.dart';

import '../../../../utils/src/utils.dart';
import '../../provider/fetch_products.dart';

class AllProducts extends HookConsumerWidget {
  const AllProducts({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allproducts = ref.watch(allProductsProvider);

    return allproducts.when(
        data: (products) {
          return Scrollbar(
            child: GridView.builder(
              primary: false,
              shrinkWrap: true,
              padding: EdgeInsets.all(Utils.getAllSize(13, context)),
              itemCount: products.allProducts?.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.7,
                  crossAxisSpacing: Utils.getScreenWidth(context, 13),
                  mainAxisSpacing: Utils.getScreenHeight(context, 13)),
              itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, RouteConstants.productDetail,
                        arguments: {'index': index});
                  },
                  child: ProductCard(
                    title: products.allProducts![index].title.toString(),
                    price: products.allProducts![index].price.toString(),
                    image: products.allProducts![index].image.toString(),
                    rating:
                        products.allProducts![index].rating!.rate.toString(),
                  )),
            ),
          );
        },
        error: (e, t) {
          return Text("Error");
        },
        loading: () => CircularProgressIndicator());
  }
}
