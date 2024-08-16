import '../utils/app_export.dart';

class FrontPageScreen extends StatelessWidget {
  const FrontPageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                spreadRadius: 2.h, blurRadius: 2.h, offset: const Offset(0, 4))
          ],
          image: DecorationImage(
              image: AssetImage(ImageConstant.imgFrontPageBg),
              fit: BoxFit.cover)),
      child: Padding(
        padding: EdgeInsets.only(top: 8.v),
        child: Column(
          children: [
            SizedBox(
              height: 108.v,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 101.v,
                    width: 101.h,
                  ),
                  const Align(
                    alignment: Alignment.bottomCenter,
                    child: CustomLogo(),
                  ),
                  SizedBox(
                    height: 101.v,
                    width: 101.h,
                    child: Align(
                      alignment: Alignment.topRight,
                      child: CustomImageView(
                          imagePath: ImageConstant.imgProfile,
                          height: 60.adaptSize,
                          width: 60.adaptSize,
                          radius: BorderRadius.circular(50.h),
                          alignment: Alignment.topRight,
                          margin: EdgeInsets.only(right: 6.h),
                          onTap: () {
                            onTapProfile(context);
                          }),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 45.v),
              child: Column(
                children: [
                  GestureDetector(
                    child: Container(
                      height: 95.v,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                spreadRadius: 1.h,
                                blurRadius: 1.h,
                                offset: const Offset(0, 2))
                          ],
                          image: DecorationImage(
                              image: AssetImage(ImageConstant.imgFrontFindOwner),
                              fit: BoxFit.cover)),
                      child: Align(
                          alignment: Alignment.bottomRight,
                          child: Text("Sahip Öğren",
                              style: theme.textTheme.headlineLarge!
                                  .copyWith(fontStyle: FontStyle.italic))),
                    ),
                    onTap: () {
                      onTapFindOwner(context);
                    },
                  ),
                  SizedBox(height: 10.v),
                  GestureDetector(
                    child: Container(
                      height: 95.v,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                spreadRadius: 1.h,
                                blurRadius: 1.h,
                                offset: const Offset(0, 2))
                          ],
                          image: DecorationImage(
                              image: AssetImage(ImageConstant.imgFrontVaccine),
                              fit: BoxFit.cover)),
                      child: Align(
                          alignment: Alignment.bottomRight,
                          child: Text("Aşı",
                              style: theme.textTheme.headlineLarge!
                                  .copyWith(fontStyle: FontStyle.italic))),
                    ),
                    onTap: () {
                      onTapVaccine(context);
                    },
                  ),
                  SizedBox(height: 10.v),
                  GestureDetector(
                    child: Container(
                      height: 95.v,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                spreadRadius: 1.h,
                                blurRadius: 1.h,
                                offset: const Offset(0, 2))
                          ],
                          image: DecorationImage(
                              image: AssetImage(ImageConstant.imgPetWalkingJob),
                              fit: BoxFit.cover)),
                      child: Align(
                          alignment: Alignment.bottomRight,
                          child: Text("Yürüyüş",
                              style: theme.textTheme.headlineLarge!
                                  .copyWith(fontStyle: FontStyle.italic))),
                    ),
                    onTap: () {
                      onTapWalk(context);
                    },
                  ),
                  SizedBox(height: 10.v),
                  GestureDetector(
                    child: Container(
                      height: 95.v,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                spreadRadius: 1.h,
                                blurRadius: 1.h,
                                offset: const Offset(0, 2))
                          ],
                          image: DecorationImage(
                              image: AssetImage(ImageConstant.imgFrontGroom),
                              fit: BoxFit.cover)),
                      child: Align(
                          alignment: Alignment.bottomRight,
                          child: Text("Tıraş",
                              style: theme.textTheme.headlineLarge!
                                  .copyWith(fontStyle: FontStyle.italic))),
                    ),
                    onTap: () {
                      onTapGroom(context);
                    },
                  ),
                  SizedBox(height: 10.v),
                ],
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                  child: Container(
                    width: 112.h,
                    height: 130.v,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(ImageConstant.imgFrontPageHelp),
                            fit: BoxFit.cover)),
                    child: Align(
                        alignment: Alignment.center,
                        child: Text("Yardım \nLazım mı?",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: CustomTextStyles.bodyLargeTillanaBlack900)),
                  ),
                  onTap: () {
                    onTapHelp(context);
                  }),
            ),
          ],
        ),
      ),
    )));
  }

  /// Navigates to the Profile Page
  onTapProfile(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.profilePageScreen);
  }

  /// Navigates to the Help Page
  onTapHelp(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.helpPageScreen);
  }

  /// Navigates to the Pet Grooming Jobs Page
  onTapGroom(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.petGroomingJobScreen);
  }

  /// Navigates to the Pet Walking Jobs Page
  onTapWalk(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.petWalkingJobScreen);
  }

  /// Navigates to the Vaccine Page
  onTapVaccine(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.vaccinationPageScreen);
  }

  /// Navigates to the Find Owner Page
  onTapFindOwner(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.barcodeScanPage);
  }
}