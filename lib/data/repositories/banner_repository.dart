import 'package:nop_station_api/domain/entities/banner.dart';


abstract class BannerRepository {
  Future<List<Banner>> getHomePageBanners();
}