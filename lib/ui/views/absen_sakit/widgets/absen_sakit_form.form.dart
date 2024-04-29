// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const bool _autoTextFieldValidation = true;

const String IjinSakitValueKey = 'ijinSakit';

final Map<String, TextEditingController> _AbsenSakitFormTextEditingControllers =
    {};

final Map<String, FocusNode> _AbsenSakitFormFocusNodes = {};

final Map<String, String? Function(String?)?> _AbsenSakitFormTextValidations = {
  IjinSakitValueKey: null,
};

mixin $AbsenSakitForm {
  TextEditingController get ijinSakitController =>
      _getFormTextEditingController(IjinSakitValueKey);

  FocusNode get ijinSakitFocusNode => _getFormFocusNode(IjinSakitValueKey);

  TextEditingController _getFormTextEditingController(
    String key, {
    String? initialValue,
  }) {
    if (_AbsenSakitFormTextEditingControllers.containsKey(key)) {
      return _AbsenSakitFormTextEditingControllers[key]!;
    }

    _AbsenSakitFormTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _AbsenSakitFormTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_AbsenSakitFormFocusNodes.containsKey(key)) {
      return _AbsenSakitFormFocusNodes[key]!;
    }
    _AbsenSakitFormFocusNodes[key] = FocusNode();
    return _AbsenSakitFormFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormStateHelper model) {
    ijinSakitController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  @Deprecated(
    'Use syncFormWithViewModel instead.'
    'This feature was deprecated after 3.1.0.',
  )
  void listenToFormUpdated(FormViewModel model) {
    ijinSakitController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormStateHelper model, {bool forceValidate = false}) {
    model.setData(
      model.formValueMap
        ..addAll({
          IjinSakitValueKey: ijinSakitController.text,
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

    for (var controller in _AbsenSakitFormTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _AbsenSakitFormFocusNodes.values) {
      focusNode.dispose();
    }

    _AbsenSakitFormTextEditingControllers.clear();
    _AbsenSakitFormFocusNodes.clear();
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

  String? get ijinSakitValue => this.formValueMap[IjinSakitValueKey] as String?;

  set ijinSakitValue(String? value) {
    this.setData(
      this.formValueMap..addAll({IjinSakitValueKey: value}),
    );

    if (_AbsenSakitFormTextEditingControllers.containsKey(IjinSakitValueKey)) {
      _AbsenSakitFormTextEditingControllers[IjinSakitValueKey]?.text =
          value ?? '';
    }
  }

  bool get hasIjinSakit =>
      this.formValueMap.containsKey(IjinSakitValueKey) &&
      (ijinSakitValue?.isNotEmpty ?? false);

  bool get hasIjinSakitValidationMessage =>
      this.fieldsValidationMessages[IjinSakitValueKey]?.isNotEmpty ?? false;

  String? get ijinSakitValidationMessage =>
      this.fieldsValidationMessages[IjinSakitValueKey];
}

extension Methods on FormStateHelper {
  setIjinSakitValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[IjinSakitValueKey] = validationMessage;

  /// Clears text input fields on the Form
  void clearForm() {
    ijinSakitValue = '';
  }

  /// Validates text input fields on the Form
  void validateForm() {
    this.setValidationMessages({
      IjinSakitValueKey: getValidationMessage(IjinSakitValueKey),
    });
  }
}

/// Returns the validation message for the given key
String? getValidationMessage(String key) {
  final validatorForKey = _AbsenSakitFormTextValidations[key];
  if (validatorForKey == null) return null;

  String? validationMessageForKey = validatorForKey(
    _AbsenSakitFormTextEditingControllers[key]!.text,
  );

  return validationMessageForKey;
}

/// Updates the fieldsValidationMessages on the FormViewModel
void updateValidationData(FormStateHelper model) =>
    model.setValidationMessages({
      IjinSakitValueKey: getValidationMessage(IjinSakitValueKey),
    });
