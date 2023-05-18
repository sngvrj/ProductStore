import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../services/networking/api_endpoint.dart';
import '../../../services/networking/api_service.dart';
import '../dataModel/product_respose.dart';

class ProductsRepository {
  final ApiService _apiService = ApiService();

  Future<AllProductsList> fetchAllProducts() async {
    final response =
        await http.get(Uri.parse("https://fakestoreapi.com/products"));

    final data = jsonDecode(response.body);

    return AllProductsList.fromJson(data);
    // return await _apiService.getDocumentData(
    //   endpoint: ApiEndpoint.allProducts(ProductEndPoint.ALL_Products),
    //   converter: (response) {
    //     print(response);
    //     return ProductListResponse.fromJson(response);
    //   },
    // );
  }
}
