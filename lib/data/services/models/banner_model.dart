import 'package:json_annotation/json_annotation.dart';

part 'banner_model.g.dart';

@JsonSerializable()
class BannerResponse {
  @JsonKey(name: 'Data')
  final BannerData? data;
  @JsonKey(name: 'Message')
  final String? message;
  @JsonKey(name: 'ErrorList')
  final List<dynamic>? errorList;

  BannerResponse({this.data, this.message, this.errorList});

  factory BannerResponse.fromJson(Map<String, dynamic> json) => _$BannerResponseFromJson(json);
  Map<String, dynamic> toJson() => _$BannerResponseToJson(this);
}

@JsonSerializable()
class BannerData {
  @JsonKey(name: 'IsEnabled')
  final bool? isEnabled;
  @JsonKey(name: 'Sliders')
  final List<Banner>? sliders;

  BannerData({this.isEnabled, this.sliders});

  factory BannerData.fromJson(Map<String, dynamic> json) => _$BannerDataFromJson(json);
  Map<String, dynamic> toJson() => _$BannerDataToJson(this);
}

@JsonSerializable()
class Banner {
  @JsonKey(name: 'ImageUrl')
  final String imageUrl;
  @JsonKey(name: 'SliderType')
  final int sliderType;
  @JsonKey(name: 'EntityId')
  final int entityId;
  @JsonKey(name: 'Id')
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