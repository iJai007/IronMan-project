class Ordermodel {
  Ordermodel(
      {required this.cost,
      required this.orderNumber,
      required this.orderStatus,
      required this.service,
      required this.id,
      required this.lat,
      required this.lon});
  String orderNumber, orderStatus, id;
  Map<String, Map<String, dynamic>> service;
  String cost, lat, lon;
  factory Ordermodel.fromJson(Map<String, dynamic> json) {
    return Ordermodel(
        id: json['UserID'] as String,
        cost: json['Cost'] as String,
        orderNumber: json['orderNumber'] as String,
        orderStatus: json['OrderStatus'] as String,
        service: Map<String, Map<String, dynamic>>.from(json['Services']),
        lat: json['Lat'] as String,
        lon: json['Lon'] as String);
  }
}
