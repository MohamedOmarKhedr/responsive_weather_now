class WeatherResponse {
  WeatherResponse({
      LocationResponse? location,
      CurrentResponse? current,
      ForecastResponse? forecast,}){
    _location = location;
    _current = current;
    _forecast = forecast;
}

  WeatherResponse.fromJson(dynamic json) {
    _location = json['location'] != null ? LocationResponse.fromJson(json['location']) : null;
    _current = json['current'] != null ? CurrentResponse.fromJson(json['current']) : null;
    _forecast = json['forecast'] != null ? ForecastResponse.fromJson(json['forecast']) : null;
  }
  LocationResponse? _location;
  CurrentResponse? _current;
  ForecastResponse? _forecast;

  LocationResponse? get location => _location;
  CurrentResponse? get current => _current;
  ForecastResponse? get forecast => _forecast;


}

class ForecastResponse {
  ForecastResponse({
      List<ForecastDayResponse>? forecastday,}){
    _forecastday = forecastday;
}

  ForecastResponse.fromJson(dynamic json) {
    if (json['forecastday'] != null) {
      _forecastday = [];
      json['forecastday'].forEach((v) {
        _forecastday?.add(ForecastDayResponse.fromJson(v));
      });
    }
  }
  List<ForecastDayResponse>? _forecastday;

  List<ForecastDayResponse>? get forecastday => _forecastday;


}


class ForecastDayResponse {
  ForecastDayResponse({
      String? date, 
      num? dateEpoch, 
      Day? day,
      }){
    _date = date;
    _dateEpoch = dateEpoch;
    _day = day;
}

  ForecastDayResponse.fromJson(dynamic json) {
    _date = json['date'];
    _dateEpoch = json['date_epoch'];
    _day = json['day'] != null ? Day.fromJson(json['day']) : null;
  }
  String? _date;
  num? _dateEpoch;
  Day? _day;

  String? get date => _date;
  num? get dateEpoch => _dateEpoch;
  Day? get day => _day;

}

class ConditionResponse {
  ConditionResponse({
      String? text, 
      String? icon, 
      num? code,}){
    _text = text;
    _icon = icon;
    _code = code;
}

  ConditionResponse.fromJson(dynamic json) {
    _text = json['text'];
    _icon = json['icon'];
    _code = json['code'];
  }
  String? _text;
  String? _icon;
  num? _code;

  String? get text => _text;
  String? get icon => _icon;
  num? get code => _code;


}

class Day {
  Day({
      num? maxtempC, 
      num? maxtempF, 
      num? mintempC, 
      num? mintempF, 
      num? avgtempC, 
      num? avgtempF, 
      num? maxwindMph, 
      num? maxwindKph, 
      num? totalprecipMm, 
      num? totalprecipIn, 
      num? totalsnowCm, 
      num? avgvisKm, 
      num? avgvisMiles, 
      num? avghumidity, 
      num? dailyWillItRain, 
      num? dailyChanceOfRain, 
      num? dailyWillItSnow, 
      num? dailyChanceOfSnow, 
      ConditionResponse? condition,
      num? uv,}){
    _maxtempC = maxtempC;
    _maxtempF = maxtempF;
    _mintempC = mintempC;
    _mintempF = mintempF;
    _avgtempC = avgtempC;
    _avgtempF = avgtempF;
    _maxwindMph = maxwindMph;
    _maxwindKph = maxwindKph;
    _totalprecipMm = totalprecipMm;
    _totalprecipIn = totalprecipIn;
    _totalsnowCm = totalsnowCm;
    _avgvisKm = avgvisKm;
    _avgvisMiles = avgvisMiles;
    _avghumidity = avghumidity;
    _dailyWillItRain = dailyWillItRain;
    _dailyChanceOfRain = dailyChanceOfRain;
    _dailyWillItSnow = dailyWillItSnow;
    _dailyChanceOfSnow = dailyChanceOfSnow;
    _condition = condition;
    _uv = uv;
}

