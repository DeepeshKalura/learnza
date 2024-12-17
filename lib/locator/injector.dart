import 'package:get_it/get_it.dart';
import 'service_locator.dart' as service_locator;
import 'about_software_locator.dart' as about_software_locator;
import 'provider_locator.dart' as provider_locator;

GetIt injector = GetIt.instance;

Future<void> init() async {
  service_locator.setup(injector);
  about_software_locator.setup(injector);
  provider_locator.setup(injector);
}
