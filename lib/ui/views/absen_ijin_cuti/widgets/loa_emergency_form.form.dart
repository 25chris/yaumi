// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const bool _autoTextFieldValidation = true;

const String IjinCutiValueKey = 'ijinCuti';

final Map<String, TextEditingController>
    _LoaEmergencyFormTextEditingControllers = {};

final Map<String, FocusNode> _LoaEmergencyFormFocusNodes = {};

final Map<String, String? Function(String?)?> _LoaEmergencyFormTextValidations =
    {
  IjinCutiValueKey: null,
};

mixin $LoaEmergencyForm {
  TextEditingController get ijinCutiController =>
      _getFormTextEditingController(IjinCutiValueKey);

  FocusNode get ijinCutiFocusNode => _getFormFocusNode(IjinCutiValueKey);

  TextEditingController _getFormTextEditingController(
    String key, {
    String? initialValue,
  }) {
    if (_LoaEmergencyFormTextEditingControllers.containsKey(key)) {
      return _LoaEmergencyFormTextEditingControllers[key]!;
    }

    _LoaEmergencyFormTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _LoaEmergencyFormTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_LoaEmergencyFormFocusNodes.containsKey(key)) {
      return _LoaEmergencyFormFocusNodes[key]!;
    }
    _LoaEmergencyFormFocusNodes[key] = FocusNode();
    return _LoaEmergencyFormFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormStateHelper model) {
    ijinCutiController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  @Deprecated(
    'Use syncFormWithViewModel instead.'
    'This feature was deprecated after 3.1.0.',
  )
  void listenToFormUpdated(FormViewModel model) {
    ijinCutiController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormStateHelper model, {bool forceValidate = false}) {
    model.setData(
      model.formValueMap
        ..addAll({
          IjinCutiValueKey: ijinCutiController.text,
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

    for (var controller in _LoaEmergencyFormTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _LoaEmergencyFormFocusNodes.values) {
      focusNode.dispose();
    }

    _LoaEmergencyFormTextEditingControllers.clear();
    _LoaEmergencyFormFocusNodes.clear();
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

  String? get ijinCutiValue => this.formValueMap[IjinCutiValueKey] as String?;

  set ijinCutiValue(String? value) {
    this.setData(
      this.formValueMap..addAll({IjinCutiValueKey: value}),
    );

    if (_LoaEmergencyFormTextEditingControllers.containsKey(IjinCutiValueKey)) {
      _LoaEmergencyFormTextEditingControllers[IjinCutiValueKey]?.text =
          value ?? '';
    }
  }

  bool get hasIjinCuti =>
      this.formValueMap.containsKey(IjinCutiValueKey) &&
      (ijinCutiValue?.isNotEmpty ?? false);

  bool get hasIjinCutiValidationMessage =>
      this.fieldsValidationMessages[IjinCutiValueKey]?.isNotEmpty ?? false;

  String? get ijinCutiValidationMessage =>
      this.fieldsValidationMessages[IjinCutiValueKey];
}

extension Methods on FormStateHelper {
  setIjinCutiValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[IjinCutiValueKey] = validationMessage;

  /// Clears text input fields on the Form
  void clearForm() {
    ijinCutiValue = '';
  }

  /// Validates text input fields on the Form
  void validateForm() {
    this.setValidationMessages({
      IjinCutiValueKey: getValidationMessage(IjinCutiValueKey),
    });
  }
}

/// Returns the validation message for the given key
String? getValidationMessage(String key) {
  final validatorForKey = _LoaEmergencyFormTextValidations[key];
  if (validatorForKey == null) return null;

  String? validationMessageForKey = validatorForKey(
    _LoaEmergencyFormTextEditingControllers[key]!.text,
  );

  return validationMessageForKey;
}

/// Updates the fieldsValidationMessages on the FormViewModel
void updateValidationData(FormStateHelper model) =>
    model.setValidationMessages({
      IjinCutiValueKey: getValidationMessage(IjinCutiValueKey),
    });
