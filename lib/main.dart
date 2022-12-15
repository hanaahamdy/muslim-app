import 'package:al_quraan_alkareem/core/theme/app_theme.dart';
import 'package:al_quraan_alkareem/features/home_layout/presentation/home_page.dart';
import 'package:al_quraan_alkareem/features/quraan/data/quraan_bloc/quraan_bloc.dart';
import 'features/azkar/data/data_base/azkar_bloc/azkar_bloc.dart';
import 'features/quraan/data/Api/Api.dart';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/quraan/presentation/quraan.dart';
import 'features/radio/data/radio_bloc/radio_bloc.dart';

void main() {
  Api.init();
  Api.radioInit();
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AzkarBloc>(
          create: (context) => AzkarBloc()..getAzkarData(),
        ),
        BlocProvider<RadioBloc>(
          create: (context) => RadioBloc()..getRadios()
        ),
        BlocProvider<QuraanBloc>(create: (context) => QuraanBloc()..getQuranData())
      ],
      child: MaterialApp(
          scrollBehavior: AppScrollBehavior(),
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: AppTheme(),
          home:HonePage()),
    );
  }
}

class AppScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
