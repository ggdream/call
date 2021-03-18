# call

You can use the package to open the dylib defined in the `assets` field of `pubsepc.yaml`.
Support:
> Platforms: Windows, Linux, MacOS. 

> Mode: Debug and Release.

(PS: Android and IOS don't need this to easily call native libraries)

[Click me to lookup the whole doc on GitHub.](https://github.com/ggdream/call/blob/main/README.md)


## First
Write your C-code, and compile it to a dylib.
Example:
```sh
gcc -shared -fPIC -o libadd.dll main.c
```
![](doc/cc.png)

## Second
You should declare path of the dylib in the `pubspec.yaml` file as images.

## Third
Let's write some easy flutter code to test it.
![](doc/flutter.png)

## Fourth
I use the Windows OS now, and run the app by `flutter run -d Windows`.
![](doc/result.png)

Finally, you can see the number, 100!!!
