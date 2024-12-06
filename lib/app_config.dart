// import 'model/app_enums.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConfig {
  late String githubToken;

  late String repoUrl;

  Future<void> setup() async {
    await dotenv.load(fileName: ".env");
    githubToken = dotenv.get('GITHUB_TOKEN');
    final githubBaseUrl = dotenv.get('GITHUB_BASE_URL');

    repoUrl = "https://x-access-token:$githubToken@$githubBaseUrl";
  }
}
