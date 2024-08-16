import '../utils/app_export.dart';

class WorkerInfoPageScreen extends StatelessWidget {
  final workSchedule = "Pazartesi\nSalı\nÇarşamba\nPerşembe\nCuma";

  WorkerInfoPageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(8),
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: CustomArrowBack()),
                  CustomLogo(),
                  CustomImageView(
                    imagePath: ImageConstant.imgJob1PP,
                    height: 150.adaptSize,
                    width: 150.adaptSize,
                    radius: BorderRadius.circular(60.h),
                  ),
                  SizedBox(
                    height: 10.v,
                  ),
                  Container(
                    decoration: BoxDecoration(color: appTheme.deepOrangeA100Af),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 350.h,
                        child: Text(
                          "Müsait Günler:\n" + workSchedule,
                          style: CustomTextStyles.bodyMedium16Italic,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40.v,
                  ),
                  reviewWidget(context, 3),
                  _reviewsWidget(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget reviewWidget(BuildContext context, int rating) {
    List<Widget> stars = [];
    for (int i = 0; i < 5; i++) {
      if (i < rating)
        stars.add(
          Icon(
            Icons.star,
            color: Colors.yellow,
            size: 40.adaptSize,
          ),
        );
      else {
        stars.add(Icon(
          Icons.star_border,
          color: Colors.yellow,
          size: 40.adaptSize,
        ));
      }
    }
    stars.add(Text(rating.toString() + "/5",
        style: CustomTextStyles.headlineLargeTimmanaBlackItalic));
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: stars,
    );
  }

  Widget _reviewsWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: GestureDetector(
          onTap: () {
            onTapViewReview(context);
          },
          child: SizedBox(
            height: 125.v,
            width: 250.h,
            child: Align(
                alignment: Alignment.topCenter,
                child: Container(
                    child: Align(
                        alignment: Alignment.center,
                        child: Text("Değerlendirmeler",
                            style: CustomTextStyles
                                .headlineLargeTimmanaBlackItalic)),
                    height: 61.v,
                    width: 369.h,
                    decoration: BoxDecoration(
                        color: appTheme.gray800Ef.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(30.h)))),
          )),
    );
  }

  /// Geçmiş Değerlendirmeler sayfasına yönlendiricek
  onTapViewReview(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.reviewsPageScreen);
  }
}
