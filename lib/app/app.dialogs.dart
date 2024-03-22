// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedDialogGenerator
// **************************************************************************

import 'package:stacked_services/stacked_services.dart';

import 'app.locator.dart';
import '../ui/dialogs/info_alert/info_alert_dialog.dart';
import '../ui/dialogs/profile_settings/profile_settings_dialog.dart';

enum DialogType {
  infoAlert,
  profileSettings,
}

void setupDialogUi() {
  final dialogService = locator<DialogService>();

  final Map<DialogType, DialogBuilder> builders = {
    DialogType.infoAlert: (context, request, completer) =>
        InfoAlertDialog(request: request, completer: completer),
    DialogType.profileSettings: (context, request, completer) =>
        ProfileSettingsDialog(request: request, completer: completer),
  };

  dialogService.registerCustomDialogBuilders(builders);
}
