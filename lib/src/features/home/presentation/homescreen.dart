import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:store_app/src/utils/src/ui_dimens.dart';

import '../provider/fetch_products.dart';
import 'Widgets/home_carosel.dart';
import 'Widgets/products.dart';

class HomeScreen extends StatefulHookConsumerWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final allproducts = ref.watch(allProductsProvider);
    // print(allproducts.whenData((value) => print(value)));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const Icon(
          Icons.menu,
          color: Colors.purple,
        ),
        title:  Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              "Shop App",
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: context.screenHeight * 0.35,
              child: const HomeCarousel(),
            ),
            const AllProducts()
          ],
        ),
      ),
    );
  }
}
