// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const bool _autoTextFieldValidation = true;

const String UdzurKeterlambatanValueKey = 'udzurKeterlambatan';

final Map<String, TextEditingController> _DetailMasukTextEditingControllers =
    {};

final Map<String, FocusNode> _DetailMasukFocusNodes = {};

final Map<String, String? Function(String?)?> _DetailMasukTextValidations = {
  UdzurKeterlambatanValueKey: null,
};

mixin $DetailMasuk {
  TextEditingController get udzurKeterlambatanController =>
      _getFormTextEditingController(UdzurKeterlambatanValueKey);

  FocusNode get udzurKeterlambatanFocusNode =>
      _getFormFocusNode(UdzurKeterlambatanValueKey);

  TextEditingController _getFormTextEditingController(
    String key, {
    String? initialValue,
  }) {
    if (_DetailMasukTextEditingControllers.containsKey(key)) {
      return _DetailMasukTextEditingControllers[key]!;
    }

    _DetailMasukTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _DetailMasukTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_DetailMasukFocusNodes.containsKey(key)) {
      return _DetailMasukFocusNodes[key]!;
    }
    _DetailMasukFocusNodes[key] = FocusNode();
    return _DetailMasukFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormStateHelper model) {
    udzurKeterlambatanController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  @Deprecated(
    'Use syncFormWithViewModel instead.'
    'This feature was deprecated after 3.1.0.',
  )
  void listenToFormUpdated(FormViewModel model) {
    udzurKeterlambatanController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormStateHelper model, {bool forceValidate = false}) {
    model.setData(
      model.formValueMap
        ..addAll({
          UdzurKeterlambatanValueKey: udzurKeterlambatanController.text,
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

    for (var controller in _DetailMasukTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _DetailMasukFocusNodes.values) {
      focusNode.dispose();
    }

    _DetailMasukTextEditingControllers.clear();
    _DetailMasukFocusNodes.clear();
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

  String? get udzurKeterlambatanValue =>
      this.formValueMap[UdzurKeterlambatanValueKey] as String?;

  set udzurKeterlambatanValue(String? value) {
    this.setData(
      this.formValueMap..addAll({UdzurKeterlambatanValueKey: value}),
    );

    if (_DetailMasukTextEditingControllers.containsKey(
        UdzurKeterlambatanValueKey)) {
      _DetailMasukTextEditingControllers[UdzurKeterlambatanValueKey]?.text =
          value ?? '';
    }
  }

  bool get hasUdzurKeterlambatan =>
      this.formValueMap.containsKey(UdzurKeterlambatanValueKey) &&
      (udzurKeterlambatanValue?.isNotEmpty ?? false);

  bool get hasUdzurKeterlambatanValidationMessage =>
      this.fieldsValidationMessages[UdzurKeterlambatanValueKey]?.isNotEmpty ??
      false;

  String? get udzurKeterlambatanValidationMessage =>
      this.fieldsValidationMessages[UdzurKeterlambatanValueKey];
}

extension Methods on FormStateHelper {
  setUdzurKeterlambatanValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[UdzurKeterlambatanValueKey] =
          validationMessage;

  /// Clears text input fields on the Form
  void clearForm() {
    udzurKeterlambatanValue = '';
  }

  /// Validates text input fields on the Form
  void validateForm() {
    this.setValidationMessages({
      UdzurKeterlambatanValueKey:
          getValidationMessage(UdzurKeterlambatanValueKey),
    });
  }
}

/// Returns the validation message for the given key
String? getValidationMessage(String key) {
  final validatorForKey = _DetailMasukTextValidations[key];
  if (validatorForKey == null) return null;

  String? validationMessageForKey = validatorForKey(
    _DetailMasukTextEditingControllers[key]!.text,
  );

  return validationMessageForKey;
}

/// Updates the fieldsValidationMessages on the FormViewModel
void updateValidationData(FormStateHelper model) =>
    model.setValidationMessages({
      UdzurKeterlambatanValueKey:
          getValidationMessage(UdzurKeterlambatanValueKey),
    });
