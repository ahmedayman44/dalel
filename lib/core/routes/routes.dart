import 'package:dalel/features/auth/presentation/auth_cubit/cubit/auth_cubit.dart';
import 'package:dalel/features/auth/presentation/screens/sign_in_view.dart';
import 'package:dalel/features/auth/presentation/screens/sign_up_view.dart';
import 'package:dalel/features/home/presentation/screens/home_screen.dart';
import 'package:dalel/features/onboarding/presentation/screens/on_boaarding_screen.dart';
import 'package:dalel/features/splash/presentation/screens/splash_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  static const String konboarding = '/onboarding';
  static const String khome = '/home';
  static const String ksignIn = "/signIn";
  static const String ksignUp = "/signUp";
  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => SplashScreen()),
      GoRoute(path: konboarding, builder: (context, state) => OnBoardingView()),
      GoRoute(path: khome, builder: (context, state) => HomeView()),
      GoRoute(
        path: ksignUp,
        builder:
            (context, state) => BlocProvider(
              create: (context) => AuthCubit(),
              child: SignUpView(),
            ),
      ),

      GoRoute(
        path: ksignIn,
        builder:
            //! we add bloc above screen that we will use
            (context, state) => BlocProvider(
              create: (context) => AuthCubit(),
              child: SignInView(),
            ),
      ),
      GoRoute(path: khome, builder: (context, state) => HomeView()),
    ],
  );
}
 //! second type of routes

// class Routes {
//   static const String splashRoute = "/";
//   static const String loginRoute = "/login";
//   static const String registerRoute = "/register";
//   static const String forgetPasswordRoute = "/forgetPassword";
//   static const String onBoardingRoute = '/onBoarding';
//   static const String mainRoute = "/main";
//   static const String storeDetailesRoute = "/storeDetailes";
// }

// class RouteGenerator {
//   static Route<dynamic> getRoute(RouteSettings seetings) {
//     switch (seetings.name) {
//       case Routes.splashRoute:
//         return MaterialPageRoute(builder: (_) => SplashView());
//       case Routes.loginRoute:
//         return MaterialPageRoute(builder: (_) => LoginView());
//       case Routes.registerRoute:
//         return MaterialPageRoute(builder: (_) => RegisterView());
//       case Routes.forgetPasswordRoute:
//         return MaterialPageRoute(builder: (_) => ForgetPassword());
//       case Routes.onBoardingRoute:
//         return MaterialPageRoute(builder: (_) => OnboardingView());
//       case Routes.mainRoute:
//         return MaterialPageRoute(builder: (_) => MainView());
//       case Routes.storeDetailesRoute:
//         return MaterialPageRoute(builder: (_) => StoreDetailsView());
//       default:
//         return unDefiendRoute();
//     }
//   }

//   static Route<dynamic> unDefiendRoute() {
//     return MaterialPageRoute(
//       builder: (_) {
//         return Scaffold(
//           appBar: AppBar(title: Text(AppStrings.noRouteFound)),
//           body: Center(child: Text(AppStrings.noRouteFound)),
//         );
//       },
//     );
//   }
// }