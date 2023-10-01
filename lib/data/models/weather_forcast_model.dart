// ignore_for_file: public_member_api_docs, sort_constructors_first
// To parse this JSON data, do
//
//     final weatherForcastModel = weatherForcastModelFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/foundation.dart';

WeatherForcastModel weatherForcastModelFromJson(String str) =>
    WeatherForcastModel.fromJson(json.decode(str));

String weatherForcastModelToJson(WeatherForcastModel data) =>
    json.encode(data.toJson());

class WeatherForcastModel {
  String? cod;
  int? message;
  int? cnt;
  List<WeatherData>? list;
  City? city;

  WeatherForcastModel({
    this.cod,
    this.message,
    this.cnt,
    this.list,
    this.city,
  });

  factory WeatherForcastModel.fromJson(Map<String, dynamic> json) =>
      WeatherForcastModel(
        cod: json["cod"],
        message: json["message"],
        cnt: json["cnt"],
        list: json["list"] == null
            ? []
            : List<WeatherData>.from(
                json["list"]!.map((x) => WeatherData.fromJson(x))),
        city: json["city"] == null ? null : City.fromJson(json["city"]),
      );

  Map<String, dynamic> toJson() => {
        "cod": cod,
        "message": message,
        "cnt": cnt,
        "list": list == null
            ? []
            : List<dynamic>.from(list!.map((x) => x.toJson())),
        "city": city?.toJson(),
      };

  @override
  bool operator ==(covariant WeatherForcastModel other) {
    if (identical(this, other)) return true;

    return other.cod == cod &&
        other.message == message &&
        other.cnt == cnt &&
        listEquals(other.list, list) &&
        other.city == city;
  }

  @override
  int get hashCode {
    return cod.hashCode ^
        message.hashCode ^
        cnt.hashCode ^
        list.hashCode ^
        city.hashCode;
  }
}

class City {
  int? id;
  String? name;
  Coord? coord;
  String? country;
  int? population;
  int? timezone;
  int? sunrise;
  int? sunset;

  City({
    this.id,
    this.name,
    this.coord,
    this.country,
    this.population,
    this.timezone,
    this.sunrise,
    this.sunset,
  });

  factory City.fromJson(Map<String, dynamic> json) => City(
        id: json["id"],
        name: json["name"],
        coord: json["coord"] == null ? null : Coord.fromJson(json["coord"]),
        country: json["country"],
        population: json["population"],
        timezone: json["timezone"],
        sunrise: json["sunrise"],
        sunset: json["sunset"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "coord": coord?.toJson(),
        "country": country,
        "population": population,
        "timezone": timezone,
        "sunrise": sunrise,
        "sunset": sunset,
      };

  @override
  bool operator ==(covariant City other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.coord == coord &&
        other.country == country &&
        other.population == population &&
        other.timezone == timezone &&
        other.sunrise == sunrise &&
        other.sunset == sunset;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        coord.hashCode ^
        country.hashCode ^
        population.hashCode ^
        timezone.hashCode ^
        sunrise.hashCode ^
        sunset.hashCode;
  }
}

class Coord {
  double? lat;
  double? lon;

  Coord({
    this.lat,
    this.lon,
  });

  factory Coord.fromJson(Map<String, dynamic> json) => Coord(
        lat: json["lat"]?.toDouble(),
        lon: json["lon"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "lat": lat,
        "lon": lon,
      };

  @override
  bool operator ==(covariant Coord other) {
    if (identical(this, other)) return true;

    return other.lat == lat && other.lon == lon;
  }

  @override
  int get hashCode => lat.hashCode ^ lon.hashCode;
}

class WeatherData {
  int? dt;
  Main? main;
  List<Weather>? weather;
  Clouds? clouds;
  Wind? wind;
  int? visibility;
  num? pop;
  Sys? sys;
  DateTime? dtTxt;

  WeatherData({
    this.dt,
    this.main,
    this.weather,
    this.clouds,
    this.wind,
    this.visibility,
    this.pop,
    this.sys,
    this.dtTxt,
  });

  factory WeatherData.fromJson(Map<String, dynamic> json) => WeatherData(
        dt: json["dt"],
        main: json["main"] == null ? null : Main.fromJson(json["main"]),
        weather: json["weather"] == null
            ? []
            : List<Weather>.from(
                json["weather"]!.map((x) => Weather.fromJson(x))),
        clouds: json["clouds"] == null ? null : Clouds.fromJson(json["clouds"]),
        wind: json["wind"] == null ? null : Wind.fromJson(json["wind"]),
        visibility: json["visibility"],
        pop: json["pop"],
        sys: json["sys"] == null ? null : Sys.fromJson(json["sys"]),
        dtTxt: json["dt_txt"] == null ? null : DateTime.parse(json["dt_txt"]),
      );

