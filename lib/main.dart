import 'package:flutter/material.dart';
import 'package:inforcom/core/app/app.dart';
import 'package:yandex_maps_mapkit/init.dart' as init;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await init.initMapkit(apiKey: '355b4311-fda5-4a1c-b7a1-f5a84770ccae');
  runApp(const App());
}
