import 'package:dalel/features/home/presentation/screens/home_screen.dart';
import 'package:dalel/features/onboarding/presentation/screens/on_boaarding_screen.dart';
import 'package:dalel/features/splash/presentation/screens/splash_screen.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => SplashScreen()),
    GoRoute(path: 'onboarding', builder: (context, state) => OnBoardingView()),
    GoRoute(path: 'home', builder: (context, state) => HomeView()),
    GoRoute(path: ''),
  ],
);

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