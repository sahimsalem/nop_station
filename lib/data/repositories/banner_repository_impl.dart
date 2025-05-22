import 'package:nop_station_api/data/repositories/banner_repository.dart';
import 'package:nop_station_api/data/services/api_service.dart';
import 'package:nop_station_api/domain/entities/banner.dart';

class BannerRepositoryImpl implements BannerRepository {
  final ApiService apiService;

  BannerRepositoryImpl(this.apiService);

  @override
  Future<List<Banner>> getHomePageBanners() async {
    final response = await apiService.getHomePageBanners();
    print(response.data);
    if (response.data?.isEnabled == true && response.data?.sliders != null) {
      return response.data!.sliders!.map((banner) => Banner(
            imageUrl: banner.imageUrl,
            sliderType: banner.sliderType,
            entityId: banner.entityId,
            id: banner.id,
          )).toList();
    }
    print('No banners found or not enabled'); 
    return [
      Banner(
        imageUrl: 'no image found',
        sliderType: 2,
        entityId: 0,
        id: 0,
      ),
    ];
  }
}