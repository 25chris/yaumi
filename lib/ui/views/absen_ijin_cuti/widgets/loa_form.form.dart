// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const bool _autoTextFieldValidation = true;

const String IjinCutiValueKey = 'ijinCuti';

final Map<String, TextEditingController> _LOAFormTextEditingControllers = {};

final Map<String, FocusNode> _LOAFormFocusNodes = {};

final Map<String, String? Function(String?)?> _LOAFormTextValidations = {
  IjinCutiValueKey: null,
};

mixin $LOAForm {
  TextEditingController get ijinCutiController =>
      _getFormTextEditingController(IjinCutiValueKey);

  FocusNode get ijinCutiFocusNode => _getFormFocusNode(IjinCutiValueKey);

  TextEditingController _getFormTextEditingController(
    String key, {
    String? initialValue,
  }) {
    if (_LOAFormTextEditingControllers.containsKey(key)) {
      return _LOAFormTextEditingControllers[key]!;
    }

    _LOAFormTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _LOAFormTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_LOAFormFocusNodes.containsKey(key)) {
      return _LOAFormFocusNodes[key]!;
    }
    _LOAFormFocusNodes[key] = FocusNode();
    return _LOAFormFocusNodes[key]!;
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

    for (var controller in _LOAFormTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _LOAFormFocusNodes.values) {
      focusNode.dispose();
    }

    _LOAFormTextEditingControllers.clear();
    _LOAFormFocusNodes.clear();
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

    if (_LOAFormTextEditingControllers.containsKey(IjinCutiValueKey)) {
      _LOAFormTextEditingControllers[IjinCutiValueKey]?.text = value ?? '';
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
  final validatorForKey = _LOAFormTextValidations[key];
  if (validatorForKey == null) return null;

  String? validationMessageForKey = validatorForKey(
    _LOAFormTextEditingControllers[key]!.text,
  );

  return validationMessageForKey;
}

/// Updates the fieldsValidationMessages on the FormViewModel
void updateValidationData(FormStateHelper model) =>
    model.setValidationMessages({
      IjinCutiValueKey: getValidationMessage(IjinCutiValueKey),
    });
