import 'package:yaumi/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:yaumi/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:yaumi/ui/views/home/home_view.dart';
import 'package:yaumi/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:yaumi/ui/views/yaumi/yaumi_view.dart';
import 'package:yaumi/ui/views/absen/absen_view.dart';
import 'package:yaumi/ui/views/groups/groups_view.dart';
import 'package:yaumi/ui/views/settings/settings_view.dart';
import 'package:yaumi/ui/views/login/login_view.dart';
import 'package:yaumi/ui/dialogs/profile_settings/profile_settings_dialog.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: LoginView),
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: YaumiView),
    MaterialRoute(page: AbsenView),
    MaterialRoute(page: GroupsView),
    MaterialRoute(page: SettingsView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    // @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    StackedDialog(classType: ProfileSettingsDialog),
// @stacked-dialog
  ],
)
class App {}
