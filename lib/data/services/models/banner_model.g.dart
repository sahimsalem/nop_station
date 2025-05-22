// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banner_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BannerResponse _$BannerResponseFromJson(Map<String, dynamic> json) =>
    BannerResponse(
      data: json['Data'] == null
          ? null
          : BannerData.fromJson(json['Data'] as Map<String, dynamic>),
      message: json['Message'] as String?,
      errorList: json['ErrorList'] as List<dynamic>?,
    );

Map<String, dynamic> _$BannerResponseToJson(BannerResponse instance) =>
    <String, dynamic>{
      'Data': instance.data,
      'Message': instance.message,
      'ErrorList': instance.errorList,
    };

BannerData _$BannerDataFromJson(Map<String, dynamic> json) => BannerData(
  isEnabled: json['IsEnabled'] as bool?,
  sliders: (json['Sliders'] as List<dynamic>?)
      ?.map((e) => Banner.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$BannerDataToJson(BannerData instance) =>
    <String, dynamic>{
      'IsEnabled': instance.isEnabled,
      'Sliders': instance.sliders,
    };

Banner _$BannerFromJson(Map<String, dynamic> json) => Banner(
  imageUrl: json['ImageUrl'] as String,
  sliderType: (json['SliderType'] as num).toInt(),
  entityId: (json['EntityId'] as num).toInt(),
  id: (json['Id'] as num).toInt(),
);

Map<String, dynamic> _$BannerToJson(Banner instance) => <String, dynamic>{
  'ImageUrl': instance.imageUrl,
  'SliderType': instance.sliderType,
  'EntityId': instance.entityId,
  'Id': instance.id,
};
