import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import 'package:clima/screens/location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:clima/services/weather.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double latitude;
  double longitude;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getLocationData();

//    getLocation();
  }

  void getLocationData() async {
//    Location location = Location();
//    await location.getLocation();
    WeatherModel weatherModel = WeatherModel();
    var weatherData = await weatherModel.getLocationWeather();
    //    latitude = location.latitude;
//    longitude = location.longitude;
//    print(location.latitude);
//    print(location.longitude);

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(
        locationWeather: weatherData,
      );
    }));

//    try {
//      Position position = await Geolocator()
//          .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
//      print(position);
//    } catch (e) {
//      print(e);
//    }
  }

//      print(data);
//      var longitude = jsonDecode(data)["coord"]["lon"];
//      print(longitude);
//      var weatherDescription = jsonDecode(data)["weather"][0]["description"];
//      print(weatherDescription);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(color: Colors.white, size: 100.0),
      ),
    );
  }
}
