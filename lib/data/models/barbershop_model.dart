import 'package:barbershop/domain/entities/barbershop.dart';

class BarbershopModel extends Barbershop {
  BarbershopModel({
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

  factory BarbershopModel.fromJson(Map<String, dynamic> json) {
    return BarbershopModel(
      name: json['name'],
      locationWithDistance: json['location_with_distance'],
      image: json['image'],
      reviewRate: json['review_rate'].toDouble(),
    );
  }
}