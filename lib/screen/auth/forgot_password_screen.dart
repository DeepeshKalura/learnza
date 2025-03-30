import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../gen/assets.gen.dart';
import '../../providers/auth_provider.dart';
import '../../utils/form_validator.dart';
import '../../utils/theme.dart';

class ForgotPasswordAuthScreen extends StatefulWidget {
  const ForgotPasswordAuthScreen({super.key});

  @override
  State<ForgotPasswordAuthScreen> createState() =>
      _ForgotPasswordAuthScreenState();
}

class _ForgotPasswordAuthScreenState extends State<ForgotPasswordAuthScreen> {
  final _emailController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
  }

  Future<void> _handlePasswordReset() async {
    if (FormValidator.validateEmail(_emailController.text) != null) {
      ShadToaster.of(context).show(
        ShadToast.destructive(
          title: Text(
            AppLocalizations.of(context)?.emailRequired ??
                'Valid Email is required',
          ),
          description: Text(
            AppLocalizations.of(context)?.emailRequiredDescription ??
                'Please enter your email',
          ),
        ),
      );
      return;
    }
    await context.read<AuthProvider>().forgotPassword(
          _emailController.text,
        );

    if (mounted) {
      ShadToaster.of(context).show(
        ShadToast(
          title: Text(
            AppLocalizations.of(context)?.passwordResetTitle ??
                'Password Reset Email Sent',
          ),
          backgroundColor: Colors.green,
          description: Text(
            AppLocalizations.of(context)?.passwordResetDescription ??
                'Please check your email for further instructions',
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 30),
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: ShadCard(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: ShadImage.square(
                          Assets.icons.icSleepy.path,
                          size: 210,
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          AppLocalizations.of(context)?.forgotPasswordHeader ??
                              'Don\'t worry we got covered',
                          style: ShadTheme.of(context).textTheme.h3,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          AppLocalizations.of(context)
                                  ?.encouringMessageForForgotPassword ??
                              'Just enter email and you will receive a mail to reset your password',
                          style: ShadTheme.of(context).textTheme.p,
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextField(
                        autocorrect: true,
                        keyboardType: TextInputType.emailAddress,
                        onSubmitted: (value) {},
                        cursorColor: primaryColor,
                        decoration: InputDecoration(
                          hintText:
                              AppLocalizations.of(context)?.emailPlaceholder ??
                                  'Enter your email',
                          label: Text(
                            AppLocalizations.of(context)?.emailLabel ?? 'Email',
                            style: ShadTheme.of(context).textTheme.p.copyWith(
                                  fontSize: 18,
                                ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide:
                                const BorderSide(color: primaryColor, width: 2),
                          ),
                          prefixIcon: const Icon(
                            Icons.email,
                            color: primaryColor,
                            size: 20,
                          ),
                        ),
                        controller: _emailController,
                      ),
                      const SizedBox(height: 20),
                      Consumer<AuthProvider>(
                        builder: (context, authProvider, child) {
                          var isLoading = authProvider.isLoading;
                          return SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed:
                                  isLoading ? null : _handlePasswordReset,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: primaryColor,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: authProvider.isLoading
                                  ? const SizedBox(
                                      height: 20,
                                      width: 20,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                                Colors.white),
                                      ),
                                    )
                                  : Text(
                                      AppLocalizations.of(context)
                                              ?.forgotPassword ??
                                          'Forgot Password',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge
                                          ?.copyWith(
                                            color: Colors.white,
                                          ),
                                    ),
                            ),
                          );
                        },
                      ),
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
}
