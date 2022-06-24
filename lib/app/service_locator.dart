import 'package:map_mvvm/service_locator.dart';
import 'package:superlaundry/services/deliOrder/deliOrder_service.dart';
import 'package:superlaundry/services/deliOrder/deliOrder_service_mock.dart';
import 'package:superlaundry/services/deliveryOrderService/delivery_order_service.dart';
import 'package:superlaundry/services/deliveryOrderService/delivery_order_service_FB.dart';
import 'package:superlaundry/services/forgot_pass/forgot_pass_serviceFB.dart';
import 'package:superlaundry/services/laundryservice/clean_service_mock.dart';
import 'package:superlaundry/services/laundryservice/washing_machine_service_mock.dart';
import 'package:superlaundry/services/logout/logout_service_mock.dart';
import 'package:superlaundry/services/manage_order/manage_order_service.dart';
import 'package:superlaundry/services/manage_order/manage_order_service_FB.dart';
import 'package:superlaundry/services/orderhistory/orderhistory_service.dart';
import 'package:superlaundry/services/profile_edit/profile_service_mock.dart';
import 'package:superlaundry/services/registration/registrationService.dart';
import 'package:superlaundry/services/registration/registration_serviceFirestore.dart';
import 'package:superlaundry/services/reportService/report_service_FB.dart';
import 'package:superlaundry/ui/screens/deli_get_order/deli_get_order_viewmodel.dart';
import 'package:superlaundry/ui/screens/deliveryOrder/delivery_order_viewmodel.dart';
import 'package:superlaundry/ui/screens/home_customer/mainmenu_viewmodel.dart';
import 'package:superlaundry/ui/screens/home_deliveryman/mainmenuD_viewmodel.dart';
import 'package:superlaundry/ui/screens/home_manager/mainmenuM_viewmodel.dart';
import 'package:superlaundry/ui/screens/laundry_service/cleanmethod/viewCleanMethod/cleanser_viewmodel.dart';
import 'package:superlaundry/ui/screens/laundry_service/deliverymethod/viewDeliveryMethod/deliveryser_viewmodel.dart';
import 'package:superlaundry/ui/screens/laundry_service/washingmachine/viewWashingMachine/washingmachine_viewmodel.dart';
import 'package:superlaundry/ui/screens/manage_order/manageorder_viewmodel.dart';
import 'package:superlaundry/ui/screens/order_history/orderhistory_viewmodel.dart';
import '../services/laundryservice/clean_service.dart';
import '../services/laundryservice/delivery_service.dart';
import '../services/laundryservice/delivery_service_mock.dart';
import '../services/laundryservice/washing_machine_service.dart';
import '../services/logout/logout_service.dart';
import '../services/reportService/report_service.dart';
import '../ui/screens/home/home_viewmodel.dart';
import '../ui/screens/registration/registration_viewmodel.dart';
import 'package:superlaundry/ui/screens/login/login_viewmodel.dart';
import 'package:superlaundry/services/registration/login_service.dart';
import 'package:superlaundry/services/forgot_pass/forgot_pass_service.dart';
import '../ui/screens/forgot_pass/forgot_pass_viewmodel.dart';
import '../ui/screens/add_order/add_order_viewmodel.dart';
import 'package:superlaundry/services/add_order/add_order_service.dart';
import 'package:superlaundry/services/add_order/add_order_serviceFB.dart';
import '../ui/screens/editProfile/profile_viewmodel.dart';
import 'package:superlaundry/services/profile_edit/profile_service.dart';
import '../ui/screens/change_status/change_status_viewmodel.dart';
import 'package:superlaundry/services/change_status/change_status_service.dart';
import 'package:superlaundry/services/change_status/change_status_serviceFB.dart';
import '../ui/screens/cust_review/cust_review_viewmodel.dart';
import 'package:superlaundry/services/cust_review/cust_review_service.dart';
import 'package:superlaundry/services/cust_review/cust_review_serviceFB.dart';

import '../ui/screens/viewReport/view_report_viewmodel.dart';

