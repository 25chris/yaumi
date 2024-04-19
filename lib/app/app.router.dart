// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i16;
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart' as _i17;
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i19;
import 'package:yaumi/models/strapi/absen_strapi.dart' as _i18;
import 'package:yaumi/ui/views/absen/absen_view.dart' as _i6;
import 'package:yaumi/ui/views/absen_detail/absen_detail_view.dart' as _i15;
import 'package:yaumi/ui/views/absen_ijin_cuti/absen_ijin_cuti_view.dart'
    as _i12;
import 'package:yaumi/ui/views/absen_masuk/absen_masuk_view.dart' as _i13;
import 'package:yaumi/ui/views/absen_pulang/absen_pulang_view.dart' as _i14;
import 'package:yaumi/ui/views/absen_selfie/absen_selfie_view.dart' as _i11;
import 'package:yaumi/ui/views/groups/groups_view.dart' as _i7;
import 'package:yaumi/ui/views/home/home_view.dart' as _i3;
import 'package:yaumi/ui/views/login/login_view.dart' as _i2;
import 'package:yaumi/ui/views/settings/settings_view.dart' as _i8;
import 'package:yaumi/ui/views/startup/startup_view.dart' as _i4;
import 'package:yaumi/ui/views/strapi_login/strapi_login_view.dart' as _i9;
import 'package:yaumi/ui/views/yaumi/yaumi_view.dart' as _i5;
import 'package:yaumi/ui/views/yaumi_log/yaumi_log_view.dart' as _i10;

class Routes {
  static const loginView = '/login-view';

  static const homeView = '/home-view';

  static const startupView = '/startup-view';

  static const yaumiView = '/yaumi-view';

  static const absenView = '/absen-view';

  static const groupsView = '/groups-view';

  static const settingsView = '/settings-view';

  static const strapiLoginView = '/strapi-login-view';

  static const yaumiLogView = '/yaumi-log-view';

  static const absenSelfieView = '/absen-selfie-view';

  static const absenIjinCutiView = '/absen-ijin-cuti-view';

  static const absenMasukView = '/absen-masuk-view';

  static const absenPulangView = '/absen-pulang-view';

  static const absenDetailView = '/absen-detail-view';

