import 'package:climate_consultation/components/details_widget.dart';
import 'package:climate_consultation/components/error_message.dart';
import 'package:climate_consultation/components/loading_widget.dart';
import 'package:climate_consultation/models/weather_model.dart';
import 'package:climate_consultation/services/weather.dart';
import 'package:climate_consultation/utilies/constants.dart';
import 'package:climate_consultation/utilies/several_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isDataLoaded = false;
  bool isErrorOccured = false;
  double? latitude, longitude;
  GeolocatorPlatform geolocatorPlatform = GeolocatorPlatform.instance;
  LocationPermission? permission;
  WeatherModel? weatherModel;
  int code = 0;
  Weather weather = Weather();
  dynamic weatherData;
  String? title, message;

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
          setState(() {
            isDataLoaded = true;
            isErrorOccured = true;
            title = 'Permissão negada para sempre';
            message =
                'Você precisa fornecer permissão para o aplicativo nas configurações do dispositivo';
          });
        } else {
          print('Permissão Garantida');
          updateUI();
        }
      } else {
        print('Foi negada a solicitação');
        updateUI(cityName: 'Maringa');
      }
    } else {}
    updateUI();
  }

  void updateUI({String? cityName}) async {
    weatherData = null;
    if (cityName == null || cityName == '') {
      if (!await geolocatorPlatform.isLocationServiceEnabled()) {
        setState(() {
          isErrorOccured = true;
          isDataLoaded = true;
          title = 'A localização está desativada!';
          message =
              'Precisa ativar o serviço de localização para que possa ver as condições meteorológicas da sua localização';
          return;
        });
      }
      weatherData = await weather.getLocationWeather();
    } else {
      weatherData = await weather.getCityWeather(cityName);
    }

    if (weatherData == null) {
      setState(() {
        title = 'Cidade não foi encontrada';
        message = 'Verifique se digitou o nome da cidade corretamente';
        isDataLoaded = true;
        isErrorOccured = true;
        return;
      });
    }

    code = weatherData['weather'][0]['id'];
    weatherModel = WeatherModel(
      location: weatherData['name'] + ', ' + weatherData['sys']['country'],
      description: weatherData['weather'][0]['description'],
      temperature: weatherData['main']['temp'],
      tempMin: weatherData['main']['temp_min'],
      tempMax: weatherData['main']['temp_max'],
      humidity: weatherData['main']['humidity'],
      icon:
          'assets/several-icons/${getIconPrefix(code)}${weatherIcons[code.toString()]!['icon']}.svg',
    );
    setState(() {
      isDataLoaded = true;
      isErrorOccured = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!isDataLoaded) {
      return const LoadingWidget();
    } else {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        //removendo erro de espaçamento (listras preta e amarelo)
        backgroundColor: overlayColor,
        body: SafeArea(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: TextField(
                        decoration: textFieldDecoraction,
                        onSubmitted: (String typedName) {
                          setState(() {
                            isDataLoaded = false;
                            updateUI(cityName: typedName);
                            // pesquisa city - ajustando para trazer
                          });
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            isDataLoaded = false;
                            getPermission();
                            //minha localização (trazendo)
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: const Color.fromARGB(31, 0, 0, 0),
                          elevation: 1,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const SizedBox(
                          height: 60,
                          child: Row(
                            children: [
                              Text('Onde estou', style: textFieldTextStyle),
                              SizedBox(width: 12),
                              Icon(Icons.gps_fixed, color: Colors.black),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              isErrorOccured
                  ? ErrorMessage(title: title!, message: message!)
                  : Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(width: 12),
                              Text(weatherModel!.location!,
                                  style: locationTextStyle),
                            ],
                          ),
                          const SizedBox(height: 25),
                          SvgPicture.asset(
                            weatherModel!.icon!,
                            height: 280,
                          ),
                          const SizedBox(height: 40),
                          Text('${weatherModel!.temperature!.round()}°',
                              style: tempTextStyle),
                          Text(weatherModel!.description!.toUpperCase(),
                              style: locationTextStyle),
                        ],
                      ),
                    ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  color: overlayColor,
                  child: SizedBox(
                    height: 90,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        DetailsWidget(
                          title: 'Temp Min',
                          value:
                              '${weatherModel != null ? weatherModel!.tempMin!.round() : 0}°',
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 15),
                          child: VerticalDivider(thickness: 1),
                        ),
                        DetailsWidget(
                          title: 'Temp Max',
                          value:
                              '${weatherModel != null ? weatherModel!.tempMax!.round() : 0}°',
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 15),
                          child: VerticalDivider(thickness: 1),
                        ),
                        DetailsWidget(
                          title: 'Humidade',
                          value:
                              '${weatherModel != null ? weatherModel!.humidity! : 0}%',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }
  }
}
