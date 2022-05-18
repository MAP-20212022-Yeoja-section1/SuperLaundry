import 'package:map_mvvm/service_locator.dart';
import 'package:superlaundry/services/logout/logout_service.dart';
import 'package:superlaundry/services/registration/registration_service.dart';
import 'package:superlaundry/ui/screens/home_customer/mainmenu_app_bar.dart';
import 'package:superlaundry/ui/screens/home_customer/mainmenu_viewmodel.dart';
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
      locator.registerLazySingleton<RegistrationService>(
          () => RegistrationService());
      locator.registerLazySingleton<LoginViewModel>(() => LoginViewModel());
      locator.registerLazySingleton<LoginService>(() => LoginService());
      locator.registerLazySingleton<ForgotPassViewmodel>(
          () => ForgotPassViewmodel());
      locator.registerLazySingleton<ForgotPasswordService>(
          () => ForgotPasswordService());
      locator.registerLazySingleton<LogoutService>(
          () => LogoutService());
      locator.registerLazySingleton<MenuViewmodel>(
          () => MenuViewmodel());
    });
