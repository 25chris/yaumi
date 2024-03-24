import 'package:flutter_test/flutter_test.dart';
import 'package:yaumi/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('FardhuDialogModel Tests -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}