import 'package:barbershop/domain/entities/main_banner.dart';
import 'package:barbershop/domain/entities/barbershop.dart';
import 'package:barbershop/domain/entities/most_recommended_barbershop.dart';
import 'package:barbershop/domain/entities/nearest_barbershop.dart';

abstract class BarberShopRepository {
  Future<MainBanner> getBanner();
  Future<List<Barbershop>> getBarberShopsList();
  Future<List<MostRecommendedBarbershop>> getMostRecommendedBarberShopsList();
  Future<List<NearestBarbershop>> getNearestBarberShopsList();
}