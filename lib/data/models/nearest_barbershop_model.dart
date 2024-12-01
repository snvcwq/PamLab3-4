import 'package:barbershop/domain/entities/nearest_barbershop.dart';

class NearestBarbershopModel extends NearestBarbershop {
  NearestBarbershopModel({
    required String name,
    required String locationWithDistance,
    required String image,
    required double reviewRate,
  }) : super(
    name: name,
    locationWithDistance: locationWithDistance,
    image: image,
    reviewRate: reviewRate,
  );

  factory NearestBarbershopModel.fromJson(Map<String, dynamic> json) {
    return NearestBarbershopModel(
      name: json['name'],
      locationWithDistance: json['location_with_distance'],
      image: json['image'],
      reviewRate: json['review_rate'].toDouble(),
    );
  }
}