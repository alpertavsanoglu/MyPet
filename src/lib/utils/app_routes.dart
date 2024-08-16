import 'package:myapp/pages/worker_info_page.dart';
import '../pages/barcode_scan.dart';
import '../pages/help_page.dart';
import 'package:flutter/material.dart';
import '../pages/log_in_page.dart';
import '../pages/pet_walking_page.dart';
import '../pages/pet_grooming_page.dart';
import '../pages/front_page.dart';
import '../pages/profile.dart';
import '../pages/sign_up_page.dart';
import '../pages/work_info_page.dart';
import '../pages/work_ad_page.dart';
import '../pages/worker_ad_page.dart';
import '../pages/vaccination_home.dart';
import '../pages/vaccination_inf.dart';
import '../pages/vaccination_pet.dart';
import '../pages/reviews_page.dart';
import '../pages/work_review_page.dart';
import '../pages/worker_review_page.dart';
import '../pages/past_works_page.dart';
import '../pages/ads_page.dart';
import '../pages/pet_info_page.dart';

/* uygulama içindeki bütün routeları(sayfalar arası yönlendirme) içeren dosya */

class AppRoutes {
  static const String logInPageScreen = '/log_in_page';

  static const String petWalkingJobScreen = '/pet_walking_page';

  static const String petGroomingJobScreen = '/pet_grooming_page';

  static const String frontPageScreen = '/front_page';

  static const String profilePageScreen = '/profile';

  static const String signUpPageScreen = '/sign_up_page';

  static const String helpPageScreen = '/help_page';

  static const String workInfoPageScreen = '/work_walking_page';

  static const String workerInfoPageScreen = '/worker_walking_page';

  static const String workAdPageScreen = '/work_ad_page';

  static const String workerAdPageScreen = '/worker_ad_page';

  static const String vaccinationPageScreen = '/vaccination_home';

  static const String vaccinationInf = '/vaccination_inf';

  static const String vaccinationPet = '/vaccination_pet';

  static const String reviewsPageScreen = '/reviews_page.dart';

  static const String workReviewPageScreen = '/work_review_page.dart';

  static const String workerReviewPageScreen = '/work_review_page.dart';

  static const String pastWorksPageScreen = '/past_works_page.dart';

  static const String adsPageScreen = '/ads_page.dart';

  static const String petInfoPageScreen = '/pet_info_page.dart';

  static const String barcodeScanPage = '/barcode_scan';

  static Map<String, WidgetBuilder> routes = {
    logInPageScreen: (context) => LogInPageScreen(),
    petWalkingJobScreen: (context) => PetWalkingJobScreen(),
    petGroomingJobScreen: (context) => PetGroomingJobScreen(),
    frontPageScreen: (context) => const FrontPageScreen(),
    profilePageScreen: (context) => ProfilePage(user: exampleUser),
    signUpPageScreen: (context) => SignUpPageScreen(),
    helpPageScreen: (context) => HelpPageScreen(),
    workInfoPageScreen: (context) => WorkInfoPageScreen(),
    workerInfoPageScreen: (context) => WorkerInfoPageScreen(),
    workAdPageScreen: (context) => WorkAdPageScreen(),
    workerAdPageScreen: (context) => WorkerAdPageScreen(),
    vaccinationPageScreen: (context) => VaccinationPageScreen(),
    vaccinationInf: (context) => VaccinationInf(vaccs: vaccinations),
    vaccinationPet: (context) => VaccinationPet(pet: examplePet),
    barcodeScanPage: (context) => BarcodeScanPage(),
    reviewsPageScreen: (context) => ReviewsPageScreen(
        dates: exampleDates,
        contents: exampleContents,
        ratings: exampleRatings),
    workReviewPageScreen: (context) =>
        WorkReviewPageScreen(review: workReview, rating: workRating),
    workerReviewPageScreen: (context) => WorkerReviewPageScreen(),
    pastWorksPageScreen: (context) =>
        PastWorksPageScreen(works1: exampleWorks, works2: exampleWorks2),
    adsPageScreen: (context) => AdsPageScreen(user: exampleUserAd),
    petInfoPageScreen: (context) => PetInfoPageScreen(),
  };
}
