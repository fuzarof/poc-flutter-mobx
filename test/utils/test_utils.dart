import 'package:flutter/material.dart';

import 'test_di.dart';

class TestUtils {
  static Future initUnitTest() async {
    setupTest();
  }

  static Future initWidgetTest() async {
    setupTest();
  }

  static Widget buildTestableWidget({required Widget widget, dynamic arguments}) => MaterialApp(
        home: widget,
      );

  static Widget buildTestableWithScaffoldWidget({
    required Widget widget,
  }) =>
      MaterialApp(
        home: Scaffold(
          body: MediaQuery(
            data: const MediaQueryData(),
            child: Directionality(
              textDirection: TextDirection.ltr,
              child: widget,
            ),
          ),
        ),
      );
}
