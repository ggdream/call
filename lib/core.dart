import 'dart:io' show Directory;
import 'package:path/path.dart' show join;

import 'env.dart';

abstract class TargetPath {
  String getDebugPath();
  String getReleasePath() =>
      join(Directory.current.path, 'data', 'flutter_assets');
  String getCurrentPath() => isProduct() ? getReleasePath() : getDebugPath();
}

class Windows extends TargetPath {
  @override
  String getDebugPath() => join(Directory.current.path,
      'build\\windows\\runner\\Debug', 'data', 'flutter_assets');
}

class Linux extends TargetPath {
  @override
  String getDebugPath() => join(Directory.current.path,
      'build/linux/debug/bundle', 'data', 'flutter_assets');
}

class Macos extends TargetPath {
  @Deprecated(
      "I'm sorry that i doesn't have a Mac, so doesn't know the path relationship in debug mode")
  @override
  String getDebugPath() {
    throw UnimplementedError();
  }
}
