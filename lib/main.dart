import 'package:flutter/material.dart';
import 'package:inforcom/core/app/app.dart';
import 'package:yandex_maps_mapkit/init.dart' as init;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await init.initMapkit(apiKey: 'ecde1cf6-a396-4263-ad65-4a7b3914b363');
  runApp(const App());
}
