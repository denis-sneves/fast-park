class Routes {
  static const String authService =
      "https://identitytoolkit.googleapis.com/v1/";

  static const String apiKey = "AIzaSyDbQsRPF2D0_OYAvS9uiZ58hlQ1dcvBb8Q";

  String signIn() {
    return "${authService}accounts:signInWithPassword?key=$apiKey";
  }

  String signUp() {
    return "${authService}accounts:signUp?key=$apiKey";
  }
}
