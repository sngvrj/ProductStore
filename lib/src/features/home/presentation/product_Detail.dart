// ignore: file_names
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:store_app/src/utils/src/ui_dimens.dart';
import '../dataModel/product_respose.dart';
import '../provider/fetch_products.dart';

class ProductDetail extends HookConsumerWidget {
  const ProductDetail({Key? key, this.product, required this.index})
      : super(key: key);

  final ProductListResponse? product;
  final int index;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allproducts = ref.watch(allProductsProvider);

    return Scaffold(
        // backgroundColor: Colors.black12,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            "ProductDetail",
            style: TextStyle(color: Colors.black),
          ),
          leading: const BackButton(color: Colors.black),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.shopping_cart,
                  color: Colors.purple,
                ),
              ),
            )
          ],
        ),
        body: allproducts.when(
            data: (products) {
              final element = products.allProducts!.elementAt(index);
              return Column(
                children: [
                  Image.network(
                    element.image.toString(),
                    height: MediaQuery.of(context).size.height * 0.4,
                    width: context.screenWidth,
                    fit: BoxFit.fill,
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                element.title.toString(),
                                style:
                                    Theme.of(context).textTheme.headlineSmall,
                              ),
                            ),
                            const SizedBox(width: 16.0),
                            Chip(
                                label: Text(
                              "  \$ ${element.price}".toString(),
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            )),
                          ],
                        ).paddingAll(8),
                        const Text(
                          "Description",
                          style: TextStyle(fontSize: 20),
                        ).paddingAll(8),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 16, horizontal: 12),
                          child: Text(
                            element.description.toString(),
                          ),
                        ),
                        const SizedBox(height: 18),
                        // const SizedBox(height: 32),
                        Center(
                          child: SizedBox(
                            width: 200,
                            height: 48,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.purple,
                                  shape: const StadiumBorder()),
                              child: const Text("Add to Cart"),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              );
            },
            error: (e, t) {
              return const Text("Error");
            },
            loading: () => const CircularProgressIndicator()));
  }
}
