import 'package:barbershop/domain/entities/main_banner.dart';
import 'package:barbershop/domain/entities/barbershop.dart';
import 'package:barbershop/domain/entities/most_recommended_barbershop.dart';
import 'package:barbershop/domain/entities/nearest_barbershop.dart';
import 'package:barbershop/domain/repositories/barbershop_repo.dart';

class LoadBarberShopData {
  final BarberShopRepository repository;

  LoadBarberShopData(this.repository);

  Future<MainBanner> executeBanner() => repository.getBanner();
  Future<List<Barbershop>> executeBarbershops() => repository.getBarberShopsList();
  Future<List<MostRecommendedBarbershop>> executeRecommendedBarbershops() => repository.getMostRecommendedBarberShopsList();
  Future<List<NearestBarbershop>> executeNearestBarbershops() => repository.getNearestBarberShopsList();
}