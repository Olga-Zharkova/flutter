import 'package:untitled1/domain/product.dart';

abstract class ProductService {
  Future<List<Product>> getListProduct();
  Future<Product> getProductById(int id);
}
