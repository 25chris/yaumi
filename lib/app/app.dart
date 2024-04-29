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
import 'package:yaumi/ui/dialogs/fardhu/fardhu_dialog.dart';
import 'package:yaumi/ui/dialogs/tahajud/tahajud_dialog.dart';
import 'package:yaumi/ui/dialogs/dhuha/dhuha_dialog.dart';
import 'package:yaumi/ui/dialogs/rawatib/rawatib_dialog.dart';
import 'package:yaumi/ui/dialogs/tilawah/tilawah_dialog.dart';
import 'package:yaumi/ui/dialogs/shaum/shaum_dialog.dart';
import 'package:yaumi/ui/dialogs/dzikir/dzikir_dialog.dart';
import 'package:yaumi/ui/dialogs/taklim/taklim_dialog.dart';
import 'package:yaumi/services/http_service.dart';
import 'package:yaumi/ui/views/strapi_login/strapi_login_view.dart';
import 'package:yaumi/services/snacked_service.dart';
import 'package:yaumi/ui/views/yaumi_log/yaumi_log_view.dart';
import 'package:yaumi/ui/views/absen_ijin_cuti/absen_ijin_cuti_view.dart';
import 'package:yaumi/ui/views/absen_masuk/absen_masuk_view.dart';
import 'package:yaumi/ui/views/absen_pulang/absen_pulang_view.dart';
import 'package:yaumi/ui/views/absen_detail/absen_detail_view.dart';
import 'package:yaumi/ui/dialogs/prompter/prompter_dialog.dart';
import 'package:yaumi/ui/dialogs/prompt_pembatalan/prompt_pembatalan_dialog.dart';
import 'package:yaumi/ui/views/absen_sakit/absen_sakit_view.dart';
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
    MaterialRoute(page: StrapiLoginView),
    MaterialRoute(page: YaumiLogView),
    MaterialRoute(page: AbsenIjinCutiView),
    MaterialRoute(page: AbsenMasukView),
    MaterialRoute(page: AbsenPulangView),
    MaterialRoute(page: AbsenDetailView),
    MaterialRoute(page: AbsenSakitView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: HttpService),
    LazySingleton(classType: SnackedService),
// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    StackedDialog(classType: ProfileSettingsDialog),
    StackedDialog(classType: FardhuDialog),
    StackedDialog(classType: TahajudDialog),
    StackedDialog(classType: DhuhaDialog),
    StackedDialog(classType: RawatibDialog),
    StackedDialog(classType: TilawahDialog),
    StackedDialog(classType: ShaumDialog),
    StackedDialog(classType: DzikirDialog),
    StackedDialog(classType: TaklimDialog),
    StackedDialog(classType: PrompterDialog),
    StackedDialog(classType: PromptPembatalanDialog),
// @stacked-dialog
  ],
)
class App {}
