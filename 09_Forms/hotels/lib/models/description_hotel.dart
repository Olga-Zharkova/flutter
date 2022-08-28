import 'package:json_annotation/json_annotation.dart';
import 'package:untitled6/models/address_hotel.dart';
import 'package:untitled6/models/services_hotel.dart';

part 'description_hotel.g.dart';

@JsonSerializable()
class DescriptionHotel {
  String uuid;
  String name;
  String poster;
  AddressHotel address;
  double price;
  double rating;
  ServicesHotel services;
  List<String> photos;

  DescriptionHotel({
    required this.uuid,
    required this.name,
    required this.poster,
    required this.address,
    required this.price,
    required this.rating,
    required this.services,
    required this.photos,
  });

  factory DescriptionHotel.fromJson(Map<String, dynamic> json) =>
      _$DescriptionHotelFromJson(json);

  Map<String, dynamic> toJson() => _$DescriptionHotelToJson(this);
}
