import '../utils/app_export.dart';

class VaccinationPageScreen extends StatelessWidget {
  const VaccinationPageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Container(
                width: double.maxFinite,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(ImageConstant.imgVaccinationBg),
                        fit: BoxFit.cover)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Column(children: [
                    SizedBox(height: 12.v),
                    Expanded(
                        child: SingleChildScrollView(
                            child: Column(children: [
                      Align(
                          alignment: Alignment.topLeft,
                          child: CustomArrowBack()),
                      CustomLogo(),
                      SizedBox(height: 61.v),
                      _petBoxWidget(context, "Beyaz Diş"),
                      SizedBox(height: 61.v),
                      _petBoxWidget(context, "Karamel"),
                      SizedBox(height: 61.v),
                      _petBoxWidget(context, "Charlie"),
                    ])))
                  ]),
                ))));
  }

  Widget _petBoxWidget(BuildContext context, String petName, ) {
    return GestureDetector(
        onTap: () {
          onTapBox(context);
        },
        child: Container(
            width: 356.h,
            height: 99.v,
            decoration: AppDecoration.fillBlueGray
                .copyWith(borderRadius: BorderRadiusStyle.roundedBorder20),
            child: Center(child: Text(petName, style: CustomTextStyles.headlineLargeTimmanaBlackItalic))));
  }

  /// Navigates to the beyazDiAKartScreen when the action is triggered.
  onTapBox(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.vaccinationPet);
  }
}