  Map<String, dynamic> toJson() => {
        "dt": dt,
        "main": main?.toJson(),
        "weather": weather == null
            ? []
            : List<dynamic>.from(weather!.map((x) => x.toJson())),
        "clouds": clouds?.toJson(),
        "wind": wind?.toJson(),
        "visibility": visibility,
        "pop": pop,
        "sys": sys?.toJson(),
        "dt_txt": dtTxt?.toIso8601String(),
      };

  @override
  bool operator ==(covariant WeatherData other) {
    if (identical(this, other)) return true;

    return other.dt == dt &&
        other.main == main &&
        listEquals(other.weather, weather) &&
        other.clouds == clouds &&
        other.wind == wind &&
        other.visibility == visibility &&
        other.pop == pop &&
        other.sys == sys &&
        other.dtTxt == dtTxt;
  }

  @override
  int get hashCode {
    return dt.hashCode ^
        main.hashCode ^
        weather.hashCode ^
        clouds.hashCode ^
        wind.hashCode ^
        visibility.hashCode ^
        pop.hashCode ^
        sys.hashCode ^
        dtTxt.hashCode;
  }
}

class Clouds {
  int? all;

  Clouds({
    this.all,
  });

  factory Clouds.fromJson(Map<String, dynamic> json) => Clouds(
        all: json["all"],
      );

  Map<String, dynamic> toJson() => {
        "all": all,
      };

  @override
  bool operator ==(covariant Clouds other) {
    if (identical(this, other)) return true;

    return other.all == all;
  }

  @override
  int get hashCode => all.hashCode;
}

class Main {
  double? temp;
  double? feelsLike;
  double? tempMin;
  double? tempMax;
  int? pressure;
  int? seaLevel;
  int? grndLevel;
  int? humidity;
  double? tempKf;

  Main({
    this.temp,
    this.feelsLike,
    this.tempMin,
    this.tempMax,
    this.pressure,
    this.seaLevel,
    this.grndLevel,
    this.humidity,
    this.tempKf,
  });

  factory Main.fromJson(Map<String, dynamic> json) => Main(
        temp: json["temp"]?.toDouble(),
        feelsLike: json["feels_like"]?.toDouble(),
        tempMin: json["temp_min"]?.toDouble(),
        tempMax: json["temp_max"]?.toDouble(),
        pressure: json["pressure"],
        seaLevel: json["sea_level"],
        grndLevel: json["grnd_level"],
        humidity: json["humidity"],
        tempKf: json["temp_kf"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "temp": temp,
        "feels_like": feelsLike,
        "temp_min": tempMin,
        "temp_max": tempMax,
        "pressure": pressure,
        "sea_level": seaLevel,
        "grnd_level": grndLevel,
        "humidity": humidity,
        "temp_kf": tempKf,
      };

  @override
  bool operator ==(covariant Main other) {
    if (identical(this, other)) return true;

    return other.temp == temp &&
        other.feelsLike == feelsLike &&
        other.tempMin == tempMin &&
        other.tempMax == tempMax &&
        other.pressure == pressure &&
        other.seaLevel == seaLevel &&
        other.grndLevel == grndLevel &&
        other.humidity == humidity &&
        other.tempKf == tempKf;
  }

  @override
  int get hashCode {
    return temp.hashCode ^
        feelsLike.hashCode ^
        tempMin.hashCode ^
        tempMax.hashCode ^
        pressure.hashCode ^
        seaLevel.hashCode ^
        grndLevel.hashCode ^
        humidity.hashCode ^
        tempKf.hashCode;
  }
}

class Sys {
  String? pod;

  Sys({
    this.pod,
  });

  factory Sys.fromJson(Map<String, dynamic> json) => Sys(
        pod: json["pod"],
      );

  Map<String, dynamic> toJson() => {
        "pod": pod,
      };

  @override
  bool operator ==(covariant Sys other) {
    if (identical(this, other)) return true;

    return other.pod == pod;
  }

  @override
  int get hashCode => pod.hashCode;
}

class Weather {
  int? id;
  String? main;
  String? description;
  String? icon;

  Weather({
    this.id,
    this.main,
    this.description,
    this.icon,
  });

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        id: json["id"],
        main: json["main"],
        description: json["description"],
        icon: json["icon"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "main": main,
        "description": description,
        "icon": icon,
      };

  @override
  bool operator ==(covariant Weather other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.main == main &&
        other.description == description &&
        other.icon == icon;
  }

  @override
  int get hashCode {
    return id.hashCode ^ main.hashCode ^ description.hashCode ^ icon.hashCode;
  }
}

class Wind {
  double? speed;
  int? deg;
  double? gust;

  Wind({
    this.speed,
    this.deg,
    this.gust,
  });

  factory Wind.fromJson(Map<String, dynamic> json) => Wind(
        speed: json["speed"]?.toDouble(),
        deg: json["deg"],
        gust: json["gust"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "speed": speed,
        "deg": deg,
        "gust": gust,
      };
}
