import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:yaumi/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:yaumi/ui/dialogs/profile_settings/profile_settings_dialog.form.dart';
import 'package:yaumi/widgets/input_field.dart';
import 'profile_settings_dialog_model.dart';

const double _graphicSize = 60;

@FormView(fields: [FormTextField(name: 'name'), FormTextField(name: 'picture')])
class ProfileSettingsDialog extends StackedView<ProfileSettingsDialogModel>
    with $ProfileSettingsDialog {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  @override
  final TextEditingController nameController = TextEditingController();
  @override
  final TextEditingController pictureController = TextEditingController();
  final TextInputFormatter nameInputFormatter =
      FilteringTextInputFormatter.allow(RegExp("[a-zA-Z ]"));

  ProfileSettingsDialog({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ProfileSettingsDialogModel viewModel,
    Widget? child,
  ) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(),
                ElevatedButton(onPressed: () {}, child: Text("Upload Photo"))
              ],
            ),
            verticalSpaceSmall,
            InputField(
                controller: nameController,
                hintText: request.data!.displayName!,
                inputFormatters: [nameInputFormatter],
                textInputType: TextInputType.name,
                labelText: 'Nama'),
            verticalSpaceSmall,
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () => completer(DialogResponse(confirmed: true)),
                      child: Container(
                        height: 50,
                        width: double.infinity,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Text(
                          'OK',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () => completer(DialogResponse(confirmed: true)),
                      child: Container(
                        height: 50,
                        width: double.infinity,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Text(
                          'Cancel',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  ProfileSettingsDialogModel viewModelBuilder(BuildContext context) =>
      ProfileSettingsDialogModel();

  @override
  void onViewModelReady(ProfileSettingsDialogModel viewModel) {
    syncFormWithViewModel(viewModel);
  }
}

class ProfileSettingsValidators {
  static String? validateProfileSettingsText(String? value) {
    if (value == null) {
      return null;
    }

    if (value.contains(RegExp(r'[0-9]'))) {
      return 'No numbers allowed';
    }
    return null;
  }
}
