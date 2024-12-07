import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import 'package:learnza/locator/injector.dart' as di;
import '../../../app_config.dart';
import '../../../utils/theme.dart';

class AboutCommonScreen extends StatelessWidget {
  const AboutCommonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lernza"),
        titleTextStyle: ShadTheme.of(context).textTheme.h3,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // About Card
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "About Lernza",
                        style: ShadTheme.of(context).textTheme.h4.copyWith(
                              color: primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        "Lernza is a comprehensive educational platform designed to empower students and teachers. Our mission is to provide a one-stop solution for all educational needs, offering a diverse range of resources including books, videos, notes, and interactive learning tools.",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black87,
                          height: 1.5,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // App Details Card
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "App Details",
                        style: ShadTheme.of(context).textTheme.h4.copyWith(
                              color: primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const SizedBox(height: 12),
                      _buildDetailRow(context,
                          icon: Icons.loyalty_outlined,
                          label: "Version",
                          value: di.injector<AppConfig>().packageInfo.version),
                      const Divider(height: 20, thickness: 1),
                      _buildDetailRow(context,
                          icon: Icons.language_outlined,
                          label: "Website",
                          value: "deepeshkalura.xyz", onTap: () async {
                        final Uri uri = Uri.parse('https://deepeshkalura.xyz');
                        if (!await launchUrl(uri,
                            mode: LaunchMode.externalApplication)) {
                          ShadAlert.destructive(
                            title: const Text("Error Could not launch"),
                            description: Text("$uri"),
                          );
                        }
                      }),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailRow(
    BuildContext context, {
    required IconData icon,
    required String label,
    required String value,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Icon(icon, color: primaryColor, size: 24),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              Text(
                value,
                style: TextStyle(
                  fontSize: 14,
                  color: onTap != null ? Colors.blue : Colors.black54,
                ),
              ),
            ],
          ),
          if (onTap != null) const Spacer(),
          if (onTap != null)
            const Icon(Icons.launch, color: Colors.blue, size: 18),
        ],
      ),
    );
  }
}
