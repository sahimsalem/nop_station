

import 'package:nop_station_api/data/repositories/banner_repository.dart';
import 'package:nop_station_api/data/services/api_service.dart';
import 'package:nop_station_api/domain/entities/banner.dart';

class BannerRepositoryImpl implements BannerRepository {
  final ApiService apiService;

  BannerRepositoryImpl(this.apiService);

  @override
  Future<List<Banner>> getHomePageBanners() async {
    final response = await apiService.getHomePageBanners();
    if (response.data.isEnabled) {
      return response.data.banners.map((banner) => Banner(
            imageUrl: banner.imageUrl,
            sliderType: banner.sliderType,
            entityId: banner.entityId,
            id: banner.id,
          )).toList();
    }
    return [];
  }
}