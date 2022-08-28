import 'package:json_annotation/json_annotation.dart';
import 'package:untitled6/models/coordinates_hotel.dart';

part 'address_hotel.g.dart';

@JsonSerializable()
class AddressHotel {
  String country;
  String street;
  String city;
  @JsonKey(name: 'zip_code')
  int zipCode;
  CoordinatesHotel coords;

  AddressHotel({
    required this.country,
    required this.street,
    required this.city,
    required this.zipCode,
    required this.coords,
  });

  factory AddressHotel.fromJson(Map<String, dynamic> json) =>
      _$AddressHotelFromJson(json);

  Map<String, dynamic> toJson() => _$AddressHotelToJson(this);
}
