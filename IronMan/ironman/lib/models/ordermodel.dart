class Ordermodel {
  Ordermodel(
      {required this.cost,
      required this.item,
      required this.qty,
      required this.service,
      required this.orderNumber});
  String item, service, cost, orderNumber;
  int qty;
}
