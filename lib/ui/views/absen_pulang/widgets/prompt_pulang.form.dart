// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const bool _autoTextFieldValidation = true;

const String PulangAwalValueKey = 'pulangAwal';

final Map<String, TextEditingController> _PromptPulangTextEditingControllers =
    {};

final Map<String, FocusNode> _PromptPulangFocusNodes = {};

final Map<String, String? Function(String?)?> _PromptPulangTextValidations = {
  PulangAwalValueKey: null,
};

mixin $PromptPulang {
  TextEditingController get pulangAwalController =>
      _getFormTextEditingController(PulangAwalValueKey);

  FocusNode get pulangAwalFocusNode => _getFormFocusNode(PulangAwalValueKey);

  TextEditingController _getFormTextEditingController(
    String key, {
    String? initialValue,
  }) {
    if (_PromptPulangTextEditingControllers.containsKey(key)) {
      return _PromptPulangTextEditingControllers[key]!;
    }

    _PromptPulangTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _PromptPulangTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_PromptPulangFocusNodes.containsKey(key)) {
      return _PromptPulangFocusNodes[key]!;
    }
    _PromptPulangFocusNodes[key] = FocusNode();
    return _PromptPulangFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormStateHelper model) {
    pulangAwalController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  @Deprecated(
    'Use syncFormWithViewModel instead.'
    'This feature was deprecated after 3.1.0.',
  )
  void listenToFormUpdated(FormViewModel model) {
    pulangAwalController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormStateHelper model, {bool forceValidate = false}) {
    model.setData(
      model.formValueMap
        ..addAll({
          PulangAwalValueKey: pulangAwalController.text,
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

    for (var controller in _PromptPulangTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _PromptPulangFocusNodes.values) {
      focusNode.dispose();
    }

    _PromptPulangTextEditingControllers.clear();
    _PromptPulangFocusNodes.clear();
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

  String? get pulangAwalValue =>
      this.formValueMap[PulangAwalValueKey] as String?;

  set pulangAwalValue(String? value) {
    this.setData(
      this.formValueMap..addAll({PulangAwalValueKey: value}),
    );

    if (_PromptPulangTextEditingControllers.containsKey(PulangAwalValueKey)) {
      _PromptPulangTextEditingControllers[PulangAwalValueKey]?.text =
          value ?? '';
    }
  }

  bool get hasPulangAwal =>
      this.formValueMap.containsKey(PulangAwalValueKey) &&
      (pulangAwalValue?.isNotEmpty ?? false);

  bool get hasPulangAwalValidationMessage =>
      this.fieldsValidationMessages[PulangAwalValueKey]?.isNotEmpty ?? false;

  String? get pulangAwalValidationMessage =>
      this.fieldsValidationMessages[PulangAwalValueKey];
}

extension Methods on FormStateHelper {
  setPulangAwalValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[PulangAwalValueKey] = validationMessage;

  /// Clears text input fields on the Form
  void clearForm() {
    pulangAwalValue = '';
  }

  /// Validates text input fields on the Form
  void validateForm() {
    this.setValidationMessages({
      PulangAwalValueKey: getValidationMessage(PulangAwalValueKey),
    });
  }
}

/// Returns the validation message for the given key
String? getValidationMessage(String key) {
  final validatorForKey = _PromptPulangTextValidations[key];
  if (validatorForKey == null) return null;

  String? validationMessageForKey = validatorForKey(
    _PromptPulangTextEditingControllers[key]!.text,
  );

  return validationMessageForKey;
}

/// Updates the fieldsValidationMessages on the FormViewModel
void updateValidationData(FormStateHelper model) =>
    model.setValidationMessages({
      PulangAwalValueKey: getValidationMessage(PulangAwalValueKey),
    });
