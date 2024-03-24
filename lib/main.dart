import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:path_provider/path_provider.dart';
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
  HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: await getApplicationDocumentsDirectory());
  await setupLocator();
  setupDialogUi();
  setupBottomSheetUi();
  initializeDateFormatting("id").then((_) => runApp(MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => SettingsBloc(),
          ),
          BlocProvider(
            create: (context) => YaumiBloc(),
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
