import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:learnza/gen/assets.gen.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../model/app_enums.dart';
import '../../../providers/auth_provider.dart';
import '../../../router/app_urls.dart';
import '../../../utils/form_validator.dart';
import '../../../utils/theme.dart';

class LoginAuthCommonScreen extends StatefulWidget {
  const LoginAuthCommonScreen({super.key});

  @override
  State<LoginAuthCommonScreen> createState() => _LoginAuthCommonScreenState();
}

class _LoginAuthCommonScreenState extends State<LoginAuthCommonScreen> {
  void getRedirectPathByRole() {
    final authProvider = context.read<AuthProvider>();

    final user = authProvider.user;
    if (user == null) {
      context.pushReplacementNamed(AppUrls.authenticationScreen);
    }
    final userRole = user!.role;
    if (userRole == UserRole.admin) {
      context.pushReplacementNamed(AppUrls.homeAdminScreen);
    } else if (userRole == UserRole.teacher) {
      context.pushReplacementNamed(AppUrls.homeTeacherScreen);
    } else {
      context.pushReplacementNamed(AppUrls.homeStudentScreen);
    }
  }

  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  final formKey = GlobalKey<ShadFormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  void _handleLogin() async {
    if (_formKey.currentState!.validate()) {
      try {
        await context.read<AuthProvider>().login(
              _emailController.text,
              _passwordController.text,
            );

        if (mounted) {
          getRedirectPathByRole();
        }
      } catch (e) {
        if (mounted) {
          ShadToaster.of(context).show(
            ShadToast.destructive(
              title: Text(
                AppLocalizations.of(context)?.errorTitle ??
                    'Uh oh! Something went wrong',
              ),
              description: Text(
                e.toString(),
              ),
              action: ShadButton.destructive(
                decoration: ShadDecoration(
                  border: ShadBorder.all(
                    color: Theme.of(context).colorScheme.error,
                  ),
                ),
                onPressed: () => ShadToaster.of(context).hide(),
                child: Text(
                  AppLocalizations.of(context)?.tryAgain ?? 'Try again',
                ),
              ),
            ),
          );
        }
      }
    }
  }

  Widget _buildLoginForm() {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            AppLocalizations.of(context)?.greeting ?? "Welcome Back!",
            style: ShadTheme.of(context).textTheme.h1.copyWith(
                  fontSize: 32.sp,
                ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8.h),
          Text(
            AppLocalizations.of(context)?.loginMessage ??
                'Please enter your details to continue',
            style: ShadTheme.of(context).textTheme.p.copyWith(
                  color: Colors.grey,
                  fontSize: 15.sp,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          Focus(
            focusNode: _emailFocusNode,
            child: ShadInputFormField(
              autocorrect: true,
              keyboardType: TextInputType.emailAddress,
              onSubmitted: (value) {
                _passwordFocusNode.requestFocus();
              },
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
          ),
          const SizedBox(height: 20),
          Consumer<AuthProvider>(builder: (context, authProvider, child) {
            var obscure = authProvider.obscure;
            return Focus(
              focusNode: _passwordFocusNode,
              child: ShadInputFormField(
                controller: _passwordController,
                label: Text(
                  AppLocalizations.of(context)?.passwordLabel ?? 'Password',
                  style: ShadTheme.of(context).textTheme.p.copyWith(
                        fontSize: 18,
                      ),
                ),
                placeholder: Text(
                  AppLocalizations.of(context)?.passwordPlaceholder ??
                      'Enter your password',
                ),
                obscureText: obscure,
                prefix: Padding(
                  padding: EdgeInsets.all(4.w),
                  child: ShadImage.square(
                    size: 16.w,
                    LucideIcons.lock,
                    color: primaryColor,
                  ),
                ),
                cursorColor: primaryColor,
                suffix: ShadButton(
                  backgroundColor: primaryColor,
                  width: 24.w,
                  height: 24.h,
                  padding: EdgeInsets.zero,
                  decoration: const ShadDecoration(
                    secondaryBorder: ShadBorder.none,
                    secondaryFocusedBorder: ShadBorder.none,
                  ),
                  icon: ShadImage.square(
                    size: 16.w,
                    obscure ? LucideIcons.eyeOff : LucideIcons.eye,
                  ),
                  onPressed: authProvider.toggleObscure,
                ),
                validator: FormValidator.validatePassword,
              ),
            );
          }),
          const SizedBox(height: 20),
          Align(
            alignment: Alignment.centerRight,
            child: ShadButton.ghost(
              child: Text(
                AppLocalizations.of(context)?.forgotPassword ??
                    'Forgot Password?',
                style: ShadTheme.of(context).textTheme.p.copyWith(),
              ),
              onPressed: () async {
                if (FormValidator.validateEmail(_emailController.text) !=
                    null) {
                  ShadToaster.of(context).show(
                    ShadToast.destructive(
                      title: Text(
                        AppLocalizations.of(context)?.emailRequired ??
                            'Valid Email is required',
                      ),
                      description: Text(
                        AppLocalizations.of(context)
                                ?.emailRequiredDescription ??
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
                        AppLocalizations.of(context)
                                ?.passwordResetDescription ??
                            'Please check your email for further instructions',
                      ),
                    ),
                  );
                }
              },
            ),
          ),
          const SizedBox(height: 2),
          Consumer<AuthProvider>(builder: (context, authProvider, child) {
            var isLoading = authProvider.isLoading;
            return ShadButton(
              backgroundColor: primaryColor,
              size: ShadButtonSize.lg,
              onPressed: isLoading ? null : _handleLogin,
              child: isLoading
                  ? const Center(
                      child: SizedBox(
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            Colors.white,
                          ),
                        ),
                      ),
                    )
                  : Center(
                      child: Text(
                        AppLocalizations.of(context)?.loginButton ?? 'Login',
                        style: ShadTheme.of(context).textTheme.h4.copyWith(
                              color: Colors.white,
                            ),
                      ),
                    ),
            );
          }),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth > 768;

    return Scaffold(
      body: ShadForm(
        key: formKey,
        child: isDesktop
            ? Row(
                children: [
                  // Left side - Image
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: Assets.images.common.auth.notebookImage
                              .provider(),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  // Right side - Login form
                  Expanded(
                    child: Center(
                      child: SingleChildScrollView(
                        child: Container(
                          constraints: BoxConstraints(
                            maxWidth: 600.w,
                            minWidth: 400.w,
                          ),
                          padding: EdgeInsets.all(32.w),
                          child: ShadCard(
                            child: Padding(
                              padding: EdgeInsets.all(32.w),
                              child: _buildLoginForm(),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            : Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(16.w),
                    child: Card(
                      child: Padding(
                        padding: EdgeInsets.all(24.w),
                        child: _buildLoginForm(),
                      ),
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
