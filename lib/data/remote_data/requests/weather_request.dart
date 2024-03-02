import 'package:dio/dio.dart';
import 'package:weather_app/core/constants_methods.dart';

import '../../../core/constants.dart';
import '../data_providers/my_dio.dart';
import '../responses/weather_response.dart';

class WeatherRequest {
  Future weatherRequest({required String location}) async {
    try{
      Response response = await MyDio.getData(
          endPoint: '', query: {'key': apiKey, 'q': location, 'days': 1 });
      printTest('weatherRequest status code ${response.statusCode}');
      printResponse('weatherRequest: ${response.data}');
      return WeatherResponse.fromJson(response.data);
    }
    catch(e){
      printError("weatherRequest error :${e.toString()}");
    }
  }
}
