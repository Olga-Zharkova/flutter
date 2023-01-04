import 'package:injectable/injectable.dart';
import 'package:untitled1/domain/product.dart';
import 'package:untitled1/mock_server/product_service.dart';

@LazySingleton(as: DummyProductService)
class DummyProductService implements ProductService {
  @override
  Future<List<Product>> getListProduct() async {
    await Future.delayed(
      const Duration(seconds: 1),
    );
    return List.generate(
      20,
      (index) => Product(
        id: index,
        name: "name $index",
        price: index.toDouble(),
        description: "description $index",
      ),
    );
  }

  @override
  Future<Product> getProductById(int id) async {
    await Future.delayed(
      const Duration(seconds: 1),
    );
    return Product(
      id: id,
      name: 'name $id',
      price: id.toDouble(),
      description: 'description $id',
    );
  }
}