  Day.fromJson(dynamic json) {
    _maxtempC = json['maxtemp_c'];
    _maxtempF = json['maxtemp_f'];
    _mintempC = json['mintemp_c'];
    _mintempF = json['mintemp_f'];
    _avgtempC = json['avgtemp_c'];
    _avgtempF = json['avgtemp_f'];
    _maxwindMph = json['maxwind_mph'];
    _maxwindKph = json['maxwind_kph'];
    _totalprecipMm = json['totalprecip_mm'];
    _totalprecipIn = json['totalprecip_in'];
    _totalsnowCm = json['totalsnow_cm'];
    _avgvisKm = json['avgvis_km'];
    _avgvisMiles = json['avgvis_miles'];
    _avghumidity = json['avghumidity'];
    _dailyWillItRain = json['daily_will_it_rain'];
    _dailyChanceOfRain = json['daily_chance_of_rain'];
    _dailyWillItSnow = json['daily_will_it_snow'];
    _dailyChanceOfSnow = json['daily_chance_of_snow'];
    _condition = json['condition'] != null ? ConditionResponse.fromJson(json['condition']) : null;
    _uv = json['uv'];
  }
  num? _maxtempC;
  num? _maxtempF;
  num? _mintempC;
  num? _mintempF;
  num? _avgtempC;
  num? _avgtempF;
  num? _maxwindMph;
  num? _maxwindKph;
  num? _totalprecipMm;
  num? _totalprecipIn;
  num? _totalsnowCm;
  num? _avgvisKm;
  num? _avgvisMiles;
  num? _avghumidity;
  num? _dailyWillItRain;
  num? _dailyChanceOfRain;
  num? _dailyWillItSnow;
  num? _dailyChanceOfSnow;
  ConditionResponse? _condition;
  num? _uv;

  num? get maxtempC => _maxtempC;
  num? get maxtempF => _maxtempF;
  num? get mintempC => _mintempC;
  num? get mintempF => _mintempF;
  num? get avgtempC => _avgtempC;
  num? get avgtempF => _avgtempF;
  num? get maxwindMph => _maxwindMph;
  num? get maxwindKph => _maxwindKph;
  num? get totalprecipMm => _totalprecipMm;
  num? get totalprecipIn => _totalprecipIn;
  num? get totalsnowCm => _totalsnowCm;
  num? get avgvisKm => _avgvisKm;
  num? get avgvisMiles => _avgvisMiles;
  num? get avghumidity => _avghumidity;
  num? get dailyWillItRain => _dailyWillItRain;
  num? get dailyChanceOfRain => _dailyChanceOfRain;
  num? get dailyWillItSnow => _dailyWillItSnow;
  num? get dailyChanceOfSnow => _dailyChanceOfSnow;
  ConditionResponse? get condition => _condition;
  num? get uv => _uv;


}

class CurrentResponse {
  CurrentResponse({
      num? lastUpdatedEpoch, 
      String? lastUpdated, 
      num? tempC, 
      num? tempF, 
      num? isDay, 
      ConditionResponse? condition,
      num? windMph, 
      num? windKph, 
      num? windDegree, 
      String? windDir, 
      num? pressureMb, 
      num? pressureIn, 
      num? precipMm, 
      num? precipIn, 
      num? humidity, 
      num? cloud, 
      num? feelslikeC, 
      num? feelslikeF, 
      num? visKm, 
      num? visMiles, 
      num? uv, 
      num? gustMph, 
      num? gustKph,}){
    _lastUpdatedEpoch = lastUpdatedEpoch;
    _lastUpdated = lastUpdated;
    _tempC = tempC;
    _tempF = tempF;
    _isDay = isDay;
    _condition = condition;
    _windMph = windMph;
    _windKph = windKph;
    _windDegree = windDegree;
    _windDir = windDir;
    _pressureMb = pressureMb;
    _pressureIn = pressureIn;
    _precipMm = precipMm;
    _precipIn = precipIn;
    _humidity = humidity;
    _cloud = cloud;
    _feelslikeC = feelslikeC;
    _feelslikeF = feelslikeF;
    _visKm = visKm;
    _visMiles = visMiles;
    _uv = uv;
    _gustMph = gustMph;
    _gustKph = gustKph;
}

