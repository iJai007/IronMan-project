// ignore_for_file: non_constant_identifier_names

/*class Shopmodel {
  Shopmodel({
    required this.Name,
    required this.Area,
    required this.Services,
    required this.Cost,
  });
  String Name, Area;
  List<String> Services;
  Map<String, int> Cost;
}
*/
class Shopmodel {
  Shopmodel({
    required this.Name,
    required this.Area,
    required this.Services,
    required this.Cost,
  });

  String Name;
  String Area;
  List<String> Services;
  Map<String, Map<String, dynamic>> Cost;

  factory Shopmodel.fromJson(Map<String, dynamic> json) {
    return Shopmodel(
      Name: json['Name'] as String,
      Area: json['Area'] as String,
      Services: List<String>.from(json['Services']),
      Cost: Map<String, Map<String, dynamic>>.from(json['Cost']),
    );
  }
}
