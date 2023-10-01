class Endpoints {
  Endpoints._();

  // weather map api base url
  static const String baseUrl = "http://api.openweathermap.org/";

  //current day weather
  static const String currentDayWeather = "data/2.5/weather";

  //next 5 days weather forcast
  static const String next5DaysWeatherForcast = "data/2.5/forecast";

  //google timezone get api
  static const String getTimeZoneOfLocation =
      "https://maps.googleapis.com/maps/api/timezone/json";

  //image path
  static const String imagePath = "img/w/";
}
