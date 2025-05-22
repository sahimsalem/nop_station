// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banner_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BannerResponse _$BannerResponseFromJson(Map<String, dynamic> json) =>
    BannerResponse(
      data: BannerData.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
      errorList: json['errorList'] as List<dynamic>,
    );

Map<String, dynamic> _$BannerResponseToJson(BannerResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'message': instance.message,
      'errorList': instance.errorList,
    };

BannerData _$BannerDataFromJson(Map<String, dynamic> json) => BannerData(
  isEnabled: json['isEnabled'] as bool,
  banners: (json['banners'] as List<dynamic>)
      .map((e) => Banner.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$BannerDataToJson(BannerData instance) =>
    <String, dynamic>{
      'isEnabled': instance.isEnabled,
      'banners': instance.banners,
    };

Banner _$BannerFromJson(Map<String, dynamic> json) => Banner(
  imageUrl: json['imageUrl'] as String,
  sliderType: (json['sliderType'] as num).toInt(),
  entityId: (json['entityId'] as num).toInt(),
  id: (json['id'] as num).toInt(),
);

Map<String, dynamic> _$BannerToJson(Banner instance) => <String, dynamic>{
  'imageUrl': instance.imageUrl,
  'sliderType': instance.sliderType,
  'entityId': instance.entityId,
  'id': instance.id,
};
