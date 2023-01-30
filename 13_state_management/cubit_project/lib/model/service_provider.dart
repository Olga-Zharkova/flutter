import 'package:untitled1/features.dart';
import 'package:get_it/get_it.dart';

class ServiceProvider {
  final DummyProductService _dummyProductService = DummyProductService();

  Future<List<Product>> getListProduct() async {
    final newGetProducts = await _dummyProductService.getListProduct();
    return newGetProducts;
  }
}
