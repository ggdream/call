import 'dart:ffi' as ffi;
import 'dart:io' show Platform;
import 'package:path/path.dart' show join;

import 'meta.dart';


ffi.DynamicLibrary getDyLibModule(String module) {
  String path = '';
  if (Platform.isWindows) {
    path = Windows().getCurrentPath();
  } else {
    throw 'the platform is not supported';
  }

  return ffi.DynamicLibrary.open(join(path, module));
}
