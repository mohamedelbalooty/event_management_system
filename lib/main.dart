import 'package:ems/ems_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ems/src/di_injection.dart' as di;
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  await di.init();
  // await di.sl.allReady();
  // await di.sl.isReady();
  runApp(const EmsApp());
}
