// lib/core/navigation/navigation_helper.dart

class NavigationHelper {
  static final NavigationHelper _instance = NavigationHelper._internal();
  factory NavigationHelper() => _instance;
  NavigationHelper._internal();

  // Callback to switch tabs in RootPage
  Function(int)? _switchTabCallback;

  void registerTabSwitcher(Function(int) callback) {
    _switchTabCallback = callback;
  }

  void switchToTab(int index) {
    _switchTabCallback?.call(index);
  }

  void unregisterTabSwitcher() {
    _switchTabCallback = null;
  }
}
