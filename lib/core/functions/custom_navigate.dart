import 'package:dalel/core/routes/routes.dart';
import 'package:go_router/go_router.dart';

void navigateToOnBoarding(context) {
  GoRouter.of(context).push(AppRouter.konboarding);
}
