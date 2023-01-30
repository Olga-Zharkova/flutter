import 'package:untitled1/features.dart';

class ServiceProvider {
  Future<List<Product>> getListProduct() async {
    final DummyProductService dummyProductService = DummyProductService();
    final newGetProducts = await dummyProductService.getListProduct();
    return newGetProducts;
  }
}
