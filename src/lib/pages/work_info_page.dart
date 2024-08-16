import '../utils/app_export.dart';

class WorkInfoPageScreen extends StatelessWidget {
  WorkInfoPageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final petInfo =
        "Tür : Köpek\nCins : Sibirya Husky\nİsim : Beyaz Diş\nEksik Aşı : Yok";
    final ownerInfo = "İsim : Techblue\nİletişim : 0507 123 45 66";
    final workerSchedule = "Pazartesi\nSalı\nÇarşamba\nPerşembe\nCuma";

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: SizedBox(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              child: Column(
                children: [
                  Align(alignment: Alignment.topLeft, child: CustomArrowBack()),
                  CustomLogo(),
                  CustomImageView(
                    imagePath: ImageConstant.imgPet2PP,
                    height: 120.adaptSize,
                    width: 120.adaptSize,
                    radius: BorderRadius.circular(50.h),
                    margin: EdgeInsets.only(right: 6.h),
                  ),
                  SizedBox(
                    height: 20.v,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: appTheme.blueGray100.withOpacity(0.8)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 350.h,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Hayvan Bilgileri",
                              style: CustomTextStyles.bodyMedium16Italic,
                              textAlign: TextAlign.start,
                            ),
                            Text(
                              petInfo,
                              style: CustomTextStyles.bodyMedium16Italic,
                              textAlign: TextAlign.start,
                            ),
                            SizedBox(
                              height: 20.v,
                            ),
                            Text(
                              "Sahip Bilgileri",
                              style: CustomTextStyles.bodyMedium16Italic,
                              textAlign: TextAlign.start,
                            ),
                            Text(
                              ownerInfo,
                              style: CustomTextStyles.bodyMedium16Italic,
                              textAlign: TextAlign.start,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(color: appTheme.deepOrangeA100Af),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 350.h,
                        child: Text(
                          "Müsait Günler:\n" + workerSchedule,
                          style: CustomTextStyles.bodyMedium16Italic,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
