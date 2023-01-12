import 'dart:io';

import 'package:path/path.dart' as p;

String fixturePath(String path) => p.join(p.current, 'test/fixtures', path);
String fixture(String path) => File(fixturePath(path)).readAsStringSync();
