// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const bool _autoTextFieldValidation = true;

const String NameValueKey = 'name';
const String PictureValueKey = 'picture';

final Map<String, TextEditingController>
    _ProfileSettingsDialogTextEditingControllers = {};

final Map<String, FocusNode> _ProfileSettingsDialogFocusNodes = {};

final Map<String, String? Function(String?)?>
    _ProfileSettingsDialogTextValidations = {
  NameValueKey: null,
  PictureValueKey: null,
};

mixin $ProfileSettingsDialog {
  TextEditingController get nameController =>
      _getFormTextEditingController(NameValueKey);
  TextEditingController get pictureController =>
      _getFormTextEditingController(PictureValueKey);

  FocusNode get nameFocusNode => _getFormFocusNode(NameValueKey);
  FocusNode get pictureFocusNode => _getFormFocusNode(PictureValueKey);

  TextEditingController _getFormTextEditingController(
    String key, {
    String? initialValue,
  }) {
    if (_ProfileSettingsDialogTextEditingControllers.containsKey(key)) {
      return _ProfileSettingsDialogTextEditingControllers[key]!;
    }

    _ProfileSettingsDialogTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _ProfileSettingsDialogTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_ProfileSettingsDialogFocusNodes.containsKey(key)) {
      return _ProfileSettingsDialogFocusNodes[key]!;
    }
    _ProfileSettingsDialogFocusNodes[key] = FocusNode();
    return _ProfileSettingsDialogFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormStateHelper model) {
    nameController.addListener(() => _updateFormData(model));
    pictureController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  @Deprecated(
    'Use syncFormWithViewModel instead.'
    'This feature was deprecated after 3.1.0.',
  )
  void listenToFormUpdated(FormViewModel model) {
    nameController.addListener(() => _updateFormData(model));
    pictureController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormStateHelper model, {bool forceValidate = false}) {
    model.setData(
      model.formValueMap
        ..addAll({
          NameValueKey: nameController.text,
          PictureValueKey: pictureController.text,
        }),
    );

    if (_autoTextFieldValidation || forceValidate) {
      updateValidationData(model);
    }
  }

  bool validateFormFields(FormViewModel model) {
    _updateFormData(model, forceValidate: true);
    return model.isFormValid;
  }

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    for (var controller
        in _ProfileSettingsDialogTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _ProfileSettingsDialogFocusNodes.values) {
      focusNode.dispose();
    }

    _ProfileSettingsDialogTextEditingControllers.clear();
    _ProfileSettingsDialogFocusNodes.clear();
  }
}

extension ValueProperties on FormStateHelper {
  bool get hasAnyValidationMessage => this
      .fieldsValidationMessages
      .values
      .any((validation) => validation != null);

  bool get isFormValid {
    if (!_autoTextFieldValidation) this.validateForm();

    return !hasAnyValidationMessage;
  }

  String? get nameValue => this.formValueMap[NameValueKey] as String?;
  String? get pictureValue => this.formValueMap[PictureValueKey] as String?;

  set nameValue(String? value) {
    this.setData(
      this.formValueMap..addAll({NameValueKey: value}),
    );

    if (_ProfileSettingsDialogTextEditingControllers.containsKey(
        NameValueKey)) {
      _ProfileSettingsDialogTextEditingControllers[NameValueKey]?.text =
          value ?? '';
    }
  }

  set pictureValue(String? value) {
    this.setData(
      this.formValueMap..addAll({PictureValueKey: value}),
    );

    if (_ProfileSettingsDialogTextEditingControllers.containsKey(
        PictureValueKey)) {
      _ProfileSettingsDialogTextEditingControllers[PictureValueKey]?.text =
          value ?? '';
    }
  }

  bool get hasName =>
      this.formValueMap.containsKey(NameValueKey) &&
      (nameValue?.isNotEmpty ?? false);
  bool get hasPicture =>
      this.formValueMap.containsKey(PictureValueKey) &&
      (pictureValue?.isNotEmpty ?? false);

  bool get hasNameValidationMessage =>
      this.fieldsValidationMessages[NameValueKey]?.isNotEmpty ?? false;
  bool get hasPictureValidationMessage =>
      this.fieldsValidationMessages[PictureValueKey]?.isNotEmpty ?? false;

  String? get nameValidationMessage =>
      this.fieldsValidationMessages[NameValueKey];
  String? get pictureValidationMessage =>
      this.fieldsValidationMessages[PictureValueKey];
}

extension Methods on FormStateHelper {
  setNameValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[NameValueKey] = validationMessage;
  setPictureValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[PictureValueKey] = validationMessage;

  /// Clears text input fields on the Form
  void clearForm() {
    nameValue = '';
    pictureValue = '';
  }

  /// Validates text input fields on the Form
  void validateForm() {
    this.setValidationMessages({
      NameValueKey: getValidationMessage(NameValueKey),
      PictureValueKey: getValidationMessage(PictureValueKey),
    });
  }
}

/// Returns the validation message for the given key
String? getValidationMessage(String key) {
  final validatorForKey = _ProfileSettingsDialogTextValidations[key];
  if (validatorForKey == null) return null;

  String? validationMessageForKey = validatorForKey(
    _ProfileSettingsDialogTextEditingControllers[key]!.text,
  );

  return validationMessageForKey;
}

/// Updates the fieldsValidationMessages on the FormViewModel
void updateValidationData(FormStateHelper model) =>
    model.setValidationMessages({
      NameValueKey: getValidationMessage(NameValueKey),
      PictureValueKey: getValidationMessage(PictureValueKey),
    });
