import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:barbershop/data/models/banner_model.dart';
import 'package:barbershop/data/models/barbershop_model.dart';
import 'package:barbershop/data/models/nearest_barbershop_model.dart';
import 'package:barbershop/data/models/recommended_barbershop_model.dart';

class RemoteDataSource {
  Future<Map<String, dynamic>> _loadJson() async {
    final jsonString = await rootBundle.loadString('json/data.json');
    return json.decode(jsonString) as Map<String, dynamic>;
  }

  Future<BannerModel> getMainBanner() async {
    final data = await _loadJson();
    return BannerModel.fromJson(data['banner']);
  }

  Future<List<NearestBarbershopModel>> getNearestBarbershops() async {
    final data = await _loadJson();
    final List<dynamic> barbershops = data['nearest_barbershop'];
    return barbershops
        .map((json) => NearestBarbershopModel.fromJson(json))
        .toList();
  }

  Future<List<RecommendedBarbershopModel>> getMostRecommendedBarbershops() async {
    final data = await _loadJson();
    final List<dynamic> recommended = data['most_recommended'];
    return recommended
        .map((json) => RecommendedBarbershopModel.fromJson(json))
        .toList();
  }

  Future<List<BarbershopModel>> getBarbershopList() async {
    final data = await _loadJson();
    final List<dynamic> list = data['list'];
    return list.map((json) => BarbershopModel.fromJson(json)).toList();
  }
}
