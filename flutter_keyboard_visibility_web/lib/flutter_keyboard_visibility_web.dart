// Migrated from `dart:html` → `package:web` + `dart:js_interop` so dart2wasm
// compilation passes. Behavior is unchanged — the web plugin still just
// yields `false` forever because browsers don't have a soft-keyboard concept.
import 'package:flutter_keyboard_visibility_platform_interface/flutter_keyboard_visibility_platform_interface.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:web/web.dart' show Navigator, window;

/// The web implementation of the [FlutterKeyboardVisibilityPlatform] of the
/// FlutterKeyboardVisibility plugin.
class FlutterKeyboardVisibilityPluginWeb
    extends FlutterKeyboardVisibilityPlatform {
  /// Constructs a [FlutterKeyboardVisibilityPluginWeb].
  FlutterKeyboardVisibilityPluginWeb(Navigator navigator);

  /// Factory method that initializes the FlutterKeyboardVisibility plugin
  /// platform with an instance of the plugin for the web.
  static void registerWith(Registrar registrar) {
    FlutterKeyboardVisibilityPlatform.instance =
        FlutterKeyboardVisibilityPluginWeb(window.navigator);
  }

  /// Emits changes to keyboard visibility from the platform. Web is not
  /// implemented — browsers don't signal soft-keyboard show/hide.
  @override
  Stream<bool> get onChange async* {
    yield false;
  }
}
