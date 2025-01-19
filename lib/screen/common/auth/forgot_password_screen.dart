import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../gen/assets.gen.dart';
import '../../../providers/auth_provider.dart';
import '../../../utils/form_validator.dart';
import '../../../utils/theme.dart';

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
                    ShadInputFormField(
                      autocorrect: true,
                      keyboardType: TextInputType.emailAddress,
                      onSubmitted: (value) {},
                      id: 'email',
                      label: Text(
                        AppLocalizations.of(context)?.emailLabel ?? 'Email',
                        style: ShadTheme.of(context).textTheme.p.copyWith(
                              fontSize: 18,
                            ),
                      ),
                      cursorColor: primaryColor,
                      controller: _emailController,
                      placeholder: Text(
                        AppLocalizations.of(context)?.emailPlaceholder ??
                            'Enter your email',
                      ),
                      validator: FormValidator.validateEmail,
                    ),
                    const SizedBox(height: 20),
                    Consumer<AuthProvider>(
                      builder: (context, authProvider, child) {
                        var isLoading = authProvider.isLoading;
                        return SizedBox(
                          width: double.infinity,
                          child: ShadButton(
                            backgroundColor: primaryColor,
                            size: ShadButtonSize.lg,
                            onPressed: isLoading ? null : _handlePasswordReset,
                            child: isLoading
                                ? const Center(
                                    child: SizedBox(
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          Colors.white,
                                        ),
                                      ),
                                    ),
                                  )
                                : Center(
                                    child: Text(
                                      AppLocalizations.of(context)
                                              ?.loginButton ??
                                          'Login',
                                      style: ShadTheme.of(context)
                                          .textTheme
                                          .h4
                                          .copyWith(
                                            color: Colors.white,
                                          ),
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
    );
  }
}
