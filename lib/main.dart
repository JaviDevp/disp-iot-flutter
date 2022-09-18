import 'package:dispositivos_iot/domain/services/record.dart';
import 'package:dispositivos_iot/domain/services/sensor_value.dart';
import 'package:dispositivos_iot/ui/screens/foco_screen.dart';
import 'package:dispositivos_iot/ui/screens/record_audio_screen.dart';
import 'package:dispositivos_iot/ui/screens/screens.dart';
import 'package:dispositivos_iot/ui/screens/tv_remote_screen.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(AppState());

class AppState extends StatefulWidget {
  @override
  _AppStateState createState() => _AppStateState();
}

class _AppStateState extends State<AppState> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SensorService()),
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Smart Home',
      initialRoute: 'home',
      routes: {
        'home': (_) => HomeScreen(),
        'focoScreen': (_) => FocoScreen(),
        'tvScreen': (_) => TVRemoteScreen(),
        'dialogflow': (_) => Chat(),
        'record_audio': (_) => SpeechScreen(),
      },
    );
  }
}
