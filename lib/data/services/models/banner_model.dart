import 'package:json_annotation/json_annotation.dart';

part 'banner_model.g.dart';

@JsonSerializable()
class BannerResponse {
  final BannerData data;
  final String? message;
  final List<dynamic> errorList;

  BannerResponse({required this.data, this.message, required this.errorList});

  factory BannerResponse.fromJson(Map<String, dynamic> json) => _$BannerResponseFromJson(json);
  Map<String, dynamic> toJson() => _$BannerResponseToJson(this);
}

@JsonSerializable()
class BannerData {
  final bool isEnabled;
  final List<Banner> banners;

  BannerData({required this.isEnabled, required this.banners});

  factory BannerData.fromJson(Map<String, dynamic> json) => _$BannerDataFromJson(json);
  Map<String, dynamic> toJson() => _$BannerDataToJson(this);
}

@JsonSerializable()
class Banner {
  final String imageUrl;
  final int sliderType;
  final int entityId;
  final int id;

  Banner({
    required this.imageUrl,
    required this.sliderType,
    required this.entityId,
    required this.id,
  });

  factory Banner.fromJson(Map<String, dynamic> json) => _$BannerFromJson(json);
  Map<String, dynamic> toJson() => _$BannerToJson(this);
}