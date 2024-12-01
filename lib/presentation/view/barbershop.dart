import 'package:barbershop/domain/entities/barbershop.dart';
import 'package:barbershop/domain/entities/main_banner.dart';
import 'package:barbershop/domain/entities/most_recommended_barbershop.dart';
import 'package:barbershop/domain/entities/nearest_barbershop.dart';
import 'package:barbershop/presentation/bloc/barbershop_cubit.dart';
import 'package:barbershop/presentation/bloc/barbershop_state.dart';
import 'package:barbershop/presentation/common/image.dart';
import 'package:barbershop/presentation/wigets/app_bar_widget.dart';
import 'package:barbershop/presentation/wigets/banner_widget.dart';
import 'package:barbershop/presentation/wigets/barbershops_widget.dart';
import 'package:barbershop/presentation/wigets/nearest_barbershops_widget.dart';
import 'package:barbershop/presentation/wigets/recommended_barbershops_widget.dart';
import 'package:barbershop/presentation/wigets/search_bar_widger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BarbershopHomepage extends StatelessWidget {
  const BarbershopHomepage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(107),
          child: AppBar(
            flexibleSpace: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: AppBarWidget(
                location: 'Yogyakarta',
                name: 'Joe Samanta',
                trailing: CommonImage(image: 'images/profile.png', width: 42, height: 42),
              ),
            ),
          ),
        ),
        body: BlocBuilder<BarbershopCubit, BarbershopState>(
          builder: (context, state) {
            if (state.isLoading) {
              return Center(child: CircularProgressIndicator());
            }

            return ListView(
              padding: EdgeInsets.all(16.0),
              children: [
                _buildBannerSection(state.banner),
                SizedBox(height: 20),
                _buildSearchBarSection(),
                SizedBox(height: 10),
                _buildNearestBarberShopsSection(state.nearestBarbershops),
                SizedBox(height: 20),
                _buildRecommendedBarbershopsSection(state.mostRecommendedBarbershops),
                SizedBox(height: 20),
                _buildAllBarbershopsSection(state.barbershops),
                SizedBox(height: 20),
              ],
            );
          },
        ),
      ),
    );
  }
}

Widget _buildBannerSection(MainBanner banner) {
  return BannerWidget(banner: banner);
}

Widget _buildSearchBarSection() {
  return SearchBarWidget(top: 24, left: 16);
}

Widget _buildNearestBarberShopsSection(List<NearestBarbershop> nearestBarbershops) {
  return NearestBarbershopWidget(barbershops: nearestBarbershops);
}

Widget _buildRecommendedBarbershopsSection(List<MostRecommendedBarbershop> recommendedBarbershops) {
  return RecommendedBarberShopsWidget(barbershops: recommendedBarbershops);
}

Widget _buildAllBarbershopsSection(List<Barbershop> barbershops) {
  return AllBarberShopsWidget(barbershops: barbershops);
}