// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedDialogGenerator
// **************************************************************************

import 'package:stacked_services/stacked_services.dart';

import 'app.locator.dart';
import '../ui/dialogs/dhuha/dhuha_dialog.dart';
import '../ui/dialogs/dzikir/dzikir_dialog.dart';
import '../ui/dialogs/fardhu/fardhu_dialog.dart';
import '../ui/dialogs/info_alert/info_alert_dialog.dart';
import '../ui/dialogs/profile_settings/profile_settings_dialog.dart';
import '../ui/dialogs/prompter/prompter_dialog.dart';
import '../ui/dialogs/rawatib/rawatib_dialog.dart';
import '../ui/dialogs/shaum/shaum_dialog.dart';
import '../ui/dialogs/tahajud/tahajud_dialog.dart';
import '../ui/dialogs/taklim/taklim_dialog.dart';
import '../ui/dialogs/tilawah/tilawah_dialog.dart';

enum DialogType {
  infoAlert,
  profileSettings,
  fardhu,
  tahajud,
  dhuha,
  rawatib,
  tilawah,
  shaum,
  dzikir,
  taklim,
  prompter,
}

void setupDialogUi() {
  final dialogService = locator<DialogService>();

  final Map<DialogType, DialogBuilder> builders = {
    DialogType.infoAlert: (context, request, completer) =>
        InfoAlertDialog(request: request, completer: completer),
    DialogType.profileSettings: (context, request, completer) =>
        ProfileSettingsDialog(request: request, completer: completer),
    DialogType.fardhu: (context, request, completer) =>
        FardhuDialog(request: request, completer: completer),
    DialogType.tahajud: (context, request, completer) =>
        TahajudDialog(request: request, completer: completer),
    DialogType.dhuha: (context, request, completer) =>
        DhuhaDialog(request: request, completer: completer),
    DialogType.rawatib: (context, request, completer) =>
        RawatibDialog(request: request, completer: completer),
    DialogType.tilawah: (context, request, completer) =>
        TilawahDialog(request: request, completer: completer),
    DialogType.shaum: (context, request, completer) =>
        ShaumDialog(request: request, completer: completer),
    DialogType.dzikir: (context, request, completer) =>
        DzikirDialog(request: request, completer: completer),
    DialogType.taklim: (context, request, completer) =>
        TaklimDialog(request: request, completer: completer),
    DialogType.prompter: (context, request, completer) =>
        PrompterDialog(request: request, completer: completer),
  };

  dialogService.registerCustomDialogBuilders(builders);
}
