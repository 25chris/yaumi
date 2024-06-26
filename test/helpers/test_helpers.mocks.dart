// Mocks generated by Mockito 5.4.4 from annotations
// in yaumi/test/helpers/test_helpers.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;
import 'dart:ui' as _i6;

import 'package:flutter/material.dart' as _i1;
import 'package:mockito/mockito.dart' as _i2;
import 'package:mockito/src/dummies.dart' as _i4;
import 'package:stacked_services/stacked_services.dart' as _i3;
import 'package:yaumi/models/strapi/absen_strapi.dart' as _i10;
import 'package:yaumi/models/strapi/yaumi_strapi.dart' as _i8;
import 'package:yaumi/models/yaumi_user.dart' as _i9;
import 'package:yaumi/services/http_service.dart' as _i7;
import 'package:yaumi/services/snacked_service.dart' as _i11;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeGlobalKey_0<T extends _i1.State<_i1.StatefulWidget>>
    extends _i2.SmartFake implements _i1.GlobalKey<T> {
  _FakeGlobalKey_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [NavigationService].
///
/// See the documentation for Mockito's code generation for more information.
class MockNavigationService extends _i2.Mock implements _i3.NavigationService {
  @override
  String get previousRoute => (super.noSuchMethod(
        Invocation.getter(#previousRoute),
        returnValue: _i4.dummyValue<String>(
          this,
          Invocation.getter(#previousRoute),
        ),
        returnValueForMissingStub: _i4.dummyValue<String>(
          this,
          Invocation.getter(#previousRoute),
        ),
      ) as String);

  @override
  String get currentRoute => (super.noSuchMethod(
        Invocation.getter(#currentRoute),
        returnValue: _i4.dummyValue<String>(
          this,
          Invocation.getter(#currentRoute),
        ),
        returnValueForMissingStub: _i4.dummyValue<String>(
          this,
          Invocation.getter(#currentRoute),
        ),
      ) as String);

  @override
  _i1.GlobalKey<_i1.NavigatorState>? nestedNavigationKey(int? index) =>
      (super.noSuchMethod(
        Invocation.method(
          #nestedNavigationKey,
          [index],
        ),
        returnValueForMissingStub: null,
      ) as _i1.GlobalKey<_i1.NavigatorState>?);

  @override
  void config({
    bool? enableLog,
    bool? defaultPopGesture,
    bool? defaultOpaqueRoute,
    Duration? defaultDurationTransition,
    bool? defaultGlobalState,
    _i3.Transition? defaultTransitionStyle,
    String? defaultTransition,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #config,
          [],
          {
            #enableLog: enableLog,
            #defaultPopGesture: defaultPopGesture,
            #defaultOpaqueRoute: defaultOpaqueRoute,
            #defaultDurationTransition: defaultDurationTransition,
            #defaultGlobalState: defaultGlobalState,
            #defaultTransitionStyle: defaultTransitionStyle,
            #defaultTransition: defaultTransition,
          },
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i5.Future<T?>? navigateWithTransition<T>(
    _i1.Widget? page, {
    bool? opaque,
    String? transition = r'',
    Duration? duration,
    bool? popGesture,
    int? id,
    _i1.Curve? curve,
    bool? fullscreenDialog = false,
    bool? preventDuplicates = true,
    _i3.Transition? transitionClass,
    _i3.Transition? transitionStyle,
    String? routeName,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #navigateWithTransition,
          [page],
          {
            #opaque: opaque,
            #transition: transition,
            #duration: duration,
            #popGesture: popGesture,
            #id: id,
            #curve: curve,
            #fullscreenDialog: fullscreenDialog,
            #preventDuplicates: preventDuplicates,
            #transitionClass: transitionClass,
            #transitionStyle: transitionStyle,
            #routeName: routeName,
          },
        ),
        returnValueForMissingStub: null,
      ) as _i5.Future<T?>?);

  @override
  _i5.Future<T?>? replaceWithTransition<T>(
    _i1.Widget? page, {
    bool? opaque,
    String? transition = r'',
    Duration? duration,
    bool? popGesture,
    int? id,
    _i1.Curve? curve,
    bool? fullscreenDialog = false,
    bool? preventDuplicates = true,
    _i3.Transition? transitionClass,
    _i3.Transition? transitionStyle,
    String? routeName,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #replaceWithTransition,
          [page],
          {
            #opaque: opaque,
            #transition: transition,
            #duration: duration,
            #popGesture: popGesture,
            #id: id,
            #curve: curve,
            #fullscreenDialog: fullscreenDialog,
            #preventDuplicates: preventDuplicates,
            #transitionClass: transitionClass,
            #transitionStyle: transitionStyle,
            #routeName: routeName,
          },
        ),
        returnValueForMissingStub: null,
      ) as _i5.Future<T?>?);

  @override
  bool back<T>({
    dynamic result,
    int? id,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #back,
          [],
          {
            #result: result,
            #id: id,
          },
        ),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);

  @override
  void popUntil(
    _i1.RoutePredicate? predicate, {
    int? id,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #popUntil,
          [predicate],
          {#id: id},
        ),
        returnValueForMissingStub: null,
      );

  @override
  void popRepeated(int? popTimes) => super.noSuchMethod(
        Invocation.method(
          #popRepeated,
          [popTimes],
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i5.Future<T?>? navigateTo<T>(
    String? routeName, {
    dynamic arguments,
    int? id,
    bool? preventDuplicates = true,
    Map<String, String>? parameters,
    _i1.RouteTransitionsBuilder? transition,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #navigateTo,
          [routeName],
          {
            #arguments: arguments,
            #id: id,
            #preventDuplicates: preventDuplicates,
            #parameters: parameters,
            #transition: transition,
          },
        ),
        returnValueForMissingStub: null,
      ) as _i5.Future<T?>?);

  @override
  _i5.Future<T?>? navigateToView<T>(
    _i1.Widget? view, {
    dynamic arguments,
    int? id,
    bool? opaque,
    _i1.Curve? curve,
    Duration? duration,
    bool? fullscreenDialog = false,
    bool? popGesture,
    bool? preventDuplicates = true,
    _i3.Transition? transition,
    _i3.Transition? transitionStyle,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #navigateToView,
          [view],
          {
            #arguments: arguments,
            #id: id,
            #opaque: opaque,
            #curve: curve,
            #duration: duration,
            #fullscreenDialog: fullscreenDialog,
            #popGesture: popGesture,
            #preventDuplicates: preventDuplicates,
            #transition: transition,
            #transitionStyle: transitionStyle,
          },
        ),
        returnValueForMissingStub: null,
      ) as _i5.Future<T?>?);

  @override
  _i5.Future<T?>? replaceWith<T>(
    String? routeName, {
    dynamic arguments,
    int? id,
    bool? preventDuplicates = true,
    Map<String, String>? parameters,
    _i1.RouteTransitionsBuilder? transition,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #replaceWith,
          [routeName],
          {
            #arguments: arguments,
            #id: id,
            #preventDuplicates: preventDuplicates,
            #parameters: parameters,
            #transition: transition,
          },
        ),
        returnValueForMissingStub: null,
      ) as _i5.Future<T?>?);

  @override
  _i5.Future<T?>? clearStackAndShow<T>(
    String? routeName, {
    dynamic arguments,
    int? id,
    Map<String, String>? parameters,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #clearStackAndShow,
          [routeName],
          {
            #arguments: arguments,
            #id: id,
            #parameters: parameters,
          },
        ),
        returnValueForMissingStub: null,
      ) as _i5.Future<T?>?);

  @override
  _i5.Future<T?>? clearStackAndShowView<T>(
    _i1.Widget? view, {
    dynamic arguments,
    int? id,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #clearStackAndShowView,
          [view],
          {
            #arguments: arguments,
            #id: id,
          },
        ),
        returnValueForMissingStub: null,
      ) as _i5.Future<T?>?);

  @override
  _i5.Future<T?>? clearTillFirstAndShow<T>(
    String? routeName, {
    dynamic arguments,
    int? id,
    bool? preventDuplicates = true,
    Map<String, String>? parameters,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #clearTillFirstAndShow,
          [routeName],
          {
            #arguments: arguments,
            #id: id,
            #preventDuplicates: preventDuplicates,
            #parameters: parameters,
          },
        ),
        returnValueForMissingStub: null,
      ) as _i5.Future<T?>?);

  @override
  _i5.Future<T?>? clearTillFirstAndShowView<T>(
    _i1.Widget? view, {
    dynamic arguments,
    int? id,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #clearTillFirstAndShowView,
          [view],
          {
            #arguments: arguments,
            #id: id,
          },
        ),
        returnValueForMissingStub: null,
      ) as _i5.Future<T?>?);

  @override
  _i5.Future<T?>? pushNamedAndRemoveUntil<T>(
    String? routeName, {
    _i1.RoutePredicate? predicate,
    dynamic arguments,
    int? id,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #pushNamedAndRemoveUntil,
          [routeName],
          {
            #predicate: predicate,
            #arguments: arguments,
            #id: id,
          },
        ),
        returnValueForMissingStub: null,
      ) as _i5.Future<T?>?);
}

/// A class which mocks [BottomSheetService].
///
/// See the documentation for Mockito's code generation for more information.
class MockBottomSheetService extends _i2.Mock
    implements _i3.BottomSheetService {
  @override
  void setCustomSheetBuilders(Map<dynamic, _i3.SheetBuilder>? builders) =>
      super.noSuchMethod(
        Invocation.method(
          #setCustomSheetBuilders,
          [builders],
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i5.Future<_i3.SheetResponse<dynamic>?> showBottomSheet({
    required String? title,
    String? description,
    String? confirmButtonTitle = r'Ok',
    String? cancelButtonTitle,
    bool? enableDrag = true,
    bool? barrierDismissible = true,
    bool? isScrollControlled = false,
    Duration? exitBottomSheetDuration,
    Duration? enterBottomSheetDuration,
    bool? ignoreSafeArea,
    bool? useRootNavigator = false,
    double? elevation = 1.0,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #showBottomSheet,
          [],
          {
            #title: title,
            #description: description,
            #confirmButtonTitle: confirmButtonTitle,
            #cancelButtonTitle: cancelButtonTitle,
            #enableDrag: enableDrag,
            #barrierDismissible: barrierDismissible,
            #isScrollControlled: isScrollControlled,
            #exitBottomSheetDuration: exitBottomSheetDuration,
            #enterBottomSheetDuration: enterBottomSheetDuration,
            #ignoreSafeArea: ignoreSafeArea,
            #useRootNavigator: useRootNavigator,
            #elevation: elevation,
          },
        ),
        returnValue: _i5.Future<_i3.SheetResponse<dynamic>?>.value(),
        returnValueForMissingStub:
            _i5.Future<_i3.SheetResponse<dynamic>?>.value(),
      ) as _i5.Future<_i3.SheetResponse<dynamic>?>);

  @override
  _i5.Future<_i3.SheetResponse<T>?> showCustomSheet<T, R>({
    dynamic variant,
    String? title,
    String? description,
    bool? hasImage = false,
    String? imageUrl,
    bool? showIconInMainButton = false,
    String? mainButtonTitle,
    bool? showIconInSecondaryButton = false,
    String? secondaryButtonTitle,
    bool? showIconInAdditionalButton = false,
    String? additionalButtonTitle,
    bool? takesInput = false,
    _i6.Color? barrierColor = const _i6.Color(2315255808),
    double? elevation = 1.0,
    bool? barrierDismissible = true,
    bool? isScrollControlled = false,
    String? barrierLabel = r'',
    dynamic customData,
    R? data,
    bool? enableDrag = true,
    Duration? exitBottomSheetDuration,
    Duration? enterBottomSheetDuration,
    bool? ignoreSafeArea,
    bool? useRootNavigator = false,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #showCustomSheet,
          [],
          {
            #variant: variant,
            #title: title,
            #description: description,
            #hasImage: hasImage,
            #imageUrl: imageUrl,
            #showIconInMainButton: showIconInMainButton,
            #mainButtonTitle: mainButtonTitle,
            #showIconInSecondaryButton: showIconInSecondaryButton,
            #secondaryButtonTitle: secondaryButtonTitle,
            #showIconInAdditionalButton: showIconInAdditionalButton,
            #additionalButtonTitle: additionalButtonTitle,
            #takesInput: takesInput,
            #barrierColor: barrierColor,
            #elevation: elevation,
            #barrierDismissible: barrierDismissible,
            #isScrollControlled: isScrollControlled,
            #barrierLabel: barrierLabel,
            #customData: customData,
            #data: data,
            #enableDrag: enableDrag,
            #exitBottomSheetDuration: exitBottomSheetDuration,
            #enterBottomSheetDuration: enterBottomSheetDuration,
            #ignoreSafeArea: ignoreSafeArea,
            #useRootNavigator: useRootNavigator,
          },
        ),
        returnValue: _i5.Future<_i3.SheetResponse<T>?>.value(),
        returnValueForMissingStub: _i5.Future<_i3.SheetResponse<T>?>.value(),
      ) as _i5.Future<_i3.SheetResponse<T>?>);

  @override
  void completeSheet(_i3.SheetResponse<dynamic>? response) =>
      super.noSuchMethod(
        Invocation.method(
          #completeSheet,
          [response],
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [DialogService].
///
/// See the documentation for Mockito's code generation for more information.
class MockDialogService extends _i2.Mock implements _i3.DialogService {
  @override
  void registerCustomDialogBuilders(
          Map<dynamic, _i3.DialogBuilder>? builders) =>
      super.noSuchMethod(
        Invocation.method(
          #registerCustomDialogBuilders,
          [builders],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void registerCustomDialogBuilder({
    required dynamic variant,
    required _i1.Widget Function(
      _i1.BuildContext,
      _i3.DialogRequest<dynamic>,
      dynamic Function(_i3.DialogResponse<dynamic>),
    )? builder,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #registerCustomDialogBuilder,
          [],
          {
            #variant: variant,
            #builder: builder,
          },
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i5.Future<_i3.DialogResponse<dynamic>?> showDialog({
    String? title,
    String? description,
    String? cancelTitle,
    _i6.Color? cancelTitleColor,
    String? buttonTitle = r'Ok',
    _i6.Color? buttonTitleColor,
    bool? barrierDismissible = false,
    _i3.DialogPlatform? dialogPlatform,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #showDialog,
          [],
          {
            #title: title,
            #description: description,
            #cancelTitle: cancelTitle,
            #cancelTitleColor: cancelTitleColor,
            #buttonTitle: buttonTitle,
            #buttonTitleColor: buttonTitleColor,
            #barrierDismissible: barrierDismissible,
            #dialogPlatform: dialogPlatform,
          },
        ),
        returnValue: _i5.Future<_i3.DialogResponse<dynamic>?>.value(),
        returnValueForMissingStub:
            _i5.Future<_i3.DialogResponse<dynamic>?>.value(),
      ) as _i5.Future<_i3.DialogResponse<dynamic>?>);

  @override
  _i5.Future<_i3.DialogResponse<T>?> showCustomDialog<T, R>({
    dynamic variant,
    String? title,
    String? description,
    bool? hasImage = false,
    String? imageUrl,
    bool? showIconInMainButton = false,
    String? mainButtonTitle,
    bool? showIconInSecondaryButton = false,
    String? secondaryButtonTitle,
    bool? showIconInAdditionalButton = false,
    String? additionalButtonTitle,
    bool? takesInput = false,
    _i6.Color? barrierColor = const _i6.Color(2315255808),
    bool? barrierDismissible = false,
    String? barrierLabel = r'',
    bool? useSafeArea = true,
    dynamic customData,
    R? data,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #showCustomDialog,
          [],
          {
            #variant: variant,
            #title: title,
            #description: description,
            #hasImage: hasImage,
            #imageUrl: imageUrl,
            #showIconInMainButton: showIconInMainButton,
            #mainButtonTitle: mainButtonTitle,
            #showIconInSecondaryButton: showIconInSecondaryButton,
            #secondaryButtonTitle: secondaryButtonTitle,
            #showIconInAdditionalButton: showIconInAdditionalButton,
            #additionalButtonTitle: additionalButtonTitle,
            #takesInput: takesInput,
            #barrierColor: barrierColor,
            #barrierDismissible: barrierDismissible,
            #barrierLabel: barrierLabel,
            #useSafeArea: useSafeArea,
            #customData: customData,
            #data: data,
          },
        ),
        returnValue: _i5.Future<_i3.DialogResponse<T>?>.value(),
        returnValueForMissingStub: _i5.Future<_i3.DialogResponse<T>?>.value(),
      ) as _i5.Future<_i3.DialogResponse<T>?>);

  @override
  _i5.Future<_i3.DialogResponse<dynamic>?> showConfirmationDialog({
    String? title,
    String? description,
    String? cancelTitle = r'Cancel',
    _i6.Color? cancelTitleColor,
    String? confirmationTitle = r'Ok',
    _i6.Color? confirmationTitleColor,
    bool? barrierDismissible = false,
    _i3.DialogPlatform? dialogPlatform,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #showConfirmationDialog,
          [],
          {
            #title: title,
            #description: description,
            #cancelTitle: cancelTitle,
            #cancelTitleColor: cancelTitleColor,
            #confirmationTitle: confirmationTitle,
            #confirmationTitleColor: confirmationTitleColor,
            #barrierDismissible: barrierDismissible,
            #dialogPlatform: dialogPlatform,
          },
        ),
        returnValue: _i5.Future<_i3.DialogResponse<dynamic>?>.value(),
        returnValueForMissingStub:
            _i5.Future<_i3.DialogResponse<dynamic>?>.value(),
      ) as _i5.Future<_i3.DialogResponse<dynamic>?>);

  @override
  void completeDialog(_i3.DialogResponse<dynamic>? response) =>
      super.noSuchMethod(
        Invocation.method(
          #completeDialog,
          [response],
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [HttpService].
///
/// See the documentation for Mockito's code generation for more information.
class MockHttpService extends _i2.Mock implements _i7.HttpService {
  @override
  _i5.Future<_i8.YaumiStrapi?> getYaumiByDateAndMail({
    required String? email,
    required String? date,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #getYaumiByDateAndMail,
          [],
          {
            #email: email,
            #date: date,
          },
        ),
        returnValue: _i5.Future<_i8.YaumiStrapi?>.value(),
        returnValueForMissingStub: _i5.Future<_i8.YaumiStrapi?>.value(),
      ) as _i5.Future<_i8.YaumiStrapi?>);

  @override
  _i5.Future<_i8.YaumiStrapi?> getYaumiByMail({required String? email}) =>
      (super.noSuchMethod(
        Invocation.method(
          #getYaumiByMail,
          [],
          {#email: email},
        ),
        returnValue: _i5.Future<_i8.YaumiStrapi?>.value(),
        returnValueForMissingStub: _i5.Future<_i8.YaumiStrapi?>.value(),
      ) as _i5.Future<_i8.YaumiStrapi?>);

  @override
  _i5.Future<_i9.YaumiUser?> getYaumiUser() => (super.noSuchMethod(
        Invocation.method(
          #getYaumiUser,
          [],
        ),
        returnValue: _i5.Future<_i9.YaumiUser?>.value(),
        returnValueForMissingStub: _i5.Future<_i9.YaumiUser?>.value(),
      ) as _i5.Future<_i9.YaumiUser?>);

  @override
  _i5.Future<dynamic> putYaumi({
    required String? id,
    required bool? shubuh,
    required bool? dhuhur,
    required bool? ashar,
    required bool? maghrib,
    required bool? isya,
    required int? tahajud,
    required int? dhuha,
    required bool? qshubuh,
    required bool? qdhuhur,
    required bool? bdhuhur,
    required bool? bmaghrib,
    required bool? bisya,
    required int? tilawah,
    required double? poin,
    required String? shaumSunnah,
    required bool? sedekah,
    required bool? dzikirPagi,
    required bool? dzikirPetang,
    required String? taklim,
    required bool? istighfar,
    required bool? shalawat,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #putYaumi,
          [],
          {
            #id: id,
            #shubuh: shubuh,
            #dhuhur: dhuhur,
            #ashar: ashar,
            #maghrib: maghrib,
            #isya: isya,
            #tahajud: tahajud,
            #dhuha: dhuha,
            #qshubuh: qshubuh,
            #qdhuhur: qdhuhur,
            #bdhuhur: bdhuhur,
            #bmaghrib: bmaghrib,
            #bisya: bisya,
            #tilawah: tilawah,
            #poin: poin,
            #shaumSunnah: shaumSunnah,
            #sedekah: sedekah,
            #dzikirPagi: dzikirPagi,
            #dzikirPetang: dzikirPetang,
            #taklim: taklim,
            #istighfar: istighfar,
            #shalawat: shalawat,
          },
        ),
        returnValue: _i5.Future<dynamic>.value(),
        returnValueForMissingStub: _i5.Future<dynamic>.value(),
      ) as _i5.Future<dynamic>);

  @override
  _i5.Future<dynamic> registerToStrapi({
    required String? nama,
    required String? email,
    required String? uid,
    required String? namaGroup,
    required String? gid,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #registerToStrapi,
          [],
          {
            #nama: nama,
            #email: email,
            #uid: uid,
            #namaGroup: namaGroup,
            #gid: gid,
          },
        ),
        returnValue: _i5.Future<dynamic>.value(),
        returnValueForMissingStub: _i5.Future<dynamic>.value(),
      ) as _i5.Future<dynamic>);

  @override
  _i5.Future<void> checkUserRegistration({required String? email}) =>
      (super.noSuchMethod(
        Invocation.method(
          #checkUserRegistration,
          [],
          {#email: email},
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);

  @override
  _i5.Future<void> postYaumi({
    required String? email,
    required String? date,
    required bool? shubuh,
    required bool? dhuhur,
    required bool? ashar,
    required bool? maghrib,
    required bool? isya,
    required int? tahajud,
    required int? dhuha,
    required bool? qshubuh,
    required bool? qdhuhur,
    required bool? bdhuhur,
    required bool? bmaghrib,
    required bool? bisya,
    required int? tilawah,
    required double? poin,
    required String? shaumSunnah,
    required bool? sedekah,
    required bool? dzikirPagi,
    required bool? dzikirPetang,
    required String? taklim,
    required bool? istighfar,
    required bool? shalawat,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #postYaumi,
          [],
          {
            #email: email,
            #date: date,
            #shubuh: shubuh,
            #dhuhur: dhuhur,
            #ashar: ashar,
            #maghrib: maghrib,
            #isya: isya,
            #tahajud: tahajud,
            #dhuha: dhuha,
            #qshubuh: qshubuh,
            #qdhuhur: qdhuhur,
            #bdhuhur: bdhuhur,
            #bmaghrib: bmaghrib,
            #bisya: bisya,
            #tilawah: tilawah,
            #poin: poin,
            #shaumSunnah: shaumSunnah,
            #sedekah: sedekah,
            #dzikirPagi: dzikirPagi,
            #dzikirPetang: dzikirPetang,
            #taklim: taklim,
            #istighfar: istighfar,
            #shalawat: shalawat,
          },
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);

  @override
  _i5.Future<_i10.AbsenStrapi?> getAbsenByDateAndMail({
    required String? email,
    required String? date,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #getAbsenByDateAndMail,
          [],
          {
            #email: email,
            #date: date,
          },
        ),
        returnValue: _i5.Future<_i10.AbsenStrapi?>.value(),
        returnValueForMissingStub: _i5.Future<_i10.AbsenStrapi?>.value(),
      ) as _i5.Future<_i10.AbsenStrapi?>);

  @override
  _i5.Future<dynamic> postAbsenMasukData({
    required String? date,
    required String? timestamp,
    required String? jamMasuk,
    required String? statusKehadiran,
    required String? lokasi,
    String? udzurKeterlambatan,
    required int? checkInDifference,
    required String? pathToImage,
    required int? yaumiUser,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #postAbsenMasukData,
          [],
          {
            #date: date,
            #timestamp: timestamp,
            #jamMasuk: jamMasuk,
            #statusKehadiran: statusKehadiran,
            #lokasi: lokasi,
            #udzurKeterlambatan: udzurKeterlambatan,
            #checkInDifference: checkInDifference,
            #pathToImage: pathToImage,
            #yaumiUser: yaumiUser,
          },
        ),
        returnValue: _i5.Future<dynamic>.value(),
        returnValueForMissingStub: _i5.Future<dynamic>.value(),
      ) as _i5.Future<dynamic>);

  @override
  _i5.Future<dynamic> putAbsenKeluarData({
    required int? id,
    required String? pathToImage,
    required int? calculateDuration,
    String? pulangLebihAwal,
    required int? calculateOvertime,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #putAbsenKeluarData,
          [],
          {
            #id: id,
            #pathToImage: pathToImage,
            #calculateDuration: calculateDuration,
            #pulangLebihAwal: pulangLebihAwal,
            #calculateOvertime: calculateOvertime,
          },
        ),
        returnValue: _i5.Future<dynamic>.value(),
        returnValueForMissingStub: _i5.Future<dynamic>.value(),
      ) as _i5.Future<dynamic>);

  @override
  _i5.Future<dynamic> putAlasanKeterlambatan({
    required int? id,
    required String? keterlambatan,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #putAlasanKeterlambatan,
          [],
          {
            #id: id,
            #keterlambatan: keterlambatan,
          },
        ),
        returnValue: _i5.Future<dynamic>.value(),
        returnValueForMissingStub: _i5.Future<dynamic>.value(),
      ) as _i5.Future<dynamic>);

  @override
  _i5.Future<dynamic> postCutiKerja({
    required String? date,
    required String? timestamp,
    required String? statusKehadiran,
    required String? lokasi,
    required String? alasanIjin,
    required String? tanggalMulaiIjin,
    required String? tanggalAkhirIjin,
    required int? yaumiUser,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #postCutiKerja,
          [],
          {
            #date: date,
            #timestamp: timestamp,
            #statusKehadiran: statusKehadiran,
            #lokasi: lokasi,
            #alasanIjin: alasanIjin,
            #tanggalMulaiIjin: tanggalMulaiIjin,
            #tanggalAkhirIjin: tanggalAkhirIjin,
            #yaumiUser: yaumiUser,
          },
        ),
        returnValue: _i5.Future<dynamic>.value(),
        returnValueForMissingStub: _i5.Future<dynamic>.value(),
      ) as _i5.Future<dynamic>);

  @override
  _i5.Future<dynamic> deleteAbsenById({required int? absenId}) =>
      (super.noSuchMethod(
        Invocation.method(
          #deleteAbsenById,
          [],
          {#absenId: absenId},
        ),
        returnValue: _i5.Future<dynamic>.value(),
        returnValueForMissingStub: _i5.Future<dynamic>.value(),
      ) as _i5.Future<dynamic>);

  @override
  _i5.Future<dynamic> postIjinSakit({
    required String? date,
    required String? namaPenyakit,
    required String? tanggalMulaiIjin,
    required String? tanggalAkhirIjin,
    required int? yaumiUser,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #postIjinSakit,
          [],
          {
            #date: date,
            #namaPenyakit: namaPenyakit,
            #tanggalMulaiIjin: tanggalMulaiIjin,
            #tanggalAkhirIjin: tanggalAkhirIjin,
            #yaumiUser: yaumiUser,
          },
        ),
        returnValue: _i5.Future<dynamic>.value(),
        returnValueForMissingStub: _i5.Future<dynamic>.value(),
      ) as _i5.Future<dynamic>);

  @override
  _i5.Future<String> getAddressFromLatLng(
    double? latitude,
    double? longitude,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #getAddressFromLatLng,
          [
            latitude,
            longitude,
          ],
        ),
        returnValue: _i5.Future<String>.value(_i4.dummyValue<String>(
          this,
          Invocation.method(
            #getAddressFromLatLng,
            [
              latitude,
              longitude,
            ],
          ),
        )),
        returnValueForMissingStub:
            _i5.Future<String>.value(_i4.dummyValue<String>(
          this,
          Invocation.method(
            #getAddressFromLatLng,
            [
              latitude,
              longitude,
            ],
          ),
        )),
      ) as _i5.Future<String>);

  @override
  _i5.Future<String> showAddress() => (super.noSuchMethod(
        Invocation.method(
          #showAddress,
          [],
        ),
        returnValue: _i5.Future<String>.value(_i4.dummyValue<String>(
          this,
          Invocation.method(
            #showAddress,
            [],
          ),
        )),
        returnValueForMissingStub:
            _i5.Future<String>.value(_i4.dummyValue<String>(
          this,
          Invocation.method(
            #showAddress,
            [],
          ),
        )),
      ) as _i5.Future<String>);
}

/// A class which mocks [SnackbarService].
///
/// See the documentation for Mockito's code generation for more information.
class MockSnackbarService extends _i2.Mock implements _i3.SnackbarService {
  @override
  bool get isSnackbarOpen => (super.noSuchMethod(
        Invocation.getter(#isSnackbarOpen),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);

  @override
  void registerSnackbarConfig(_i3.SnackbarConfig? config) => super.noSuchMethod(
        Invocation.method(
          #registerSnackbarConfig,
          [config],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void registerCustomMainButtonBuilder({
    dynamic variant,
    _i1.Widget Function(
      String?,
      Function?,
    )? builder,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #registerCustomMainButtonBuilder,
          [],
          {
            #variant: variant,
            #builder: builder,
          },
        ),
        returnValueForMissingStub: null,
      );

  @override
  void registerCustomSnackbarConfig({
    required dynamic variant,
    _i3.SnackbarConfig? config,
    _i3.SnackbarConfig Function()? configBuilder,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #registerCustomSnackbarConfig,
          [],
          {
            #variant: variant,
            #config: config,
            #configBuilder: configBuilder,
          },
        ),
        returnValueForMissingStub: null,
      );

  @override
  void showSnackbar({
    String? title = r'',
    required String? message,
    dynamic Function(dynamic)? onTap,
    Duration? duration,
    String? mainButtonTitle,
    void Function()? onMainButtonTapped,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #showSnackbar,
          [],
          {
            #title: title,
            #message: message,
            #onTap: onTap,
            #duration: duration,
            #mainButtonTitle: mainButtonTitle,
            #onMainButtonTapped: onMainButtonTapped,
          },
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i5.Future<dynamic>? showCustomSnackBar({
    required String? message,
    _i1.TextStyle? messageTextStyle,
    required dynamic variant,
    String? title,
    _i1.TextStyle? titleTextStyle,
    String? mainButtonTitle,
    _i1.ButtonStyle? mainButtonStyle,
    void Function()? onMainButtonTapped,
    Function? onTap,
    Duration? duration,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #showCustomSnackBar,
          [],
          {
            #message: message,
            #messageTextStyle: messageTextStyle,
            #variant: variant,
            #title: title,
            #titleTextStyle: titleTextStyle,
            #mainButtonTitle: mainButtonTitle,
            #mainButtonStyle: mainButtonStyle,
            #onMainButtonTapped: onMainButtonTapped,
            #onTap: onTap,
            #duration: duration,
          },
        ),
        returnValueForMissingStub: null,
      ) as _i5.Future<dynamic>?);

  @override
  _i5.Future<void> closeSnackbar() => (super.noSuchMethod(
        Invocation.method(
          #closeSnackbar,
          [],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);
}

/// A class which mocks [SnackedService].
///
/// See the documentation for Mockito's code generation for more information.
class MockSnackedService extends _i2.Mock implements _i11.SnackedService {
  @override
  _i1.GlobalKey<_i1.ScaffoldMessengerState> get scaffoldMessengerKey =>
      (super.noSuchMethod(
        Invocation.getter(#scaffoldMessengerKey),
        returnValue: _FakeGlobalKey_0<_i1.ScaffoldMessengerState>(
          this,
          Invocation.getter(#scaffoldMessengerKey),
        ),
        returnValueForMissingStub: _FakeGlobalKey_0<_i1.ScaffoldMessengerState>(
          this,
          Invocation.getter(#scaffoldMessengerKey),
        ),
      ) as _i1.GlobalKey<_i1.ScaffoldMessengerState>);

  @override
  void showSnackbar(String? message) => super.noSuchMethod(
        Invocation.method(
          #showSnackbar,
          [message],
        ),
        returnValueForMissingStub: null,
      );
}
