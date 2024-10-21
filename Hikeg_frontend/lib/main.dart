import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hikeg/common_widgets/Layout.dart';
import 'package:hikeg/common_widgets/auth/auth_layout.dart';
import 'package:hikeg/constants/routes.dart';
import 'package:hikeg/screens/forgot_password_screen.dart';
import 'package:hikeg/screens/home_screen.dart';
import 'package:hikeg/screens/new_password_screen.dart';
import 'package:hikeg/screens/sign_in_screen.dart';
import 'package:hikeg/screens/sign_up_screen.dart';
import 'package:hikeg/screens/verify_email_screen.dart';
import 'package:hikeg/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

final GoRouter _router = GoRouter(
  initialLocation: Routes.signInScreen,
  routes: <RouteBase>[
    ShellRoute(
      routes: <RouteBase>[
        GoRoute(
          path: Routes.signInScreen,
          builder: (BuildContext context, GoRouterState state) {
            return const SignInScreen();
          },
        ),
        GoRoute(
          path: Routes.signUpScreen,
          builder: (BuildContext context, GoRouterState state) {
            return const SignUpScreen();
          },
        ),
        GoRoute(
          path: Routes.forgotPasswordScreen,
          builder: (BuildContext context, GoRouterState state) {
            return const ForgotPasswordScreen();
          },
        ),
        GoRoute(
          path: Routes.verifyEmailScreen,
          builder: (BuildContext context, GoRouterState state) {
            return const VerifyEmailScreen();
          },
        ),
        GoRoute(
          path: Routes.createNewPasswordScreen,
          builder: (BuildContext context, GoRouterState state) {
            return const NewPasswordScreen();
          },
        ),
      ],
      builder: (BuildContext context, GoRouterState state, Widget? widget) {
        if (widget == null) {
          return const Placeholder();
        }

        return AuthLayout(
          body: widget,
        );
      }
    ),
    ShellRoute(
        routes: <RouteBase>[
          GoRoute(
              path: Routes.homeScreen,
              builder: (BuildContext context, GoRouterState state) {
                return const HomeScreen();
              })
        ],
        builder: (BuildContext context, GoRouterState state, Widget? widget) {
          if (widget == null) {
            return const Placeholder();
          }

          return Layout(body: widget);
        }),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: lightMode,
      routerConfig: _router,
    );
  }
}
