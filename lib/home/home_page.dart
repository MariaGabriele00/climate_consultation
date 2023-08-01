import 'package:climate_consultation/components/loading_widget.dart';
import 'package:climate_consultation/services/location.dart';
import 'package:climate_consultation/services/networking.dart';
import 'package:climate_consultation/utilies/constants.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isDataLoaded = false;
  double? latitude, longitude;
  GeolocatorPlatform geolocatorPlatform = GeolocatorPlatform.instance;
  LocationPermission? permission;

  @override
  void initState() {
    super.initState();
    getPermission();
  }

  void getPermission() async {
    permission = await geolocatorPlatform.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await geolocatorPlatform.requestPermission();
      if (permission != LocationPermission.denied) {
        if (permission == LocationPermission.deniedForever) {
          print('Permissão negada para sempre');
        } else {
          print('Permissão Garantida');
          getLocation();
        }
      } else {
        print('Foi negada a solicitação');
      }
    } else {}
    getLocation();
  }

  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    latitude = (location.latitude);
    longitude = (location.longitude);
    NetworkHelper networkHelper = NetworkHelper(
        "https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&APPID=$apiKey=metric");
    var weatherData = await networkHelper.getData();

    setState(() {
      isDataLoaded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!isDataLoaded) {
      return const LoadingWidget();
    } else {
      return const Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Row(
                children: [TextField()],
              ),
            ],
          ),
        ),
      );
    }
  }
}
//var id = decodeData['weather'][0]['id'];
  //    var temperature = decodeData['main']['temp'];
    //  var cityName = decodeData['name'];

      //print(id);
      //print(temperature);
      //print(cityName);