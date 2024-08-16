import '../utils/app_export.dart';

final String workReview =
    "Aldığımız hizmetten gerçekten memnun kaldık. Evden alıp işyerine teslim etmesini rica etmiştik. Kabul etti. Tekrar çalışılır.Aldığımız hizmetten gerçekten memnun kaldık. Evden alıp işyerine teslim etmesini rica etmiştik. Kabul etti. Tekrar çalışılır.";
final int workRating = 4;

class WorkReviewPageScreen extends StatefulWidget {
  final String review;
  final int rating;

  WorkReviewPageScreen({Key? key, required this.review, required this.rating})
      : super(key: key);

  @override
  State<WorkReviewPageScreen> createState() => _WorkReviewPageScreenState();
}

class _WorkReviewPageScreenState extends State<WorkReviewPageScreen> {
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
                  SizedBox(
                    height: 30.v,
                  ),
                  Container(
                    width: 336.h,
                    height: 374.v,
                    child: SingleChildScrollView(
                      child: Text(
                        widget.review,
                        style: CustomTextStyles.headlineLargeTimmanaBlackItalic,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.v,
                  ),
                  reviewWidget(context, widget.rating),
                  SizedBox(
                    height: 30.v,
                  ),
                  _thankWidget(context),
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
            size: 50.adaptSize,
          ),
        );
      else {
        stars.add(Icon(
          Icons.star_border,
          color: Colors.yellow,
          size: 50.adaptSize,
        ));
      }
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: stars,
    );
  }

  Widget _thankWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: GestureDetector(
          onTap: () {
            onTapThank(context);
          },
          child: SizedBox(
            height: 125.v,
            width: 250.h,
            child: Align(
                alignment: Alignment.topCenter,
                child: Container(
                    child: Align(
                        alignment: Alignment.center,
                        child: Text("Teşekkür Et",
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

  /// teşekkür edilecek 
  onTapThank(BuildContext context) {
  }
}
