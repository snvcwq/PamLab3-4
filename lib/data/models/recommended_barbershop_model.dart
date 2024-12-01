import 'package:barbershop/domain/entities/most_recommended_barbershop.dart';

class RecommendedBarbershopModel extends MostRecommendedBarbershop {
  RecommendedBarbershopModel({
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

  factory RecommendedBarbershopModel.fromJson(Map<String, dynamic> json) {
    return RecommendedBarbershopModel(
      name: json['name'],
      locationWithDistance: json['location_with_distance'],
      image: json['image'],
      reviewRate: json['review_rate'].toDouble(),
    );
  }
}