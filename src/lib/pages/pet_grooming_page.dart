import '../utils/app_export.dart';

class PetGroomingJobScreen extends StatefulWidget {
  PetGroomingJobScreen({Key? key}) : super(key: key);

  @override
  State<PetGroomingJobScreen> createState() => _PetGroomingJobScreenState();
}

class _PetGroomingJobScreenState extends State<PetGroomingJobScreen> {
  bool isSecondPage = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    spreadRadius: 2.h,
                    blurRadius: 2.h,
                    offset: const Offset(0, 4))
              ],
              image: DecorationImage(
                  image: AssetImage(ImageConstant.imgPetGroomingJob),
                  fit: BoxFit.cover)),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.h, vertical: 12.v),
            child: Column(
              children: [
                _buildTopPanel(context),
                SizedBox(height: 27.v),
                if (!isSecondPage)
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          _petInfoWidget(context, ImageConstant.imgPet1PP,
                              StringConstant.petInfo6),
                          _petInfoWidget(context, ImageConstant.imgPet2PP,
                              StringConstant.petInfo7),
                          _petInfoWidget(context, ImageConstant.imgPet3PP,
                              StringConstant.petInfo8),
                          _petInfoWidget(context, ImageConstant.imgPet4PP,
                              StringConstant.petInfo9),
                          _petInfoWidget(context, ImageConstant.imgPet5PP,
                              StringConstant.petInfo10),
                          _petInfoWidget(context, ImageConstant.imgPet1PP,
                              StringConstant.petInfo6),
                        ],
                      ),
                    ),
                  )
                else
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          _jobInfoWidget(context, ImageConstant.imgJob1PP,
                              StringConstant.jobInfo6, 3),
                          _jobInfoWidget(context, ImageConstant.imgJob2PP,
                              StringConstant.jobInfo7, 2),
                          _jobInfoWidget(context, ImageConstant.imgJob3PP,
                              StringConstant.jobInfo8, 1),
                          _jobInfoWidget(context, ImageConstant.imgJob4PP,
                              StringConstant.jobInfo9, 0),
                          _jobInfoWidget(context, ImageConstant.imgJob5PP,
                              StringConstant.jobInfo10, 4),
                          _jobInfoWidget(context, ImageConstant.imgJob1PP,
                              StringConstant.jobInfo6, 1),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /* üst kısımdaki ok, çalışan bul, iş bul alanı */
  Widget _buildTopPanel(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 7.h),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          CustomArrowBack(),
          GestureDetector(
            onTap: () {
              onTapFindJobs(context);
            },
            child: Container(
                width: 152.h,
                padding: EdgeInsets.symmetric(horizontal: 26.h, vertical: 2.v),
                decoration: isSecondPage
                    ? AppDecoration.fillDeepOrangeC.copyWith(
                        borderRadius: BorderRadiusStyle.roundedBorder10)
                    : AppDecoration.fillLimeB.copyWith(
                        borderRadius: BorderRadiusStyle.roundedBorder10),
                child: Center(
                  child: Text("İş İlanları",
                      style: CustomTextStyles.headlineSmallWhiteA700),
                )),
          ),
          GestureDetector(
              onTap: () {
                onTapFindWorkers(context);
              },
              child: Container(
                  width: 152.h,
                  padding:
                      EdgeInsets.symmetric(horizontal: 17.h, vertical: 1.v),
                  decoration: isSecondPage
                      ? AppDecoration.fillLimeB.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder10)
                      : AppDecoration.fillDeepOrangeC.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder10),
                  child: Center(
                    child: Text("Çalışan Bul",
                        style: CustomTextStyles.headlineSmallWhiteA700),
                  )))
        ]));
  }

  /* her bir ilanın widgetı */
  Widget _petInfoWidget(
    BuildContext context,
    String imagePathString,
    String petInfoString,
  ) {
    return Padding(
      padding: EdgeInsets.only(left: 8.h, bottom: 9.v),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomImageView(
            onTap: () {
              onTapDetailsPet(context);
            },
            imagePath: imagePathString,
            height: 140.adaptSize,
            width: 140.adaptSize,
            radius: BorderRadius.circular(50.h),
            margin: EdgeInsets.only(top: 15.v, bottom: 15.v),
          ),
          GestureDetector(
            onTap: () {
              onTapDetailsPet(context);
            },
            child: SizedBox(
              height: 153.v,
              width: 245.h,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      height: 153.v,
                      width: 241.h,
                      decoration: BoxDecoration(
                        color: appTheme.deepOrange100Cc,
                        borderRadius: BorderRadius.circular(10.h),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Center(
                      child: SizedBox(
                        width: 230.h,
                        child: Text(
                          petInfoString,
                          maxLines: 7,
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.bodyMedium,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _jobInfoWidget(
    BuildContext context,
    String imagePathString,
    String petInfoString,
    int rating,
  ) {
    List<Widget> stars = [];
    for (int i = 0; i < 5; i++) {
      if (i < rating)
        stars.add(
          Icon(
            Icons.star,
            color: Colors.yellow,
            size: 20.adaptSize,
          ),
        );
      else {
        stars.add(Icon(
          Icons.star_border,
          color: Colors.yellow,
          size: 20.adaptSize,
        ));
      }
    }
    return Padding(
      padding: EdgeInsets.only(left: 8.h, bottom: 9.v),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(children: stars,),
              SizedBox(
                height: 5.v,
              ),
              CustomImageView(
                onTap: () {
                  onTapDetailsWorker(context);
                },
                imagePath: imagePathString,
                height: 140.adaptSize,
                width: 140.adaptSize,
                radius: BorderRadius.circular(50.h),
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              onTapDetailsWorker(context);
            },
            child: SizedBox(
              height: 153.v,
              width: 245.h,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      height: 153.v,
                      width: 241.h,
                      decoration: BoxDecoration(
                        color: appTheme.deepOrange100Cc,
                        borderRadius: BorderRadius.circular(10.h),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Center(
                      child: SizedBox(
                        width: 230.h,
                        child: Text(
                          petInfoString,
                          maxLines: 7,
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.bodyMedium,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  /// Navigates to the frontPageScreen when the action is triggered.
  onTapFindJobs(BuildContext context) {
    if (isSecondPage) {
      setState(() {
        isSecondPage = false;
        // true ise false, false ise true yap
      });
    }
  }

  /// Navigates to the frontPageScreen when the action is triggered.
  onTapFindWorkers(BuildContext context) {
    if (!isSecondPage) {
      setState(() {
        isSecondPage = true;
        // true ise false, false ise true yap
      });
    }
  }

  /// Navigates to the Pet info when the action is triggered.
  onTapDetailsPet(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.workInfoPageScreen);
  }

  /// Navigates to the worker info when the action is triggered.
  onTapDetailsWorker(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.workerInfoPageScreen);
  }
}
