import '../utils/app_export.dart';

class WorkerReviewPageScreen extends StatefulWidget {
  WorkerReviewPageScreen({Key? key}) : super(key: key);

  @override
  State<WorkerReviewPageScreen> createState() => _WorkerReviewPageScreenState();
}

class _WorkerReviewPageScreenState extends State<WorkerReviewPageScreen> {
  int currentRate = 0;
  TextEditingController _reviewController = TextEditingController();
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
                  _textFieldReview(context),
                  SizedBox(
                    height: 40.v,
                  ),
                  reviewWidget(context, currentRate),
                  SizedBox(
                    height: 30.v,
                  ),
                  _saveWidget(context),
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
          GestureDetector(
            onTap: () {
              setState(() {
              currentRate = i + 1;
            });
            },
            child: Icon(
              Icons.star,
              color: Colors.yellow,
              size: 50.adaptSize,
            ),
          ),
        );
      else {
        stars.add(GestureDetector(
          onTap: () {
            setState(() {
              currentRate = i + 1;
            });
          },
          child: Icon(
            Icons.star_border,
            color: Colors.yellow,
            size: 50.adaptSize,
          ),
        ));
      }
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: stars,
    );
  }

  Widget _saveWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: GestureDetector(
          onTap: () {
            onTapSave(context);
          },
          child: SizedBox(
            height: 125.v,
            width: 250.h,
            child: Align(
                alignment: Alignment.topCenter,
                child: Container(
                    child: Align(
                        alignment: Alignment.center,
                        child: Text("Kaydet",
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

  Widget _textFieldReview(BuildContext context) {
    return Container(
      height: 285.v,
      width: 360.h,
      decoration: BoxDecoration(
          color: appTheme.blueGray100.withOpacity(0.8),
          borderRadius: BorderRadius.circular(15.h)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Expanded(
          child: TextFormField(
            style: CustomTextStyles.headlineLargeTimmanaBlackItalic,
            cursorColor: Colors.black,
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: StringConstant.hintTextFormField,
                hintStyle:
                    CustomTextStyles.headlineLargeTimmanaBlackItalicHint),
            controller: _reviewController,
            keyboardType: TextInputType.multiline,
            maxLines: 10,
            maxLength: 140,
          ),
        ),
      ),
    );
  }

  /// save alacak
  onTapSave(BuildContext context) {}
}
