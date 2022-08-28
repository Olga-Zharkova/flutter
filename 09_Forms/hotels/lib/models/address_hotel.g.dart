// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_hotel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddressHotel _$AddressHotelFromJson(Map<String, dynamic> json) => AddressHotel(
      country: json['country'] as String,
      street: json['street'] as String,
      city: json['city'] as String,
      zipCode: json['zip_code'] as int,
      coords: CoordinatesHotel.fromJson(json['coords'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AddressHotelToJson(AddressHotel instance) =>
    <String, dynamic>{
      'country': instance.country,
      'street': instance.street,
      'city': instance.city,
      'zip_code': instance.zipCode,
      'coords': instance.coords,
    };
