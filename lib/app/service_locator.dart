import 'package:map_mvvm/service_locator.dart';
import 'package:superlaundry/services/registration/registration_service.dart';
import '../ui/screens/home/home_viewmodel.dart';
import '../ui/screens/registration/registration_viewmodel.dart';
//import '../services/services.dart';

final locator = ServiceLocator.locator;

void initializeServiceLocator() => ServiceLocator.init((locator) {
      // Services
      //locator.registerLazySingleton<CounterService>(() => CounterServiceMock());

      // Viewmodels
      locator.registerLazySingleton<HomeViewmodel>(() => HomeViewmodel());
      locator.registerLazySingleton<RegistrationViewmodel>(() => RegistrationViewmodel());
      locator.registerLazySingleton<RegistrationService>(() => RegistrationService());
    });
