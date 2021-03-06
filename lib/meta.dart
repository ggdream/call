import 'dart:io' show Platform;
import 'package:path/path.dart' show dirname, join;

import 'env.dart';



abstract class Meta {
  String getDebugPath();
  String getReleasePath();
  String getCurrentPath();
}

class Windows implements Meta {
  static const String assets = 'data\\flutter_assets';

  @override
  String getDebugPath() => join(
      dirname(Platform.script.toFilePath(windows: true)),
      'build\\windows\\runner\\Debug',
      assets);

  @override
  String getReleasePath() =>
      join(dirname(Platform.script.toFilePath(windows: true)), assets);

  @override 
  String getCurrentPath() => isProduct() ? getReleasePath() : getDebugPath();
}

class Linux implements Meta {
  @override
  String getDebugPath() {
    // TODO: implement getDebugPath
    throw UnimplementedError();
  }

  @override
  String getReleasePath() {
    // TODO: implement getReleasePath
    throw UnimplementedError();
  }

  @override
  String getCurrentPath() {
    // TODO: implement getCurrentPath
    throw UnimplementedError();
  }
}

class Macos implements Meta {
  @override
  String getDebugPath() {
    // TODO: implement getDebugPath
    throw UnimplementedError();
  }

  @override
  String getReleasePath() {
    // TODO: implement getReleasePath
    throw UnimplementedError();
  }

  @override
  String getCurrentPath() {
    // TODO: implement getCurrentPath
    throw UnimplementedError();
  }
}
