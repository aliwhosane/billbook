class Order {
  final String orderId;
  final Object customer;
  final List products;
  final List GST;
  final String? orderTotalBeforeTax;
  final String? orderTotalAfterTax;

  const Order(
      {required this.orderId,
      required this.customer,
      required this.products,
      required this.GST,
      this.orderTotalBeforeTax,
      this.orderTotalAfterTax});
}
