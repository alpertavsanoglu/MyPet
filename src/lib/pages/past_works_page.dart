import '../utils/app_export.dart';

final List<String> exampleWorks = [
  "Köpek Gezdirme",
  "Kedi Bakımı",
  "Köpek Gezdirme",
  "Kedi Bakımı",
];
final List<String> exampleWorks2 = [
  "Kedi Gezdirme",
  "Köpek Bakımı",
  "Köpek Gezdirme",
  "Kedi Bakımı",
];

class PastWorksPageScreen extends StatefulWidget {
  final List<String> works1;
  final List<String> works2;
  const PastWorksPageScreen({
    Key? key,
    required this.works1,
    required this.works2,
  }) : super(
          key: key,
        );

  @override
  State<PastWorksPageScreen> createState() => _PastWorksPageScreenState();
}

class _PastWorksPageScreenState extends State<PastWorksPageScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: SizedBox(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              child: Column(
                children: [
                  Align(alignment: Alignment.topLeft, child: CustomArrowBack()),
                  CustomLogo(),
                  SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 14.v),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Alınan Hizmetler", style: CustomTextStyles.bodyMedium16Italic,
                            ),
                          ),
                          Container(
                            height: 280.v,
                            child: ListView.builder(
                              itemCount: widget.works1.length,
                              itemBuilder: (BuildContext context, int index) {
                                return works1Widget(
                                    context, widget.works1[index],true);
                              },
                            ),
                          ),
                          SizedBox(
                            height: 30.v,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Verilen Hizmetler", style: CustomTextStyles.bodyMedium16Italic,
                            ),
                          ),
                          Container(
                            height: 280.v,
                            child: ListView.builder(
                              itemCount: widget.works1.length,
                              itemBuilder: (BuildContext context, int index) {
                                return works1Widget(
                                    context, widget.works2[index], false);
                              },
                            ),
                          ),
                        ],
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

  Widget works1Widget(BuildContext context, String work, bool type) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Container(
        width: 361.h,
        height: 99.v,
        decoration: BoxDecoration(
            color: appTheme.blueGray100.withOpacity(0.8),
            borderRadius: BorderRadius.circular(15.h)),
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.all(8.0.v),
              child: Text(work, style: CustomTextStyles.bodyMedium16Italic),
            ),
          ),
          Align(
              alignment: Alignment.bottomRight,
              child: Container(
                decoration: BoxDecoration(
                    color: appTheme.deepOrangeA100Af,
                    borderRadius: BorderRadius.circular(15.h)),
                child: GestureDetector(
                  onTap: () {
                    type ? onTapReview() : onTapFeedBack();
                  },
                  child: Padding(
                    padding: EdgeInsets.all(8.0.v),
                    child: type ? Text("Değerlendir",
                        style: CustomTextStyles.bodyMedium16Italic) : Text("Geri Dönüş",
                        style: CustomTextStyles.bodyMedium16Italic),
                  ),
                ),
              ))
        ]),
      ),
    );
  }
  
  onTapReview(){
    Navigator.pushNamed(context, AppRoutes.workerReviewPageScreen);
  }

  onTapFeedBack(){
    Navigator.pushNamed(context, AppRoutes.workReviewPageScreen);
  }
}
