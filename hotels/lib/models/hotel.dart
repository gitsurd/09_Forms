//import 'dart:html';

import 'package:json_annotation/json_annotation.dart';

part 'hotel.g.dart';

@JsonSerializable(explicitToJson: true)
class HotelPreview {
  final String uuid;
  final String name;
  final String poster;

  HotelPreview({this.uuid, this.name, this.poster});

  factory HotelPreview.fromJson(Map<String, dynamic> json) =>
      _$HotelPreviewFromJson(json);
  Map<String, dynamic> toJson() => _$HotelPreviewToJson(this);
}

@JsonSerializable(explicitToJson: true)
class HotelDetal {
  final String uuid;
  final String name;
  final String poster;
  final HotelAdress address;

  final double price;
  final double rating;
  //final Hotelservices services;
  final Map<String, dynamic> services;
  final List<String> photos;

  HotelDetal(
      {this.uuid,
      this.name,
      this.poster,
      this.address,
      this.photos,
      this.price,
      this.rating,
      this.services});

  factory HotelDetal.fromJson(Map<String, dynamic> json) =>
      _$HotelDetalFromJson(json);
  Map<String, dynamic> toJson() => _$HotelDetalToJson(this);
}

@JsonSerializable(explicitToJson: true)
class HotelAdress {
  final String country;
  final String street;
  final String city;
  final int zip_code;
  final HotelCoords coords;

  HotelAdress(
      {this.country, this.city, this.street, this.zip_code, this.coords});

  factory HotelAdress.fromJson(Map<String, dynamic> json) =>
      _$HotelAdressFromJson(json);
  Map<String, dynamic> toJson() => _$HotelAdressToJson(this);
}

@JsonSerializable(explicitToJson: true)
class HotelCoords {
  final double lat;
  final double lan;

  HotelCoords({this.lan, this.lat});

  factory HotelCoords.fromJson(Map<String, dynamic> json) =>
      _$HotelCoordsFromJson(json);
  Map<String, dynamic> toJson() => _$HotelCoordsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Hotelservices {
  final Map<String, dynamic> services;

  Hotelservices({this.services});

  factory Hotelservices.fromJson(Map<String, dynamic> json) =>
      _$HotelservicesFromJson(json);
  Map<String, dynamic> toJson() => _$HotelservicesToJson(this);
}
