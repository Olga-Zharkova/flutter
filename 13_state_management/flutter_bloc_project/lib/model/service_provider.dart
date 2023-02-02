import 'package:untitled1/features.dart';

class ServiceProvider {
  final DummyProductService dummyProductService = DummyProductService();

  Future<List<Product>> getListProduct() async {
    final newGetProducts = await dummyProductService.getListProduct();
    return newGetProducts;
  }
}
