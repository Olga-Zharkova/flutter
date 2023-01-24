import 'package:injectable/injectable.dart';
import 'package:untitled1/domain/product.dart';
import 'package:untitled1/mock_server/product_service.dart';


List<String> names = [
  'Ромашки', //1
  'Гвоздики', //2
  'Розы красные', //3
  'Розы белые', //4
  'Ландыши', //5
  'Хризантемы', //6
  'Мимозы', //7
  'Васильки', //8
  'Орхидея', //9
  'Тюльпаны красные', //10
  'Тюльпаны желтые', //11
  'Георгины', //12
  'Колокольчики', //13
  'Пионы розовые', //14
  'Пионы голубые', //15
];

@LazySingleton(as: DummyProductService)
class DummyProductService implements ProductService {
  @override
  Future<List<Product>> getListProduct() async {
    await Future.delayed(
      const Duration(seconds: 1),
    );
    return List.generate(
      15,
      (index) => Product(
        id: index,
        name: names[index],
        price: index.toDouble(),
        description: "description $index",
        image: index % 5 != 0
            ? '$index'
            : 'null',
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
      image: id % 5 != 0
          ? 'assets/images/$id.jpg'
          : 'assets/images/null.jpg',
    );
  }
}
