import 'package:dio/dio.dart';
import 'package:nop_station_api/data/repositories/banner_repository.dart';
import 'package:nop_station_api/data/repositories/banner_repository_impl.dart';
import 'package:nop_station_api/data/services/api_service.dart';
import 'package:nop_station_api/data/services/endpoints.dart';
import 'package:nop_station_api/domain/entities/banner.dart';
import 'package:nop_station_api/domain/use_cases/get_home_page.dart';
import 'package:riverpod/riverpod.dart';


final dioProvider = Provider<Dio>((ref) {
  final dio = Dio(BaseOptions(
    baseUrl: Endpoints.base,
    connectTimeout: Duration(seconds: 10),
    receiveTimeout: Duration(seconds: 10),
  ));
  return dio;
});

final apiServiceProvider = Provider<ApiService>((ref) {
  final dio = ref.watch(dioProvider);
  return ApiService(dio);
});

final bannerRepositoryProvider = Provider<BannerRepository>((ref) {
  final apiService = ref.watch(apiServiceProvider);
  return BannerRepositoryImpl(apiService);
});

final getBannersProvider = Provider<GetBanners>((ref) {
  final repository = ref.watch(bannerRepositoryProvider);
  return GetBanners(repository);
});

final bannerProvider = FutureProvider<List<Banner>>((ref) async {
  final getBanners = ref.watch(getBannersProvider);
  return await getBanners();
});