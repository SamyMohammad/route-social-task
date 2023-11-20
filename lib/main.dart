import 'package:flutter/material.dart';

import 'app.dart';
import 'core/services/injection/injection.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/utils/bloc_observer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  Bloc.observer = MyBlocObserver();
  runApp(DevicePreview(
    enabled: !kReleaseMode,
    builder: (BuildContext context) {
      return const MyApp();
    },
  ));
}
