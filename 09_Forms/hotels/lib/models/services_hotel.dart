import 'package:json_annotation/json_annotation.dart';

part 'services_hotel.g.dart';

@JsonSerializable()
class ServicesHotel {
  List<String> free;
  List<String> paid;

  ServicesHotel({required this.free, required this.paid});

  factory ServicesHotel.fromJson(Map<String, dynamic> json) =>
      _$ServicesHotelFromJson(json);

  Map<String, dynamic> toJson() => _$ServicesHotelToJson(this);
}
