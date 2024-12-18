import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../providers/state/user_preference_provider.dart';
import '../../../utils/theme.dart';

class SettingCommonScreen extends StatefulWidget {
  const SettingCommonScreen({super.key});

  @override
  State<SettingCommonScreen> createState() => _SettingCommonScreenState();
}

class _SettingCommonScreenState extends State<SettingCommonScreen> {
  // bool _notificationsEnabled = true;

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: Text(
          localizations?.settingsAppBarTitle ?? 'Settings',
          style: ShadTheme.of(context).textTheme.h3.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onSurface,
              ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Theme.of(context).colorScheme.onSurface,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Application Settings Card
              _buildSettingsCard(
                icon: LucideIcons.settings,
                title: localizations?.applicationSettingsCardTitle ??
                    'Application Settings',
                children: [
                  // TODO: Notification Settings (Future Feature) [PR#44]
                  // _buildSettingsTile(
                  //   icon: LucideIcons.bell,
                  //   title: 'Notifications',
                  //   subtitle: 'Receive updates and alerts',
                  //   trailing: Switch(
                  //     value: _notificationsEnabled,
                  //     onChanged: (bool value) {
                  //       setState(() {
                  //         _notificationsEnabled = value;
                  //       });
                  //     },
                  //     activeColor: primaryColor,
                  //   ),
                  // ),
                  _buildSettingsTile(
                    icon: LucideIcons.moon,
                    title: localizations?.darkModeTitle ?? 'Dark Mode',
                    subtitle: localizations?.darkModeSubtitle ??
                        'Toggle between light and dark themes',
                    trailing: Consumer<UserPreferenceProvider>(
                      builder: (context, userPreference, child) => Switch(
                        value: userPreference.isDarkMode,
                        onChanged: (bool value) async {
                          await userPreference.setDarkMode(value);
                        },
                        activeColor: primaryColor,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              // Language Settings Card

              Consumer<UserPreferenceProvider>(
                builder: (context, userPreference, _) => _buildSettingsCard(
                  icon: LucideIcons.languages,
                  title: localizations?.languagePreferencesCardTitle ??
                      'Language Preferences',
                  children: [
                    ...userPreference.languages.map(
                      (language) => _buildSettingsTile(
                        icon: LucideIcons.globe,
                        title: language,
                        trailing: Radio<String>(
                          value: language,
                          groupValue: userPreference.currentLanguage,
                          onChanged: (String? value) async {
                            await userPreference.setLanguage(value!);
                          },
                          activeColor: primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // Account Settings Card
              _buildSettingsCard(
                icon: LucideIcons.user,
                title: localizations?.accountCardTitle ?? 'Account',
                children: [
                  _buildSettingsTile(
                    icon: LucideIcons.logOut,
                    title: localizations?.logoutTitle ?? 'Logout',
                    subtitle: localizations?.logoutSubtitle ??
                        'Sign out of your account',
                    onTap: _showLogoutConfirmation,
                  ),
                  _buildSettingsTile(
                    icon: LucideIcons.lock,
                    title: localizations?.privacyTitle ?? 'Privacy',
                    subtitle: localizations?.privacySubtitle ??
                        'Manage your privacy settings',
                    onTap: () {
                      // TODO: Implement privacy settings navigation
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSettingsCard({
    required IconData icon,
    required String title,
    required List<Widget> children,
  }) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Icon(icon, color: primaryColor, size: 24),
                const SizedBox(width: 12),
                Text(
                  title,
                  style: ShadTheme.of(context).textTheme.h4.copyWith(
                        fontWeight: FontWeight.bold,
                        color: primaryColor,
                      ),
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          ...children,
        ],
      ),
    );
  }

  Widget _buildSettingsTile({
    required IconData icon,
    required String title,
    String? subtitle,
    Widget? trailing,
    VoidCallback? onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: primaryColor),
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
        ),
      ),
      subtitle: subtitle != null
          ? Text(
              subtitle,
              style: const TextStyle(
                color: Colors.grey,
              ),
            )
          : null,
      trailing: trailing,
      onTap: onTap,
    );
  }

  void _showLogoutConfirmation() {
    final localizations = AppLocalizations.of(context);
    showDialog(
      context: context,
      builder: (context) => ShadDialog(
        title: Text(localizations?.logoutDialogTitle ?? "Logout"),
        description: Text(localizations?.logoutDialogDescription ??
            "Are you sure you want to log out?"),
        actions: [
          ShadButton.outline(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(localizations?.cancelButton ?? "Cancel"),
          ),
          ShadButton.destructive(
            onPressed: () {
              // TODO: Implement logout logic
              Navigator.of(context).pop();
            },
            child: Text(localizations?.logoutButton ?? "Logout"),
          ),
        ],
      ),
    );
  }
}