  CurrentResponse.fromJson(dynamic json) {
    _lastUpdatedEpoch = json['last_updated_epoch'];
    _lastUpdated = json['last_updated'];
    _tempC = json['temp_c'];
    _tempF = json['temp_f'];
    _isDay = json['is_day'];
    _condition = json['condition'] != null ? ConditionResponse.fromJson(json['condition']) : null;
    _windMph = json['wind_mph'];
    _windKph = json['wind_kph'];
    _windDegree = json['wind_degree'];
    _windDir = json['wind_dir'];
    _pressureMb = json['pressure_mb'];
    _pressureIn = json['pressure_in'];
    _precipMm = json['precip_mm'];
    _precipIn = json['precip_in'];
    _humidity = json['humidity'];
    _cloud = json['cloud'];
    _feelslikeC = json['feelslike_c'];
    _feelslikeF = json['feelslike_f'];
    _visKm = json['vis_km'];
    _visMiles = json['vis_miles'];
    _uv = json['uv'];
    _gustMph = json['gust_mph'];
    _gustKph = json['gust_kph'];
  }
  num? _lastUpdatedEpoch;
  String? _lastUpdated;
  num? _tempC;
  num? _tempF;
  num? _isDay;
  ConditionResponse? _condition;
  num? _windMph;
  num? _windKph;
  num? _windDegree;
  String? _windDir;
  num? _pressureMb;
  num? _pressureIn;
  num? _precipMm;
  num? _precipIn;
  num? _humidity;
  num? _cloud;
  num? _feelslikeC;
  num? _feelslikeF;
  num? _visKm;
  num? _visMiles;
  num? _uv;
  num? _gustMph;
  num? _gustKph;

  num? get lastUpdatedEpoch => _lastUpdatedEpoch;
  String? get lastUpdated => _lastUpdated;
  num? get tempC => _tempC;
  num? get tempF => _tempF;
  num? get isDay => _isDay;
  ConditionResponse? get condition => _condition;
  num? get windMph => _windMph;
  num? get windKph => _windKph;
  num? get windDegree => _windDegree;
  String? get windDir => _windDir;
  num? get pressureMb => _pressureMb;
  num? get pressureIn => _pressureIn;
  num? get precipMm => _precipMm;
  num? get precipIn => _precipIn;
  num? get humidity => _humidity;
  num? get cloud => _cloud;
  num? get feelslikeC => _feelslikeC;
  num? get feelslikeF => _feelslikeF;
  num? get visKm => _visKm;
  num? get visMiles => _visMiles;
  num? get uv => _uv;
  num? get gustMph => _gustMph;
  num? get gustKph => _gustKph;



}


class LocationResponse {
  LocationResponse({
      String? name, 
      String? region, 
      String? country, 
      num? lat, 
      num? lon, 
      String? tzId, 
      num? localtimeEpoch, 
      String? localtime,}){
    _name = name;
    _region = region;
    _country = country;
    _lat = lat;
    _lon = lon;
    _tzId = tzId;
    _localtimeEpoch = localtimeEpoch;
    _localtime = localtime;
}

  LocationResponse.fromJson(dynamic json) {
    _name = json['name'];
    _region = json['region'];
    _country = json['country'];
    _lat = json['lat'];
    _lon = json['lon'];
    _tzId = json['tz_id'];
    _localtimeEpoch = json['localtime_epoch'];
    _localtime = json['localtime'];
  }
  String? _name;
  String? _region;
  String? _country;
  num? _lat;
  num? _lon;
  String? _tzId;
  num? _localtimeEpoch;
  String? _localtime;

  String? get name => _name;
  String? get region => _region;
  String? get country => _country;
  num? get lat => _lat;
  num? get lon => _lon;
  String? get tzId => _tzId;
  num? get localtimeEpoch => _localtimeEpoch;
  String? get localtime => _localtime;


}