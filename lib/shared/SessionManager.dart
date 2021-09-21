part of 'shared.dart';

abstract class RuleUtils {
  void savePreference(
    bool status,
    String key,
    String email,
    String _token,
  );
  void saveandroid_id(
    String android_id,
  );
  void refreshToken(String token);

  Future getPreference();
  Future getandroid_id();
}

class SessionManager implements RuleUtils {
  String key, email, android_id,_token;
  bool status;
  int iduser_register;

  @override
  void savePreference(
    bool status,
    String key,
    String email,
    String _token,
  ) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool("status", status);
    sharedPreferences.setString("key", key);
    sharedPreferences.setString("email", email);
    sharedPreferences.setString("_token", _token);
    sharedPreferences.commit();
  }

  @override
  void saveandroid_id(
    String android_id,
  ) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("android_id", android_id);
    sharedPreferences.commit();
  }

  @override
  Future getandroid_id() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    android_id = sharedPreferences.get("android_id");

    sharedPreferences.commit();
    return android_id;
  }

  @override
  Future getPreference() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    status = sharedPreferences.getBool("status");
    email = sharedPreferences.get("email");
    key = sharedPreferences.get("key");
    _token = sharedPreferences.get("_token");

    sharedPreferences.commit();
    return email;
  }

  @override
  void refreshToken(String token) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("token", token);
    sharedPreferences.commit();
  }
}
