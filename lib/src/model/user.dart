// user.dart
class User {
  // Private constructor
  User._privateConstructor();

  // Singleton instance
  static final User _instance = User._privateConstructor();

  // Public getter to access the singleton instance
  static User get instance => _instance;

  // User properties
  String username = '';

  // Method to set user information
  void setUser(String username) {
    this.username = username;
  }
}
