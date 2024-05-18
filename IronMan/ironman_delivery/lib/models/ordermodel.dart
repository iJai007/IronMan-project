class Ordermodel {
  Ordermodel(
      {required this.cost,
      required this.orderNumber,
      required this.orderStatus,
      required this.service,
      required this.id});
  String orderNumber, orderStatus, id;
  Map<String, Map<String, dynamic>> service;
  String cost;
  factory Ordermodel.fromJson(Map<String, dynamic> json) {
    return Ordermodel(
      id: json['UserID'] as String,
      cost: json['Cost'] as String,
      orderNumber: json['orderNumber'] as String,
      orderStatus: json['OrderStatus'] as String,
      service: Map<String, Map<String, dynamic>>.from(json['Services']),
    );
  }
}
