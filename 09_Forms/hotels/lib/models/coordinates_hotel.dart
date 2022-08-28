import 'package:json_annotation/json_annotation.dart';

part 'coordinates_hotel.g.dart';

@JsonSerializable()
class CoordinatesHotel {
  double lat;
  double lan;

  CoordinatesHotel({required this.lat, required this.lan});

  factory CoordinatesHotel.fromJson(Map<String, dynamic> json) =>
      _$CoordinatesHotelFromJson(json);

  Map<String, dynamic> toJson() => _$CoordinatesHotelToJson(this);
}
