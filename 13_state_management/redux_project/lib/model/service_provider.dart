import 'package:untitled1/features.dart';

class ServiceProvider {
  final DummyProductService _dummyProductService = DummyProductService();

  Future<List<Product>> getListProduct() async {
    final newGetProducts = await _dummyProductService.getListProduct();
    return newGetProducts;
  }
}
