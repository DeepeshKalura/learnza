import 'package:get_it/get_it.dart';
import 'service_locator.dart' as service_locator;
// import 'provider_locator.dart' as provider_locator;

GetIt injector = GetIt.instance;

Future<void> init() async {
  service_locator.setup(injector);
  // provider_locator.setup(injector);
}
