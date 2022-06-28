import 'orders.dart';

class Invoice {
  final InvoiceInfo info;
  final OrdersModel ordersModel;
  final List<InvoiceItem> items;

  const Invoice({
    required this.info,
    required this.ordersModel,
    required this.items,
  });
}

class InvoiceInfo {
  final String description;
  final String number;
  final DateTime date;
  final String paymentMethod;
  final String orderDate;
  final String orderTime;

  const InvoiceInfo(
      {required this.description,
      required this.number,
      required this.date,
      required this.paymentMethod,
      required this.orderDate,
      required this.orderTime});
}

class InvoiceItem {
  final String deliveryMethod;
  final String cleanMethod;
  final String weight;
  final String waterTemperature;
  final double totalPrice;

  const InvoiceItem({
    required this.deliveryMethod,
    required this.cleanMethod,
    required this.weight,
    required this.waterTemperature,
    required this.totalPrice,
  });
}
