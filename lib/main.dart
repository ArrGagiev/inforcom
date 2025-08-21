import 'package:flutter/material.dart';
import 'package:inforcom/core/app/app.dart';
import 'package:yandex_maps_mapkit/init.dart' as init;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final mapkitApiKey = String.fromEnvironment('MAPKIT_API_KEY');
  await init.initMapkit(apiKey: mapkitApiKey);
  runApp(const App());
}
