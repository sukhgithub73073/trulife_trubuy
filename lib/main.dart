import 'package:flutter/material.dart';
import 'package:trubuy/data/blocs/theme_bloc/theme_bloc.dart';
import 'package:trubuy/data/blocs/theme_bloc/theme_bloc.dart';
import 'package:trubuy/route/route_constants.dart';
import 'package:trubuy/route/router.dart' as router;
import 'package:trubuy/theme/app_theme.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trubuy/route/route_constants.dart';
import 'package:trubuy/route/router.dart' as router;
import 'package:trubuy/theme/app_theme.dart';
import 'package:trubuy/util/app_bloc_providers.dart';
import 'package:trubuy/util/app_injector.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await dotenv.load(fileName: ".env");

  await ScreenUtil.ensureScreenSize();
  await AppInjector.init(
      appRunner: () =>
          runApp(SafeArea(bottom: true, top: false, child: MyApp())));
}

class MyApp extends StatelessWidget {
  final String fontFamily = "Montserrat";

  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return AppBlocProvider(
      child: BlocConsumer<ThemeBloc, ThemeState>(
        listener: (context, state) {
        },
        builder: (context, state) {
          return MaterialApp(
            title: "TruBuy",
            debugShowCheckedModeBanner: false,
            theme: state is ThemeDark ? AppTheme.darkTheme(context) :  AppTheme.lightTheme(context),
            themeMode: state is ThemeDark ? ThemeMode.dark :ThemeMode.light,
            onGenerateRoute: router.generateRoute,
            initialRoute: onbordingScreenRoute,
          );
        },
      ),
    );
  }
}
