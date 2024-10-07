import 'package:oberi_mobile/ui/views/account/account_route.dart';
import 'package:oberi_mobile/ui/views/bootcamp/bootcamp_checkout/bootcamp_checkout_route.dart';
import 'package:oberi_mobile/ui/views/bootcamp/bootcamp_detail/bootcamp_detail_route.dart';
import 'package:oberi_mobile/ui/views/bootcamp/bootcamp_overview/bootcamp_overview_route.dart';
import 'package:oberi_mobile/ui/views/chat/chat_route.dart';
import 'package:oberi_mobile/ui/views/faq/faq_route.dart';
import 'package:oberi_mobile/ui/views/history_transaction/history_transaction_route.dart';
import 'package:oberi_mobile/ui/views/home/home_route.dart';
import 'package:oberi_mobile/ui/views/intro/intro_route.dart';
import 'package:oberi_mobile/ui/views/login/login_route.dart';
import 'package:oberi_mobile/ui/views/login_google/login_google_route.dart';
import 'package:oberi_mobile/ui/views/login_google_confirm/login_google_confirm_route.dart';
import 'package:oberi_mobile/ui/views/main_nav/main_nav_route.dart';
import 'package:oberi_mobile/ui/views/my_certificate/my_certificate_route.dart';
import 'package:oberi_mobile/ui/views/my_learning/my_learning_route.dart';
import 'package:oberi_mobile/ui/views/my_learning_bootcamp/my_learning_bootcamp_route.dart';
import 'package:oberi_mobile/ui/views/my_learning_webinar/my_learning_webinar_route.dart';
import 'package:oberi_mobile/ui/views/my_points/my_points_route.dart';
import 'package:oberi_mobile/ui/views/onboarding/onboarding_route.dart';
import 'package:oberi_mobile/ui/views/payment_method/payment_method_route.dart';
import 'package:oberi_mobile/ui/views/payment_success/payment_success_route.dart';
import 'package:oberi_mobile/ui/views/redeem_point/redeem_point_route.dart';
import 'package:oberi_mobile/ui/views/register/register_route.dart';
import 'package:oberi_mobile/ui/views/review_fasilitator/review_fasilitator_route.dart';
import 'package:oberi_mobile/ui/views/splash/splash_route.dart';
import 'package:oberi_mobile/ui/views/splash/splash_view.dart';
import 'package:oberi_mobile/ui/views/test_overview/test_overview_route.dart';
import 'package:oberi_mobile/ui/views/test_question/test_question_route.dart';
import 'package:oberi_mobile/ui/views/test_result/test_result_route.dart';
import 'package:oberi_mobile/ui/views/test_review/test_review_route.dart';
import 'package:oberi_mobile/ui/views/test_upload/test_upload_route.dart';
import 'package:oberi_mobile/ui/views/webinar/webinar_route.dart';

class AppPages {
  static const initial = SplashView.route;

  static final routes = [
    ...splashRoute,
    ...introRoute,
    ...homeRoute,
    ...accountRoute,
    ...bootcampDetailRoute,
    ...bootcampOverviewRoute,
    ...bootcampCheckoutRoute,
    ...chatRoute,
    ...faqRoute,
    ...historyTransactionRoute,
    ...loginRoute,
    ...loginGoogleRoute,
    ...loginGoogleConfirmRoute,
    ...mainNavRoute,
    ...myCertificateRoute,
    ...myLearningRoute,
    ...myLearningWebinarRoute,
    ...myLearningBootcampRoute,
    ...myPointsRoute,
    ...onboardingRoute,
    ...paymentMethodRoute,
    ...paymentSuccessRoute,
    ...redeemPointRoute,
    ...registerRoute,
    ...reviewFasilitatorRoute,
    ...testOverviewRoute,
    ...testQuestionRoute,
    ...testResultRoute,
    ...testResultRoute,
    ...testReviewRoute,
    ...testUploadRoute,
    ...webinarRoute,
    ...paymentMethodRoute,
    ...paymentSuccessRoute,
  ];
}