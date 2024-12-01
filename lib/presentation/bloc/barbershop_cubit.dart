import 'package:barbershop/domain/helpers/load_data.dart';
import 'package:barbershop/presentation/bloc/barbershop_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BarbershopCubit extends Cubit<BarbershopState> {
  final LoadBarberShopData loadBarberShopData;

  BarbershopCubit(this.loadBarberShopData) : super(BarbershopState.initial());

  void loadData() async {
    final banner = await loadBarberShopData.executeBanner();
    final barbershops = await loadBarberShopData.executeBarbershops();
    final nearestBarbershops = await loadBarberShopData.executeNearestBarbershops();
    final mostRecommendedBarbershops = await loadBarberShopData.executeRecommendedBarbershops();

    emit(BarbershopState.loaded(
        banner: banner,
        barbershops: barbershops,
        nearestBarbershops: nearestBarbershops,
        mostRecommendedBarbershops: mostRecommendedBarbershops
    ));
  }
}