// ignore_for_file: non_constant_identifier_names, unused_element

import 'current_status.dart';

class CurrStatusViewmodel extends Viewmodel {
  CurrStatusService get _CurrStatusService => locator<CurrStatusService>();

  Stream<List<OrdersModel>> readStatus() {
    return _CurrStatusService.readStatus();
  }
}