//import '../services/services.dart';

final locator = ServiceLocator.locator;

void initializeServiceLocator() => ServiceLocator.init((locator) {
      // Services
      //locator.registerLazySingleton<CounterService>(() => CounterServiceMock());

      // Viewmodels
      locator.registerLazySingleton<HomeViewmodel>(() => HomeViewmodel());
      locator.registerLazySingleton<RegistrationViewmodel>(
          () => RegistrationViewmodel());
      locator.registerLazySingleton<RegisterationService>(
          () => RegistrationServiceWithFirestore());
      locator.registerLazySingleton<LoginViewModel>(() => LoginViewModel());
      locator.registerLazySingleton<LoginService>(() => LoginService());
      locator.registerLazySingleton<ForgotPassViewmodel>(
          () => ForgotPassViewmodel());
      locator.registerLazySingleton<ForgotPasswordService>(
          () => ForgotPasswordServicewithFirebase());
      locator.registerLazySingleton<LogoutService>(() => LogoutServiceMock());
      locator.registerLazySingleton<MenuViewmodel>(() => MenuViewmodel());
      locator.registerLazySingleton<MenudViewmodel>(() => MenudViewmodel());
      locator.registerLazySingleton<MenumViewmodel>(() => MenumViewmodel());
      locator.registerLazySingleton<ProfileViewmodel>(() => ProfileViewmodel());
      locator.registerLazySingleton<ProfileService>(() => ProfileServiceMock());
      // locator.registerLazySingleton<DeliOrderService>(() => DeliOrderService());
      locator.registerLazySingleton<deliOrderViewmodel>(
          () => deliOrderViewmodel());
      locator.registerLazySingleton<CleanViewmodel>(() => CleanViewmodel());
      locator.registerLazySingleton<CleanManagementService>(
          () => CleanManagementServiceMock());
      locator
          .registerLazySingleton<DeliveryViewmodel>(() => DeliveryViewmodel());
      locator.registerLazySingleton<DeliveryManagementService>(
          () => DeliveryManagementServiceMock());
      locator.registerLazySingleton<WashingMachineViewmodel>(
          () => WashingMachineViewmodel());
      locator.registerLazySingleton<WashingMachineManagementService>(
          () => WashingMachineManagementServiceMock());
      locator.registerLazySingleton<OrderHistoryService>(
          () => OrderHistoryServiceMock());
      // locator.registerLazySingleton<ViewOrderHistoryViewModel>(
      //     () => ViewOrderHistoryViewModel());
      locator.registerLazySingleton<OrderHistoryViewModel>(
          () => OrderHistoryViewModel());
      locator
          .registerLazySingleton<AddOrderViewmodel>(() => AddOrderViewmodel());
      locator.registerLazySingleton<AddOrderService>(
          () => AddOrderServiceWithFireBase());
      locator.registerLazySingleton<DeliveryOrderViewmodel>(
          () => DeliveryOrderViewmodel());
      locator.registerLazySingleton<DeliveryOrderManagementService>(
          () => DeliveryOrderManagementServiceFB());
      locator.registerLazySingleton<DeliOrderService>(
          () => DeliOrderServiceMock());
      locator.registerLazySingleton<ChangeStatusViewmodel>(
          () => ChangeStatusViewmodel());
      locator.registerLazySingleton<ChangeStatusService>(
          () => ChangeStatusServiceWithFireBase());
      locator.registerLazySingleton<ManageOrderService>(
          () => ManageOrderServiceMock());
      locator.registerLazySingleton<ManageOrderViewModel>(
          () => ManageOrderViewModel());
      locator.registerLazySingleton<CustReviewViewmodel>(
          () => CustReviewViewmodel());
      locator.registerLazySingleton<CustReviewService>(
          () => CustReviewServiceWithFireBase());
      locator.registerLazySingleton<ReportViewmodel>(
          () => ReportViewmodel());
      locator.registerLazySingleton<ReportService>(
          () => ReportServiceWithFirestore());
    });