  static const all = <String>{
    loginView,
    homeView,
    startupView,
    yaumiView,
    absenView,
    groupsView,
    settingsView,
    strapiLoginView,
    yaumiLogView,
    absenSelfieView,
    absenIjinCutiView,
    absenMasukView,
    absenPulangView,
    absenDetailView,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.loginView,
      page: _i2.LoginView,
    ),
    _i1.RouteDef(
      Routes.homeView,
      page: _i3.HomeView,
    ),
    _i1.RouteDef(
      Routes.startupView,
      page: _i4.StartupView,
    ),
    _i1.RouteDef(
      Routes.yaumiView,
      page: _i5.YaumiView,
    ),
    _i1.RouteDef(
      Routes.absenView,
      page: _i6.AbsenView,
    ),
    _i1.RouteDef(
      Routes.groupsView,
      page: _i7.GroupsView,
    ),
    _i1.RouteDef(
      Routes.settingsView,
      page: _i8.SettingsView,
    ),
    _i1.RouteDef(
      Routes.strapiLoginView,
      page: _i9.StrapiLoginView,
    ),
    _i1.RouteDef(
      Routes.yaumiLogView,
      page: _i10.YaumiLogView,
    ),
    _i1.RouteDef(
      Routes.absenSelfieView,
      page: _i11.AbsenSelfieView,
    ),
    _i1.RouteDef(
      Routes.absenIjinCutiView,
      page: _i12.AbsenIjinCutiView,
    ),
    _i1.RouteDef(
      Routes.absenMasukView,
      page: _i13.AbsenMasukView,
    ),
    _i1.RouteDef(
      Routes.absenPulangView,
      page: _i14.AbsenPulangView,
    ),
    _i1.RouteDef(
      Routes.absenDetailView,
      page: _i15.AbsenDetailView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.LoginView: (data) {
      return _i16.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.LoginView(),
        settings: data,
      );
    },
    _i3.HomeView: (data) {
      final args = data.getArgs<HomeViewArguments>(nullOk: false);
      return _i16.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i3.HomeView(key: args.key, currentUser: args.currentUser),
        settings: data,
      );
    },
    _i4.StartupView: (data) {
      return _i16.MaterialPageRoute<dynamic>(
        builder: (context) => const _i4.StartupView(),
        settings: data,
      );
    },
    _i5.YaumiView: (data) {
      return _i16.MaterialPageRoute<dynamic>(
        builder: (context) => const _i5.YaumiView(),
        settings: data,
      );
    },
    _i6.AbsenView: (data) {
      final args = data.getArgs<AbsenViewArguments>(nullOk: false);
      return _i16.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i6.AbsenView(key: args.key, userAccount: args.userAccount),
        settings: data,
      );
    },
    _i7.GroupsView: (data) {
      return _i16.MaterialPageRoute<dynamic>(
        builder: (context) => const _i7.GroupsView(),
        settings: data,
      );
    },
    _i8.SettingsView: (data) {
      final args = data.getArgs<SettingsViewArguments>(nullOk: false);
      return _i16.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i8.SettingsView(key: args.key, currentUser: args.currentUser),
        settings: data,
      );
    },
    _i9.StrapiLoginView: (data) {
      final args = data.getArgs<StrapiLoginViewArguments>(nullOk: false);
      return _i16.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i9.StrapiLoginView(key: args.key, currentUser: args.currentUser),
        settings: data,
      );
    },
    _i10.YaumiLogView: (data) {
      return _i16.MaterialPageRoute<dynamic>(
        builder: (context) => const _i10.YaumiLogView(),
        settings: data,
      );
    },
    _i11.AbsenSelfieView: (data) {
      final args = data.getArgs<AbsenSelfieViewArguments>(nullOk: false);
      return _i16.MaterialPageRoute<dynamic>(
        builder: (context) => _i11.AbsenSelfieView(
            key: args.key,
            selectedDatetime: args.selectedDatetime,
            userAccount: args.userAccount,
            datum: args.datum,
            isCheckIn: args.isCheckIn),
        settings: data,
      );
    },
    _i12.AbsenIjinCutiView: (data) {
      return _i16.MaterialPageRoute<dynamic>(
        builder: (context) => const _i12.AbsenIjinCutiView(),
        settings: data,
      );
    },
    _i13.AbsenMasukView: (data) {
      final args = data.getArgs<AbsenMasukViewArguments>(nullOk: false);
      return _i16.MaterialPageRoute<dynamic>(
        builder: (context) => _i13.AbsenMasukView(
            key: args.key,
            selectedDate: args.selectedDate,
            userAccount: args.userAccount),
        settings: data,
      );
    },
    _i14.AbsenPulangView: (data) {
      final args = data.getArgs<AbsenPulangViewArguments>(nullOk: false);
      return _i16.MaterialPageRoute<dynamic>(
        builder: (context) => _i14.AbsenPulangView(
            key: args.key,
            selectedDate: args.selectedDate,
            userAccount: args.userAccount,
            datum: args.datum),
        settings: data,
      );
    },
    _i15.AbsenDetailView: (data) {
      final args = data.getArgs<AbsenDetailViewArguments>(nullOk: false);
      return _i16.MaterialPageRoute<dynamic>(
        builder: (context) => _i15.AbsenDetailView(
            key: args.key,
            datum: args.datum,
            isDetailMasuk: args.isDetailMasuk),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;

  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class HomeViewArguments {
  const HomeViewArguments({
    this.key,
    required this.currentUser,
  });

  final _i16.Key? key;

  final _i17.GoogleSignInAccount? currentUser;

  @override
  String toString() {
    return '{"key": "$key", "currentUser": "$currentUser"}';
  }

  @override
  bool operator ==(covariant HomeViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.currentUser == currentUser;
  }

  @override
  int get hashCode {
    return key.hashCode ^ currentUser.hashCode;
  }
}

class AbsenViewArguments {
  const AbsenViewArguments({
    this.key,
    required this.userAccount,
  });

  final _i16.Key? key;

  final _i17.GoogleSignInAccount userAccount;

  @override
  String toString() {
    return '{"key": "$key", "userAccount": "$userAccount"}';
  }

  @override
  bool operator ==(covariant AbsenViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.userAccount == userAccount;
  }

  @override
  int get hashCode {
    return key.hashCode ^ userAccount.hashCode;
  }
}

class SettingsViewArguments {
  const SettingsViewArguments({
    this.key,
    required this.currentUser,
  });

  final _i16.Key? key;

  final _i17.GoogleSignInAccount? currentUser;

  @override
  String toString() {
    return '{"key": "$key", "currentUser": "$currentUser"}';
  }

  @override
  bool operator ==(covariant SettingsViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.currentUser == currentUser;
  }

  @override
  int get hashCode {
    return key.hashCode ^ currentUser.hashCode;
  }
}

class StrapiLoginViewArguments {
  const StrapiLoginViewArguments({
    this.key,
    required this.currentUser,
  });

  final _i16.Key? key;

  final _i17.GoogleSignInAccount? currentUser;

  @override
  String toString() {
    return '{"key": "$key", "currentUser": "$currentUser"}';
  }

  @override
  bool operator ==(covariant StrapiLoginViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.currentUser == currentUser;
  }

  @override
  int get hashCode {
    return key.hashCode ^ currentUser.hashCode;
  }
}

class AbsenSelfieViewArguments {
  const AbsenSelfieViewArguments({
    this.key,
    required this.selectedDatetime,
    required this.userAccount,
    this.datum,
    required this.isCheckIn,
  });

  final _i16.Key? key;

  final DateTime selectedDatetime;

  final _i17.GoogleSignInAccount userAccount;

  final _i18.Datum? datum;

  final bool isCheckIn;

  @override
  String toString() {
    return '{"key": "$key", "selectedDatetime": "$selectedDatetime", "userAccount": "$userAccount", "datum": "$datum", "isCheckIn": "$isCheckIn"}';
  }

  @override
  bool operator ==(covariant AbsenSelfieViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key &&
        other.selectedDatetime == selectedDatetime &&
        other.userAccount == userAccount &&
        other.datum == datum &&
        other.isCheckIn == isCheckIn;
  }

  @override
  int get hashCode {
    return key.hashCode ^
        selectedDatetime.hashCode ^
        userAccount.hashCode ^
        datum.hashCode ^
        isCheckIn.hashCode;
  }
}

class AbsenMasukViewArguments {
  const AbsenMasukViewArguments({
    this.key,
    required this.selectedDate,
    required this.userAccount,
  });

  final _i16.Key? key;

  final DateTime selectedDate;

  final _i17.GoogleSignInAccount userAccount;

  @override
  String toString() {
    return '{"key": "$key", "selectedDate": "$selectedDate", "userAccount": "$userAccount"}';
  }

  @override
  bool operator ==(covariant AbsenMasukViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key &&
        other.selectedDate == selectedDate &&
        other.userAccount == userAccount;
  }

  @override
  int get hashCode {
    return key.hashCode ^ selectedDate.hashCode ^ userAccount.hashCode;
  }
}

class AbsenPulangViewArguments {
  const AbsenPulangViewArguments({
    this.key,
    required this.selectedDate,
    required this.userAccount,
    required this.datum,
  });

  final _i16.Key? key;

  final DateTime selectedDate;

  final _i17.GoogleSignInAccount userAccount;

  final _i18.Datum datum;

  @override
  String toString() {
    return '{"key": "$key", "selectedDate": "$selectedDate", "userAccount": "$userAccount", "datum": "$datum"}';
  }

  @override
  bool operator ==(covariant AbsenPulangViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key &&
        other.selectedDate == selectedDate &&
        other.userAccount == userAccount &&
        other.datum == datum;
  }

  @override
  int get hashCode {
    return key.hashCode ^
        selectedDate.hashCode ^
        userAccount.hashCode ^
        datum.hashCode;
  }
}

class AbsenDetailViewArguments {
  const AbsenDetailViewArguments({
    this.key,
    required this.datum,
    required this.isDetailMasuk,
  });

  final _i16.Key? key;

  final _i18.Datum datum;

  final bool isDetailMasuk;

  @override
  String toString() {
    return '{"key": "$key", "datum": "$datum", "isDetailMasuk": "$isDetailMasuk"}';
  }

  @override
  bool operator ==(covariant AbsenDetailViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key &&
        other.datum == datum &&
        other.isDetailMasuk == isDetailMasuk;
  }

  @override
  int get hashCode {
    return key.hashCode ^ datum.hashCode ^ isDetailMasuk.hashCode;
  }
}

extension NavigatorStateExtension on _i19.NavigationService {
  Future<dynamic> navigateToLoginView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.loginView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToHomeView({
    _i16.Key? key,
    required _i17.GoogleSignInAccount? currentUser,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.homeView,
        arguments: HomeViewArguments(key: key, currentUser: currentUser),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToYaumiView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.yaumiView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAbsenView({
    _i16.Key? key,
    required _i17.GoogleSignInAccount userAccount,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.absenView,
        arguments: AbsenViewArguments(key: key, userAccount: userAccount),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToGroupsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.groupsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSettingsView({
    _i16.Key? key,
    required _i17.GoogleSignInAccount? currentUser,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.settingsView,
        arguments: SettingsViewArguments(key: key, currentUser: currentUser),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToStrapiLoginView({
    _i16.Key? key,
    required _i17.GoogleSignInAccount? currentUser,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.strapiLoginView,
        arguments: StrapiLoginViewArguments(key: key, currentUser: currentUser),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToYaumiLogView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.yaumiLogView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAbsenSelfieView({
    _i16.Key? key,
    required DateTime selectedDatetime,
    required _i17.GoogleSignInAccount userAccount,
    _i18.Datum? datum,
    required bool isCheckIn,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.absenSelfieView,
        arguments: AbsenSelfieViewArguments(
            key: key,
            selectedDatetime: selectedDatetime,
            userAccount: userAccount,
            datum: datum,
            isCheckIn: isCheckIn),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAbsenIjinCutiView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.absenIjinCutiView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAbsenMasukView({
    _i16.Key? key,
    required DateTime selectedDate,
    required _i17.GoogleSignInAccount userAccount,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.absenMasukView,
        arguments: AbsenMasukViewArguments(
            key: key, selectedDate: selectedDate, userAccount: userAccount),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAbsenPulangView({
    _i16.Key? key,
    required DateTime selectedDate,
    required _i17.GoogleSignInAccount userAccount,
    required _i18.Datum datum,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.absenPulangView,
        arguments: AbsenPulangViewArguments(
            key: key,
            selectedDate: selectedDate,
            userAccount: userAccount,
            datum: datum),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAbsenDetailView({
    _i16.Key? key,
    required _i18.Datum datum,
    required bool isDetailMasuk,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.absenDetailView,
        arguments: AbsenDetailViewArguments(
            key: key, datum: datum, isDetailMasuk: isDetailMasuk),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithLoginView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.loginView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithHomeView({
    _i16.Key? key,
    required _i17.GoogleSignInAccount? currentUser,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.homeView,
        arguments: HomeViewArguments(key: key, currentUser: currentUser),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithYaumiView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.yaumiView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithAbsenView({
    _i16.Key? key,
    required _i17.GoogleSignInAccount userAccount,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.absenView,
        arguments: AbsenViewArguments(key: key, userAccount: userAccount),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithGroupsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.groupsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSettingsView({
    _i16.Key? key,
    required _i17.GoogleSignInAccount? currentUser,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.settingsView,
        arguments: SettingsViewArguments(key: key, currentUser: currentUser),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithStrapiLoginView({
    _i16.Key? key,
    required _i17.GoogleSignInAccount? currentUser,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.strapiLoginView,
        arguments: StrapiLoginViewArguments(key: key, currentUser: currentUser),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithYaumiLogView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.yaumiLogView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithAbsenSelfieView({
    _i16.Key? key,
    required DateTime selectedDatetime,
    required _i17.GoogleSignInAccount userAccount,
    _i18.Datum? datum,
    required bool isCheckIn,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.absenSelfieView,
        arguments: AbsenSelfieViewArguments(
            key: key,
            selectedDatetime: selectedDatetime,
            userAccount: userAccount,
            datum: datum,
            isCheckIn: isCheckIn),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithAbsenIjinCutiView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.absenIjinCutiView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithAbsenMasukView({
    _i16.Key? key,
    required DateTime selectedDate,
    required _i17.GoogleSignInAccount userAccount,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.absenMasukView,
        arguments: AbsenMasukViewArguments(
            key: key, selectedDate: selectedDate, userAccount: userAccount),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithAbsenPulangView({
    _i16.Key? key,
    required DateTime selectedDate,
    required _i17.GoogleSignInAccount userAccount,
    required _i18.Datum datum,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.absenPulangView,
        arguments: AbsenPulangViewArguments(
            key: key,
            selectedDate: selectedDate,
            userAccount: userAccount,
            datum: datum),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithAbsenDetailView({
    _i16.Key? key,
    required _i18.Datum datum,
    required bool isDetailMasuk,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.absenDetailView,
        arguments: AbsenDetailViewArguments(
            key: key, datum: datum, isDetailMasuk: isDetailMasuk),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
