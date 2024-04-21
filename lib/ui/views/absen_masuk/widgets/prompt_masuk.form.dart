// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const bool _autoTextFieldValidation = true;

const String KeterlambatanValueKey = 'keterlambatan';

final Map<String, TextEditingController> _PromptMasukTextEditingControllers =
    {};

final Map<String, FocusNode> _PromptMasukFocusNodes = {};

final Map<String, String? Function(String?)?> _PromptMasukTextValidations = {
  KeterlambatanValueKey: null,
};

mixin $PromptMasuk {
  TextEditingController get keterlambatanController =>
      _getFormTextEditingController(KeterlambatanValueKey);

  FocusNode get keterlambatanFocusNode =>
      _getFormFocusNode(KeterlambatanValueKey);

  TextEditingController _getFormTextEditingController(
    String key, {
    String? initialValue,
  }) {
    if (_PromptMasukTextEditingControllers.containsKey(key)) {
      return _PromptMasukTextEditingControllers[key]!;
    }

    _PromptMasukTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _PromptMasukTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_PromptMasukFocusNodes.containsKey(key)) {
      return _PromptMasukFocusNodes[key]!;
    }
    _PromptMasukFocusNodes[key] = FocusNode();
    return _PromptMasukFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormStateHelper model) {
    keterlambatanController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  @Deprecated(
    'Use syncFormWithViewModel instead.'
    'This feature was deprecated after 3.1.0.',
  )
  void listenToFormUpdated(FormViewModel model) {
    keterlambatanController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormStateHelper model, {bool forceValidate = false}) {
    model.setData(
      model.formValueMap
        ..addAll({
          KeterlambatanValueKey: keterlambatanController.text,
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

    for (var controller in _PromptMasukTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _PromptMasukFocusNodes.values) {
      focusNode.dispose();
    }

    _PromptMasukTextEditingControllers.clear();
    _PromptMasukFocusNodes.clear();
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

  String? get keterlambatanValue =>
      this.formValueMap[KeterlambatanValueKey] as String?;

  set keterlambatanValue(String? value) {
    this.setData(
      this.formValueMap..addAll({KeterlambatanValueKey: value}),
    );

    if (_PromptMasukTextEditingControllers.containsKey(KeterlambatanValueKey)) {
      _PromptMasukTextEditingControllers[KeterlambatanValueKey]?.text =
          value ?? '';
    }
  }

  bool get hasKeterlambatan =>
      this.formValueMap.containsKey(KeterlambatanValueKey) &&
      (keterlambatanValue?.isNotEmpty ?? false);

  bool get hasKeterlambatanValidationMessage =>
      this.fieldsValidationMessages[KeterlambatanValueKey]?.isNotEmpty ?? false;

  String? get keterlambatanValidationMessage =>
      this.fieldsValidationMessages[KeterlambatanValueKey];
}

extension Methods on FormStateHelper {
  setKeterlambatanValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[KeterlambatanValueKey] = validationMessage;

  /// Clears text input fields on the Form
  void clearForm() {
    keterlambatanValue = '';
  }

  /// Validates text input fields on the Form
  void validateForm() {
    this.setValidationMessages({
      KeterlambatanValueKey: getValidationMessage(KeterlambatanValueKey),
    });
  }
}

/// Returns the validation message for the given key
String? getValidationMessage(String key) {
  final validatorForKey = _PromptMasukTextValidations[key];
  if (validatorForKey == null) return null;

  String? validationMessageForKey = validatorForKey(
    _PromptMasukTextEditingControllers[key]!.text,
  );

  return validationMessageForKey;
}

/// Updates the fieldsValidationMessages on the FormViewModel
void updateValidationData(FormStateHelper model) =>
    model.setValidationMessages({
      KeterlambatanValueKey: getValidationMessage(KeterlambatanValueKey),
    });
