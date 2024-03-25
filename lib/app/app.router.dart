// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i10;
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart' as _i11;
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i12;
import 'package:yaumi/ui/views/absen/absen_view.dart' as _i6;
import 'package:yaumi/ui/views/groups/groups_view.dart' as _i7;
import 'package:yaumi/ui/views/home/home_view.dart' as _i3;
import 'package:yaumi/ui/views/login/login_view.dart' as _i2;
import 'package:yaumi/ui/views/settings/settings_view.dart' as _i8;
import 'package:yaumi/ui/views/startup/startup_view.dart' as _i4;
import 'package:yaumi/ui/views/strapi_login/strapi_login_view.dart' as _i9;
import 'package:yaumi/ui/views/yaumi/yaumi_view.dart' as _i5;

class Routes {
  static const loginView = '/login-view';

  static const homeView = '/home-view';

  static const startupView = '/startup-view';

  static const yaumiView = '/yaumi-view';

  static const absenView = '/absen-view';

  static const groupsView = '/groups-view';

  static const settingsView = '/settings-view';

  static const strapiLoginView = '/strapi-login-view';

  static const all = <String>{
    loginView,
    homeView,
    startupView,
    yaumiView,
    absenView,
    groupsView,
    settingsView,
    strapiLoginView,
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
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.LoginView: (data) {
      return _i10.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.LoginView(),
        settings: data,
      );
    },
    _i3.HomeView: (data) {
      final args = data.getArgs<HomeViewArguments>(nullOk: false);
      return _i10.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i3.HomeView(key: args.key, currentUser: args.currentUser),
        settings: data,
      );
    },
    _i4.StartupView: (data) {
      return _i10.MaterialPageRoute<dynamic>(
        builder: (context) => const _i4.StartupView(),
        settings: data,
      );
    },
    _i5.YaumiView: (data) {
      return _i10.MaterialPageRoute<dynamic>(
        builder: (context) => const _i5.YaumiView(),
        settings: data,
      );
    },
    _i6.AbsenView: (data) {
      return _i10.MaterialPageRoute<dynamic>(
        builder: (context) => const _i6.AbsenView(),
        settings: data,
      );
    },
    _i7.GroupsView: (data) {
      return _i10.MaterialPageRoute<dynamic>(
        builder: (context) => const _i7.GroupsView(),
        settings: data,
      );
    },
    _i8.SettingsView: (data) {
      final args = data.getArgs<SettingsViewArguments>(nullOk: false);
      return _i10.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i8.SettingsView(key: args.key, currentUser: args.currentUser),
        settings: data,
      );
    },
    _i9.StrapiLoginView: (data) {
      final args = data.getArgs<StrapiLoginViewArguments>(nullOk: false);
      return _i10.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i9.StrapiLoginView(key: args.key, currentUser: args.currentUser),
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

  final _i10.Key? key;

  final _i11.GoogleSignInAccount? currentUser;

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

class SettingsViewArguments {
  const SettingsViewArguments({
    this.key,
    required this.currentUser,
  });

  final _i10.Key? key;

  final _i11.GoogleSignInAccount? currentUser;

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

  final _i10.Key? key;

  final _i11.GoogleSignInAccount? currentUser;

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

extension NavigatorStateExtension on _i12.NavigationService {
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
    _i10.Key? key,
    required _i11.GoogleSignInAccount? currentUser,
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

  Future<dynamic> navigateToAbsenView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.absenView,
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
    _i10.Key? key,
    required _i11.GoogleSignInAccount? currentUser,
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
    _i10.Key? key,
    required _i11.GoogleSignInAccount? currentUser,
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
    _i10.Key? key,
    required _i11.GoogleSignInAccount? currentUser,
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

  Future<dynamic> replaceWithAbsenView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.absenView,
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
    _i10.Key? key,
    required _i11.GoogleSignInAccount? currentUser,
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
    _i10.Key? key,
    required _i11.GoogleSignInAccount? currentUser,
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
}
