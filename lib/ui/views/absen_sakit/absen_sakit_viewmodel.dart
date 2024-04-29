// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:yaumi/app/app.locator.dart';
import 'package:yaumi/services/http_service.dart';

class AbsenSakitViewModel extends BaseViewModel {
  final _httpService = locator<HttpService>();
  final _dialogService = locator<DialogService>();
  final _navigationService = locator<NavigationService>();
  DateTimeRange? newDateRange;
  File? suratSakitImage;

  Future<void> selectDateRange(BuildContext context) async {
    while (true) {
      // Loop to allow re-selection if needed
      DateTimeRange? pickedRange = await showDateRangePicker(
        context: context,
        firstDate: DateTime.now(),
        lastDate: DateTime(DateTime.now().year + 1),
        initialDateRange: newDateRange,
      );

      if (pickedRange != null) {
        newDateRange = pickedRange; // Update with the newly picked range
        break; // Exit the loop as a valid range has been picked or edited
      } else {
        // Show dialog to enforce selection or allow cancellation
        bool shouldContinue = await showDialog<bool>(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text('Selection Required'),
                content: const Text('You must select a date range to proceed.'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(true),
                    child: const Text('OK'),
                  ),
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(false),
                    child: const Text('Cancel'),
                  ),
                ],
              ),
            ) ??
            false; // Default to false if null

        if (!shouldContinue) break; // Exit if the user chooses to cancel
      }
    }
    rebuildUi();
  }
}
