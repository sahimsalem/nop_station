import 'package:dio/dio.dart' hide Headers;
import 'package:nop_station_api/data/services/endpoints.dart';
import 'package:nop_station_api/data/services/models/banner_model.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: Endpoints.base)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET("/slider/homepageslider")
  @Headers(<String, dynamic>{
    "Content-Type": "application/json",
    "DeviceId": Endpoints.deviceId, 
  })

  Future<BannerResponse> getHomePageBanners();

}