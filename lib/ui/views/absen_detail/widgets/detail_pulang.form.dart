// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const bool _autoTextFieldValidation = true;

const String PulangLebihAwalValueKey = 'pulangLebihAwal';

final Map<String, TextEditingController> _DetailPulangTextEditingControllers =
    {};

final Map<String, FocusNode> _DetailPulangFocusNodes = {};

final Map<String, String? Function(String?)?> _DetailPulangTextValidations = {
  PulangLebihAwalValueKey: null,
};

mixin $DetailPulang {
  TextEditingController get pulangLebihAwalController =>
      _getFormTextEditingController(PulangLebihAwalValueKey);

  FocusNode get pulangLebihAwalFocusNode =>
      _getFormFocusNode(PulangLebihAwalValueKey);

  TextEditingController _getFormTextEditingController(
    String key, {
    String? initialValue,
  }) {
    if (_DetailPulangTextEditingControllers.containsKey(key)) {
      return _DetailPulangTextEditingControllers[key]!;
    }

    _DetailPulangTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _DetailPulangTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_DetailPulangFocusNodes.containsKey(key)) {
      return _DetailPulangFocusNodes[key]!;
    }
    _DetailPulangFocusNodes[key] = FocusNode();
    return _DetailPulangFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormStateHelper model) {
    pulangLebihAwalController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  @Deprecated(
    'Use syncFormWithViewModel instead.'
    'This feature was deprecated after 3.1.0.',
  )
  void listenToFormUpdated(FormViewModel model) {
    pulangLebihAwalController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormStateHelper model, {bool forceValidate = false}) {
    model.setData(
      model.formValueMap
        ..addAll({
          PulangLebihAwalValueKey: pulangLebihAwalController.text,
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

    for (var controller in _DetailPulangTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _DetailPulangFocusNodes.values) {
      focusNode.dispose();
    }

    _DetailPulangTextEditingControllers.clear();
    _DetailPulangFocusNodes.clear();
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

  String? get pulangLebihAwalValue =>
      this.formValueMap[PulangLebihAwalValueKey] as String?;

  set pulangLebihAwalValue(String? value) {
    this.setData(
      this.formValueMap..addAll({PulangLebihAwalValueKey: value}),
    );

    if (_DetailPulangTextEditingControllers.containsKey(
        PulangLebihAwalValueKey)) {
      _DetailPulangTextEditingControllers[PulangLebihAwalValueKey]?.text =
          value ?? '';
    }
  }

  bool get hasPulangLebihAwal =>
      this.formValueMap.containsKey(PulangLebihAwalValueKey) &&
      (pulangLebihAwalValue?.isNotEmpty ?? false);

  bool get hasPulangLebihAwalValidationMessage =>
      this.fieldsValidationMessages[PulangLebihAwalValueKey]?.isNotEmpty ??
      false;

  String? get pulangLebihAwalValidationMessage =>
      this.fieldsValidationMessages[PulangLebihAwalValueKey];
}

extension Methods on FormStateHelper {
  setPulangLebihAwalValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[PulangLebihAwalValueKey] =
          validationMessage;

  /// Clears text input fields on the Form
  void clearForm() {
    pulangLebihAwalValue = '';
  }

  /// Validates text input fields on the Form
  void validateForm() {
    this.setValidationMessages({
      PulangLebihAwalValueKey: getValidationMessage(PulangLebihAwalValueKey),
    });
  }
}

/// Returns the validation message for the given key
String? getValidationMessage(String key) {
  final validatorForKey = _DetailPulangTextValidations[key];
  if (validatorForKey == null) return null;

  String? validationMessageForKey = validatorForKey(
    _DetailPulangTextEditingControllers[key]!.text,
  );

  return validationMessageForKey;
}

/// Updates the fieldsValidationMessages on the FormViewModel
void updateValidationData(FormStateHelper model) =>
    model.setValidationMessages({
      PulangLebihAwalValueKey: getValidationMessage(PulangLebihAwalValueKey),
    });
