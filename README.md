# call
<div align="center">
    <a href="https://space.bilibili.com/264346349">
        <img src="https://img.shields.io/badge/bilibili-魔咔啦咔-blueviolet" alt="😭" />
    </a>
    <a href="https://github.com/ggdream/call">
        <img src="https://img.shields.io/badge/GitHub-魔咔啦咔-ff69b4" alt="😭" />
    </a>
</div>
<div align="center">
    <img src="https://img.shields.io/badge/Platforms-Windows,Linux,MacOS-009688" alt="😭" />
    <img src="https://img.shields.io/badge/Mode-Debug,Release-3949ab" alt="😭" />
</div>

You can use the package to open the dylib defined in the `assets` field of `pubsepc.yaml`.
<br/>
<br/>
<br/>


## 1.Prepare your dynamic link library
- Write your C-code
```c
// file: ${PROJECT_ROOT}/assets/main.c

int add(int a, int b) {
  return a + b;
}
```

- Compile it to a dylib
```sh
gcc -shared -fPIC -o libadd.so main.c           # Linux
gcc -shared -fPIC -o libadd.dll main.c          # Windows
clang -shared -fPIC -o libadd.dylib main.c      # MacOS

# file: ${PROJECT_ROOT}/assets/libadd.dll
```

## 2. Declare the assets path
You should declare path of the dylib in the `pubspec.yaml` file as images.
~~~yaml
flutter:
  assets:
    - assets/libadd.dll # Fill it in according to your storage location
~~~

## 3. Write flutter core code to call native function.
~~~dart
import 'package:flutter/material.dart';

import 'dart:ffi' as ffi;
import 'package:call/call.dart';

typedef FuncNative = ffi.Int32 Function(ffi.Int32, ffi.Int32);
typedef FuncDart = int Function(int, int);



void main() => runApp(App());

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    var dll = getDyLibModule('assets/libadd.dll');     // use it as images.
    var add = dll.lookupFunction<FuncNative, FuncDart>('add');

    return Text(
             add(999, 54639).toString(),
             textDirection: TextDirection.ltr
          );
  }
}
~~~

## 4. Run the flutter application

Finally, You can see the number `55638` in the top left corner of the application.
