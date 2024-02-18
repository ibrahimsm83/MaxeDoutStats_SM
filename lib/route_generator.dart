import 'package:flutter/material.dart';
import 'package:maxedoutstats/view/card/add_card_screend.dart';
import 'package:maxedoutstats/view/card/card_details_screen.dart';
import 'package:maxedoutstats/view/changeResetPassword/reset_password_screen.dart';
import 'package:maxedoutstats/view/deshboard/deshboard_screen.dart';
import 'package:maxedoutstats/view/login/login_screen.dart';
import 'package:maxedoutstats/view/login/pre_login_screen.dart';
import 'package:maxedoutstats/view/new_exercise/new_exercise_screen.dart';
import 'package:maxedoutstats/view/profile/details_profile_screen.dart';
import 'package:maxedoutstats/view/programs/create_program_screen.dart';
import 'package:maxedoutstats/view/programs/day1_program_screen.dart';
import 'package:maxedoutstats/view/programs/programs_details_screen.dart';
import 'package:maxedoutstats/view/programs/programs_screen.dart';
import 'package:maxedoutstats/view/setting/settings_screen.dart';
import 'package:maxedoutstats/view/signup/create_new_account_screen.dart';
import 'package:maxedoutstats/view/splash/splash_screen.dart';
import 'package:maxedoutstats/view/subscription/subscription_screen.dart';
import 'package:maxedoutstats/view/termandPrivacyPolicy/term_privicy_policy_screen.dart';
import 'package:maxedoutstats/view/verification/verification_screen.dart';
import 'package:maxedoutstats/view/verification/verification_signup_screen.dart';
import 'package:maxedoutstats/view/workout/workout_scree.dart';
import 'view/filter_and_search_screen.dart/filter_search_screen.dart';
import 'view/forgetpassword/forget_password_screen.dart';
import 'view/programs/continue_program_screen.dart';

class Routes {
  static const String splashRoute = "/";
  static const String loginRoute = "/login";
  static const String preLoginRoute = "/preLogin";
  static const String signUpviewRoute = "/signUpView";
  static const String workOutViewRoute = "/workOutView";
  static const String addCardViewRoute = "/AddCardView";
  static const String settingViewRoute = "/SettingView";
  static const String programsPageRoute = "/ProgramsPage";
  static const String oTpverifiedRoute = "/OtpVerification";
  static const String deshboardPageRoute = "/deshboardPage";
  static const String cardDetailsPageRoute = "/CardDetailsPage";
  static const String editProfilePageRoute = "/editProfilePage";
  static const String subscriptionPageRoute = "/SubscriptionPage";
  static const String resetPasswordPageRoute = "/ResetPasswordPage";
  static const String newExerciseViewPageRoute = "/newExerciseView";
  static const String forgotPasswordPageRoute = "/ForgotPasswordPage";
  static const String oTpverifiedsignupRoute = "/OtpVerificationSignUp";
  static const String termPrivacyPolicyPageRoute = "/TermPrivacyPolicyView";
  static const String programsDetailsPageRoute = "/ProgramsDetailsPage";
  static const String dayOneProgramRoute = "/dayOneProgramRoute";
  static const String FilterSearchRoute = "/FilterSearchRoute";
  static const String createProgramRoute = "/createProgramRoute";
  static const String continueProgramRoute = "/continueProgramRoute";
}

class RouteGenerator {

  static late GlobalKey dashboardKey;

  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    
    switch (routeSettings.name) {
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case Routes.signUpviewRoute:
        return MaterialPageRoute(builder: (_) => const SignUpView());
      case Routes.settingViewRoute:
        return MaterialPageRoute(builder: (_) => const SettingView());
      case Routes.preLoginRoute:
        return MaterialPageRoute(builder: (_) => const PreLoginview());
      case Routes.workOutViewRoute:
        return MaterialPageRoute(builder: (_) => const WorkOutView());
      case Routes.addCardViewRoute:
        return MaterialPageRoute(builder: (_) =>  AddCardView());
        case Routes.programsPageRoute:
        return MaterialPageRoute(builder: (_) =>  ProgramsPage());
        case Routes.programsDetailsPageRoute:
        return MaterialPageRoute(builder: (_) =>  ProgramsDetailsPage());
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.deshboardPageRoute:
        dashboardKey=GlobalKey();
        return MaterialPageRoute(builder: (_) => DeshboardPage(key: dashboardKey,));
      case Routes.editProfilePageRoute:
        return MaterialPageRoute(builder: (_) => const EditProfileVew());
      case Routes.oTpverifiedRoute:
        return MaterialPageRoute(builder: (_) => const OtpVerification());
      case Routes.newExerciseViewPageRoute:
        return MaterialPageRoute(builder: (_) => const NewExerciseView());
      case Routes.cardDetailsPageRoute:
        return MaterialPageRoute(builder: (_) => const CardDetailsPage());
      case Routes.subscriptionPageRoute:
        return MaterialPageRoute(builder: (_) => const SubscriptionPage());
      case Routes.resetPasswordPageRoute:
        return MaterialPageRoute(builder: (_) => const ResetPasswordPage());
      case Routes.forgotPasswordPageRoute:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordPage());
      case Routes.oTpverifiedsignupRoute:
        return MaterialPageRoute(builder: (_) => const OtpVerificationSignUp());
      case Routes.dayOneProgramRoute:
        return MaterialPageRoute(builder: (_) => const DayOneProgram());
      case Routes.FilterSearchRoute:
        return MaterialPageRoute(builder: (_) => FilterSearch());
      case Routes.createProgramRoute:
        return MaterialPageRoute(builder: (_) => CreateProgeamPage());
      case Routes.continueProgramRoute:
        return MaterialPageRoute(builder: (_) => ContinueProgram());
      case Routes.termPrivacyPolicyPageRoute:
        final args = routeSettings.arguments as String;
        return MaterialPageRoute(
            builder: (_) => TermPrivacyPolicyView(title: args));
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(title: const Text("No Route Found")),
              body: const Center(child: Text("No Route Found")),
            ));
  }
}
