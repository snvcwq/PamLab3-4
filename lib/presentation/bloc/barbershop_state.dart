import 'package:barbershop/domain/entities/main_banner.dart';
import 'package:barbershop/domain/entities/barbershop.dart';
import 'package:barbershop/domain/entities/most_recommended_barbershop.dart';
import 'package:barbershop/domain/entities/nearest_barbershop.dart';

class BarbershopState {
  final MainBanner banner;
  final List<Barbershop> barbershops;
  final List<NearestBarbershop> nearestBarbershops;
  final List<MostRecommendedBarbershop> mostRecommendedBarbershops;
  final bool isLoading;

  BarbershopState({
    required this.banner,
    required this.barbershops,
    required this.nearestBarbershops,
    required this.mostRecommendedBarbershops,
    required this.isLoading,
  });

  BarbershopState.initial()
      : banner = MainBanner(image: "", buttonTitle: ""),
        barbershops = [],
        nearestBarbershops = [],
        mostRecommendedBarbershops = [],
        isLoading = true;

  BarbershopState.loaded({
    required MainBanner banner,
    required List<Barbershop> barbershops,
    required List<NearestBarbershop> nearestBarbershops,
    required List<MostRecommendedBarbershop> mostRecommendedBarbershops,
  })  : banner = banner,
        barbershops = barbershops,
        nearestBarbershops = nearestBarbershops,
        mostRecommendedBarbershops = mostRecommendedBarbershops,
        isLoading = false;
}