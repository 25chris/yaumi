import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:yaumi/app/app.bottomsheets.dart';
import 'package:yaumi/app/app.dialogs.dart';
import 'package:yaumi/app/app.locator.dart';
import 'package:yaumi/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:yaumi/blocs/bloc/settings_bloc.dart';
import 'package:yaumi/blocs/bloc/yaumi_bloc.dart';
import 'package:yaumi/models/yaumi.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  setupDialogUi();
  setupBottomSheetUi();
  initializeDateFormatting("id").then((_) => runApp(MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => SettingsBloc(),
          ),
          BlocProvider(
            create: (context) => YaumiBloc()
              ..add(AddYaumi(
                  yaumi: Yaumi(
                      date: DateTime(DateTime.now().year, DateTime.now().month,
                          DateTime.now().day),
                      shubuh: true,
                      dhuhur: true,
                      ashar: false,
                      maghrib: true,
                      isya: false,
                      tahajud: 11,
                      dhuha: 4,
                      qshubuh: true,
                      qdhuhur: true,
                      bdhuhur: false,
                      bmaghrib: true,
                      bisya: false,
                      poin: 80))),
          ),
        ],
        child: const MainApp(),
      )));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Routes.startupView,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      navigatorKey: StackedService.navigatorKey,
      navigatorObservers: [
        StackedService.routeObserver,
      ],
    );
  }
}
