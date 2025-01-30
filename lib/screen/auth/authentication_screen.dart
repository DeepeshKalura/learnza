import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:learnza/gen/assets.gen.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../model/app_enums.dart';
import '../../providers/auth_provider.dart';
import '../../router/app_urls.dart';
import '../../utils/form_validator.dart';
import '../../utils/theme.dart';

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({super.key});

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
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
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            AppLocalizations.of(context)?.greeting ?? "Welcome To Shadananda",
            style: Theme.of(context).textTheme.headlineLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            AppLocalizations.of(context)?.loginMessage ??
                'Enter your credentials you get from Shadananda mail and enjoy countless books',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Colors.grey,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          Focus(
            focusNode: _emailFocusNode,
            child: TextFormField(
              autocorrect: true,
              keyboardType: TextInputType.emailAddress,
              onFieldSubmitted: (value) {
                _passwordFocusNode.requestFocus();
              },
              controller: _emailController,
              cursorColor: primaryColor,
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context)?.emailLabel ?? 'Email',
                labelStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontSize: 18,
                    ),
                hintText: AppLocalizations.of(context)?.emailPlaceholder ??
                    'Enter your email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: primaryColor, width: 2),
                ),
              ),
              validator: FormValidator.validateEmail,
            ),
          ),
          const SizedBox(height: 20),
          Consumer<AuthProvider>(
            builder: (context, authProvider, child) {
              return Focus(
                focusNode: _passwordFocusNode,
                child: TextFormField(
                  controller: _passwordController,
                  obscureText: authProvider.obscure,
                  cursorColor: primaryColor,
                  decoration: InputDecoration(
                    labelText: AppLocalizations.of(context)?.passwordLabel ??
                        'Password',
                    labelStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontSize: 18,
                        ),
                    hintText:
                        AppLocalizations.of(context)?.passwordPlaceholder ??
                            'Enter your password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide:
                          const BorderSide(color: primaryColor, width: 2),
                    ),
                    prefixIcon: const Icon(
                      Icons.lock_outline,
                      color: primaryColor,
                      size: 20,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        authProvider.obscure
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: primaryColor,
                        size: 20,
                      ),
                      onPressed: authProvider.toggleObscure,
                    ),
                  ),
                  validator: FormValidator.validatePassword,
                ),
              );
            },
          ),
          const SizedBox(height: 20),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {
                context.pushNamed(AppUrls.forgotPasswordAuthScreen);
              },
              child: Text(
                AppLocalizations.of(context)?.forgotPassword ??
                    'Forgot Password?',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          ),
          const SizedBox(height: 2),
          Consumer<AuthProvider>(
            builder: (context, authProvider, child) {
              return ElevatedButton(
                onPressed: authProvider.isLoading ? null : _handleLogin,
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  padding: const EdgeInsets.symmetric(vertical: 16),
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
                              AlwaysStoppedAnimation<Color>(Colors.white),
                        ),
                      )
                    : Text(
                        AppLocalizations.of(context)?.loginButton ?? 'Login',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              color: Colors.white,
                            ),
                      ),
              );
            },
          ),
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
                          image: Assets.images.igNotebookImage.provider(),
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
                          constraints: const BoxConstraints(
                            maxWidth: 600,
                            minWidth: 400,
                          ),
                          padding: const EdgeInsets.all(32),
                          child: ShadCard(
                            shadows: const [
                              BoxShadow(
                                color: primaryColor,
                                spreadRadius: 1,
                                blurRadius: 10,
                                offset: Offset(0, 1),
                              ),
                            ],
                            child: Padding(
                              padding: const EdgeInsets.all(32),
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
                    padding: const EdgeInsets.all(16),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(24),
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
