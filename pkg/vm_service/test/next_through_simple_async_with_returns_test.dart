// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:io';

import 'common/test_helper.dart';
import 'common/service_test_common.dart';

// AUTOGENERATED START
//
// Update these constants by running:
//
// dart pkg/vm_service/test/update_line_numbers.dart <test.dart>
//
const LINE_A = 21;
// AUTOGENERATED END

const file = 'next_through_simple_async_with_returns_test.dart';

Future<int?> code() /* LINE_A */ async {
  final f = File(Platform.script.toFilePath());
  final exists = await f.exists();
  if (exists) {
    return 42;
  }
  foo();
  return null;
}

void foo() {
  print('Hello from Foo!');
}

final stops = <String>[];
const expected = <String>[
  '$file:${LINE_A + 0}:18', // on '(' in 'code()'
  '$file:${LINE_A + 1}:27', // on 'script'
  '$file:${LINE_A + 1}:34', // on 'toFilePath'
  '$file:${LINE_A + 1}:13', // on 'File'
  '$file:${LINE_A + 2}:26', // on 'exists'
  '$file:${LINE_A + 2}:18', // on 'await'
  '$file:${LINE_A + 4}:5', // on 'return'
];

final tests = <IsolateTest>[
  hasPausedAtStart,
  setBreakpointAtLine(LINE_A),
  runStepThroughProgramRecordingStops(stops),
  checkRecordedStops(stops, expected),
];

void main([args = const <String>[]]) => runIsolateTests(
      args,
      tests,
      'next_through_simple_async_with_returns_test.dart',
      testeeConcurrent: code,
      pause_on_start: true,
      pause_on_exit: true,
    );
