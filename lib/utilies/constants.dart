import 'package:flutter/material.dart';

const apiKey = 'c93ec169bc7918636f32dc40e73d73d8';
const openWeatherMapURL = "https://api.openweathermap.org/data/2.5/weather";

const lightColor = Color.fromARGB(255, 12, 19, 59);
//cor clara
const midLightColor = Colors.black;
//cor de luz média
const overlayColor = Color.fromARGB(255, 164, 220, 228);
//cor de sobreposição
const darkColor = Color.fromARGB(255, 0, 0, 0);
//cor escura
const textFieldTextStyle = TextStyle(
  fontSize: 20,
  color: midLightColor,
);
const locationTextStyle = TextStyle(
  fontSize: 26,
  color: midLightColor,
);
const tempTextStyle = TextStyle(
  fontSize: 89,
);
const detailsTextStyle = TextStyle(
  fontSize: 25,
  color: midLightColor,
  fontWeight: FontWeight.w900,
);
const detailsTitleTextStyle = TextStyle(
  fontSize: 15,
  color: darkColor,
);

const textFieldDecoraction = InputDecoration(
  //kTextFieldDecoraction - Decoração do campo de texto
  fillColor: overlayColor,
  //fillColor - Cor de preenchimento
  filled: true,
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10)),
    borderSide: BorderSide.none,
  ),
  hintText: 'Digite sua cidade',
  hintStyle: textFieldTextStyle,
  prefixIcon: Icon(
    Icons.search_sharp,
    color: Color.fromARGB(255, 0, 0, 0),
  ),
);
