import 'package:nop_station_api/data/repositories/banner_repository.dart';
import 'package:nop_station_api/domain/entities/banner.dart';


class GetBanners {
  final BannerRepository repository;

  GetBanners(this.repository);

  Future<List<Banner>> call() async {
    return await repository.getHomePageBanners();
  }
}