import 'package:flutter/material.dart';
import 'package:getjoke/features/home/presentation/home_page.dart';
import 'package:go_router/go_router.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();
final bottomNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter routerConfig = GoRouter(
  navigatorKey: rootNavigatorKey,
  initialLocation: HomePage.routeName,
  redirect: (context, state) async {
    return state.path;
  },
  routes: <RouteBase>[
    GoRoute(
      parentNavigatorKey: rootNavigatorKey,
      path: HomePage.routeName,
      builder: ((context, state) => HomePage()),
    ),
    // GoRoute(
    //   parentNavigatorKey: rootNavigatorKey,
    //   path: AppointmentsPage.routeName,
    //   builder: ((context, state) => const AppointmentsPage()),
    // ),
    // GoRoute(
    //   parentNavigatorKey: rootNavigatorKey,
    //   path: ProfilePage.routeName,
    //   builder: ((context, state) => const ProfilePage()),
    // ),
    // GoRoute(
    //   parentNavigatorKey: rootNavigatorKey,
    //   path: OnboardingsPage.routeName,
    //   builder: ((context, state) => const OnboardingsPage()),
    // ),
    // GoRoute(
    //   parentNavigatorKey: rootNavigatorKey,
    //   path: LoginSelectionPage.routeName,
    //   builder: ((context, state) => const LoginSelectionPage()),
    // ),
    // GoRoute(
    //   parentNavigatorKey: rootNavigatorKey,
    //   path: RegisterPage.routeName,
    //   builder: ((context, state) => const RegisterPage()),
    // ),
    // GoRoute(
    //   parentNavigatorKey: rootNavigatorKey,
    //   path: LoginPage.routeName,
    //   builder: ((context, state) => const LoginPage()),
    // ),
    // GoRoute(
    //   parentNavigatorKey: rootNavigatorKey,
    //   path: LoginWithPhonePage.routeName,
    //   builder: ((context, state) => const LoginWithPhonePage()),
    // ),
    // GoRoute(
    //   parentNavigatorKey: rootNavigatorKey,
    //   path: MedicaFormPage.routeName,
    //   builder: ((context, state) => MedicaFormPage()),
    // ),
    // GoRoute(
    //   parentNavigatorKey: rootNavigatorKey,
    //   path: TermOfSystem.routeName,
    //   builder: ((context, state) => const TermOfSystem()),
    // ),
    // GoRoute(
    //   parentNavigatorKey: rootNavigatorKey,
    //   path: VerifyOtpPage.routeName,
    //   builder: ((context, state) => const VerifyOtpPage()),
    // ),
    // GoRoute(
    //     parentNavigatorKey: rootNavigatorKey,
    //     path: DetailAppointmentPage.routeName,
    //     builder: ((context, state) => const DetailAppointmentPage())),
    // GoRoute(
    //     parentNavigatorKey: rootNavigatorKey,
    //     path: RegisterConfirmSelectionPage.routeName,
    //     builder: ((context, state) => RegisterConfirmSelectionPage())),
    // GoRoute(
    //     parentNavigatorKey: rootNavigatorKey,
    //     path: WaiverOLiabilitiesAndDataPrivacyPage.routeName,
    //     builder: ((context, state) => WaiverOLiabilitiesAndDataPrivacyPage())),
    // GoRoute(
    //     parentNavigatorKey: rootNavigatorKey,
    //     path: CompleteYourProfilePage.routeName,
    //     builder: ((context, state) => const CompleteYourProfilePage())),
    // GoRoute(
    //   parentNavigatorKey: rootNavigatorKey,
    //   path: ChooseServicePage.routeName,
    //   builder: ((context, state) => const ChooseServicePage()),
    // ),
    // GoRoute(
    //   parentNavigatorKey: rootNavigatorKey,
    //   path: BookingConfirmedPage.routeName,
    //   builder: ((context, state) => const BookingConfirmedPage()),
    // ),
    // GoRoute(
    //   parentNavigatorKey: rootNavigatorKey,
    //   path: SupportAndHelpPage.routeName,
    //   builder: ((context, state) => const SupportAndHelpPage()),
    // ),
    // GoRoute(
    //   parentNavigatorKey: rootNavigatorKey,
    //   path: SupportAndHelpSuccessPage.routeName,
    //   builder: ((context, state) => const SupportAndHelpSuccessPage()),
    // ),
    // GoRoute(
    //   parentNavigatorKey: rootNavigatorKey,
    //   path: CompleteProfilePage.routeName,
    //   builder: ((context, state) => const CompleteProfilePage()),
    // ),
    // GoRoute(
    //   parentNavigatorKey: rootNavigatorKey,
    //   path: CompleteProfileSuccessPage.routeName,
    //   builder: ((context, state) => const CompleteProfileSuccessPage()),
    // ),
  ],
);

String pathFormat(String path) {
  return path.replaceAll('/', '');
}
