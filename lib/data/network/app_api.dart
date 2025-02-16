import 'package:advanced_project/app/constant.dart';
import 'package:advanced_project/data/responses/reponses.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'app_api.g.dart';

@RestApi(baseUrl: AppConstants.baseUrl)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;

  @POST("/customers/login")
  Future<AuthenticationResponse> login();
}
