import 'package:barbershop/domain/entities/main_banner.dart';

class BannerModel extends MainBanner {
  BannerModel({required String image, required String buttonTitle}) : super(image: image, buttonTitle: buttonTitle);

  factory BannerModel.fromJson(Map<String, dynamic> json) {
    return BannerModel(image: json['image'], buttonTitle: json['button_title']);
  }
}