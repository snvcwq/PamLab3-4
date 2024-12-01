import 'package:barbershop/data/datasources/datasource.dart';
import 'package:barbershop/domain/entities/main_banner.dart';
import 'package:barbershop/domain/entities/barbershop.dart';
import 'package:barbershop/domain/entities/most_recommended_barbershop.dart';
import 'package:barbershop/domain/entities/nearest_barbershop.dart';
import 'package:barbershop/domain/repositories/barbershop_repo.dart';


class BarbershopRepositoryImpl implements BarberShopRepository {
  final RemoteDataSource remoteDataSource;

  BarbershopRepositoryImpl(this.remoteDataSource);

  Future<List<T>> _mapModelsToEntities<M, T>(
      Future<List<M>> fetchModels, T Function(M model) mapModelToEntity) async {
    final models = await fetchModels;
    return models.map(mapModelToEntity).toList();
  }

  Future<T> _mapModelToEntity<M, T>(
      Future<M> fetchModel, T Function(M model) mapModelToEntity) async {
    final model = await fetchModel;
    return mapModelToEntity(model);
  }


  @override
  Future<MainBanner> getBanner() async {
    return _mapModelToEntity(
      remoteDataSource.getMainBanner(),
          (model) => MainBanner(image: model.image, buttonTitle: model.buttonTitle),
    );
  }


  @override
  Future<List<Barbershop>> getBarberShopsList() async {
    return _mapModelsToEntities(
      remoteDataSource.getBarbershopList(),
          (model) => Barbershop(
        name: model.name,
        locationWithDistance: model.locationWithDistance,
        image: model.image,
        reviewRate: model.reviewRate,
      ),
    );
  }

  @override
  Future<List<MostRecommendedBarbershop>> getMostRecommendedBarberShopsList() async {
    return _mapModelsToEntities(
      remoteDataSource.getBarbershopList(),
          (model) => MostRecommendedBarbershop(
        name: model.name,
        locationWithDistance: model.locationWithDistance,
        image: model.image,
        reviewRate: model.reviewRate,
      ),
    );
  }

  @override
  Future<List<NearestBarbershop>> getNearestBarberShopsList() async {
    return _mapModelsToEntities(
      remoteDataSource.getNearestBarbershops(),
          (model) => NearestBarbershop(
        name: model.name,
        locationWithDistance: model.locationWithDistance,
        image: model.image,
        reviewRate: model.reviewRate,
      ),
    );
  }
}
