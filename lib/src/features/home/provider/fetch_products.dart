import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../dataModel/product_respose.dart';
import '../repository/product_repository.dart';

final productRepoProvider =
    Provider<ProductsRepository>((ref) => ProductsRepository());

final allProductsProvider = FutureProvider<AllProductsList>((ref) async {
  final provider = ref.watch(productRepoProvider);
  final data = await provider.fetchAllProducts();
  return data;
});
