// import 'model/app_enums.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AppConfig {
  late String githubToken;

  late String repoUrl;

  late PackageInfo packageInfo;

  late String sentryDnsUrl;

  Future<void> setup() async {
    await dotenv.load(fileName: ".env");
    githubToken = dotenv.get('GITHUB_TOKEN');
    final githubBaseUrl = dotenv.get('GITHUB_BASE_URL');

    repoUrl = "https://x-access-token:$githubToken@$githubBaseUrl";

    packageInfo = await PackageInfo.fromPlatform();

    sentryDnsUrl = dotenv.get('SENTRY_DNS_URL');
  }
}
