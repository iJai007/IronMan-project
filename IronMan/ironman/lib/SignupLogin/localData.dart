import 'package:shared_preferences/shared_preferences.dart';

class LocalData {
  Future<void> saveUserLocally(Map<String, String> userData) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('UserName', userData['UserName']!);
    await prefs.setString('Phone', userData['Phone']!);
    await prefs.setString('Address', userData['Address']!);
    await prefs.setString('Area', userData['Area']!);
    await prefs.setString('Pincode', userData['Pincode']!);
    await prefs.setString('Password', userData['Password']!);
  }

  Future<Map<String, String>> getUserData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return {
      'UserName': prefs.getString('UserName') ?? '',
      'Phone': prefs.getString('Phone') ?? '',
      'Address': prefs.getString('Address') ?? '',
      'Area': prefs.getString('Area') ?? '',
      'Pincode': prefs.getString('Pincode') ?? '',
      //'Password': prefs.getString('Password') ?? '',
    };
  }
}
