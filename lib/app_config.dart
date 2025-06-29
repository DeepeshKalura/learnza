// import 'model/app_enums.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../utils/logger.dart'; // Import the new logger

class AppConfig {
  late String githubToken;

  late String repoUrl;

  late PackageInfo packageInfo;

  late String sentryDnsUrl;

  late String githubOwner;
  late String githubRepo;

  Future<void> setup() async {
    log.i("Setting up AppConfig...");
    await dotenv.load(fileName: ".env");
    githubToken = dotenv.get('GITHUB_TOKEN');
    final githubBaseUrl = dotenv.get('GITHUB_BASE_URL');

    repoUrl = "https://x-access-token:$githubToken@$githubBaseUrl";

    // Parse owner and repo from the base URL
    final urlParts = githubBaseUrl.split('/');
    if (urlParts.length < 3) {
      throw Exception(
          'Invalid GITHUB_BASE_URL format in .env file. Expected "github.com/owner/repo".');
    }
    githubOwner = urlParts[1];
    githubRepo = urlParts[2];

    packageInfo = await PackageInfo.fromPlatform();

    sentryDnsUrl = dotenv.get('SENTRY_DNS_URL');
    log.i("AppConfig setup complete.");
  }
}
