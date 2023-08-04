import 'package:shared_preferences/shared_preferences.dart';

void saveData(
  String lati,
  String longi,
  String location,
  String place,
  String login_id,
) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('lati', lati);
  prefs.setString('longi', longi);
  prefs.setString('location', location);
  prefs.setString('place', place);
  prefs.setString('login_id', login_id);
}

Future<Map<String, String?>> getCred() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? lati = prefs.getString('lati');
  String? longi = prefs.getString('longi');
  String? location = prefs.getString('location');
  String? place = prefs.getString('place');
  String? login_id = prefs.getString('login_id');
  return {
    'lati': lati,
    'longi': longi,
    'location': location,
    'place': place,
    'login_id': login_id
  };
}

void saveLogin(
  String login_id,
) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  prefs.setString('login_id', login_id);
}

Future<String?> getLogin() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  String? login_id = prefs.getString('login_id');
  return login_id;
}

// Future<void> saveData(String logid) async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   await prefs.setString('lid', logid);
// }
//
// Future<String?> getSavedData() async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   String? lid = prefs.getString('lid') ?? '';
//   return lid;
// }
class SharedPreferencesHelper {
  static const String loginIdKey = 'loginId';

  static Future<void> saveData(String loginId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(loginIdKey, loginId);
  }

  static Future<String> getSavedData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(loginIdKey) ?? '';
  }

  static Future<void> clearData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(loginIdKey);
  }
}

class SharedPreferencesHelper_service {
  static const String serviceKey = 'service';

  static Future<void> saveData(String service) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(serviceKey, service);
  }

  static Future<String> getSavedData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(serviceKey) ?? '';
  }

  static Future<void> clearData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(serviceKey);
  }
}

class SharedPreferencesHelper_WSname {
  static const String WSname = 'name';

  static Future<void> saveData(String name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(WSname, name);
  }

  static Future<String> getSavedData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(WSname) ?? '';
  }

  static Future<void> clearData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(WSname);
  }
}
