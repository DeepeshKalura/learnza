import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:learnza/gen/assets.gen.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../providers/auth_provider.dart';
import '../../../router/app_urls.dart';
import '../../../utils/form_validator.dart';

class LoginAuthCommonScreen extends StatefulWidget {
  const LoginAuthCommonScreen({super.key});

  @override
  State<LoginAuthCommonScreen> createState() => _LoginAuthCommonScreenState();
}

class _LoginAuthCommonScreenState extends State<LoginAuthCommonScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _isLoading = false;
  bool obscure = true;

  final formKey = GlobalKey<ShadFormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleLogin() async {
    if (_formKey.currentState!.validate()) {
      setState(() => _isLoading = true);

      try {
        await context.read<AuthProvider>().login(
              _emailController.text,
              _passwordController.text,
            );

        if (mounted) {
          context.pushReplacementNamed(AppUrls.homeAdminScreen);
        }
      } catch (e) {
        if (mounted) {
          ShadToaster.of(context).show(
            ShadToast.destructive(
              title: const Text('Uh oh! Something went wrong'),
              description: Text(e.toString()),
              action: ShadButton.destructive(
                decoration: ShadDecoration(
                  border: ShadBorder.all(
                    color: Theme.of(context).colorScheme.error,
                  ),
                ),
                onPressed: () => ShadToaster.of(context).hide(),
                child: const Text('Try again'),
              ),
            ),
          );
        }
      }

      setState(() => _isLoading = false);
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
            'Welcome Back',
            style: TextStyle(
              fontSize: 28.sp,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8.h),
          Text(
            'Please enter your details to continue',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 16.sp,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 32.h),
          ShadInputFormField(
            id: 'email',
            label: Text('Email', style: TextStyle(fontSize: 16.sp)),
            controller: _emailController,
            placeholder:
                Text('Enter your email', style: TextStyle(fontSize: 14.sp)),
            validator: FormValidator.validateEmail,
          ),
          SizedBox(height: 20.h),
          ShadInputFormField(
            controller: _passwordController,
            label: Text('Password', style: TextStyle(fontSize: 16.sp)),
            placeholder:
                Text('Enter your password', style: TextStyle(fontSize: 14.sp)),
            obscureText: obscure,
            prefix: Padding(
              padding: EdgeInsets.all(4.w),
              child: ShadImage.square(
                size: 16.w,
                LucideIcons.lock,
              ),
            ),
            suffix: ShadButton(
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
              onPressed: () {
                setState(() => obscure = !obscure);
              },
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter your password';
              }
              if (value.length < 6) {
                return 'Password must be at least 6 characters';
              }
              return null;
            },
          ),
          SizedBox(height: 20.h),
          Align(
            alignment: Alignment.centerRight,
            child: ShadButton.ghost(
              child: const Text('Forgot Password?'),
              onPressed: () async {
                if (FormValidator.validateEmail(_emailController.text) !=
                    null) {
                  ShadToaster.of(context).show(
                    const ShadToast.destructive(
                      title: Text('Valid Email is required'),
                      description: Text('Please enter your email'),
                    ),
                  );
                  return;
                }
                await context.read<AuthProvider>().forgotPassword(
                      _emailController.text,
                    );

                if (mounted) {
                  ShadToaster.of(context).show(
                    const ShadToast(
                      title: Text('Password Reset Email Sent'),
                      backgroundColor: Colors.green,
                      description: Text(
                        'Please check your email for further instructions',
                      ),
                    ),
                  );
                }
              },
            ),
          ),
          ShadButton(
            onPressed: _isLoading ? null : _handleLogin,
            child: _isLoading
                ? SizedBox(
                    height: 25.h,
                    width: 20.w,
                    child: const CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Colors.white,
                      ),
                    ),
                  )
                : Text(
                    'Login',
                    style: TextStyle(fontSize: 16.sp),
                  ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth > 768;

    ScreenUtil.init(
      context,
      designSize: isDesktop ? const Size(1440, 900) : const Size(375, 812),
      splitScreenMode: false,
      minTextAdapt: true,
    );

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
