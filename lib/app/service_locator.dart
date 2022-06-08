import 'package:map_mvvm/service_locator.dart';
import 'package:superlaundry/services/laundryservice/clean_service.dart';
import 'package:superlaundry/services/laundryservice/washingmachine_service.dart';
import 'package:superlaundry/services/logout/logout_service.dart';
import 'package:superlaundry/services/orderhistory/orderhistory_service.dart';
import 'package:superlaundry/services/registration/registrationService.dart';
import 'package:superlaundry/services/registration/registration_serviceFirestore.dart';
import 'package:superlaundry/ui/screens/home_customer/mainmenu_viewmodel.dart';
import 'package:superlaundry/ui/screens/home_deliveryman/mainmenuD_viewmodel.dart';
import 'package:superlaundry/ui/screens/home_manager/mainmenuM_viewmodel.dart';
import 'package:superlaundry/ui/screens/laundry_service/cleanmethod/viewCleanMethod/cleanser_viewmodel.dart';
import 'package:superlaundry/ui/screens/laundry_service/deliverymethod/viewDeliveryMethod/deliveryser_viewmodel.dart';
import 'package:superlaundry/ui/screens/laundry_service/washingmachine/viewWashingMachine/washingmachine_viewmodel.dart';
import 'package:superlaundry/ui/screens/order_history/orderhistory_viewmodel.dart';
import 'package:superlaundry/ui/screens/order_history/vieworderhistory/vieworderhistory_viewmodel.dart';
import '../services/laundryservice/delivery_service.dart';
import '../ui/screens/home/home_viewmodel.dart';
import '../ui/screens/registration/registration_viewmodel.dart';
import 'package:superlaundry/ui/screens/login/login_viewmodel.dart';
import 'package:superlaundry/services/registration/login_service.dart';
import 'package:superlaundry/services/forgot_pass/forgot_pass_service.dart';
import '../ui/screens/forgot_pass/forgot_pass_viewmodel.dart';

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
          () => ForgotPasswordService());
      locator.registerLazySingleton<LogoutService>(() => LogoutServiceMock());
      locator.registerLazySingleton<MenuViewmodel>(() => MenuViewmodel());
      locator.registerLazySingleton<MenudViewmodel>(() => MenudViewmodel());
      locator.registerLazySingleton<MenumViewmodel>(() => MenumViewmodel());
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
    });
