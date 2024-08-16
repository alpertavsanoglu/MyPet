  import '../utils/app_export.dart';

  class CustomArrowBack extends StatelessWidget {

  CustomArrowBack();

  void onTapArrowBack(BuildContext context) {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTapArrowBack(context);
      },
      child: CustomImageView(
        imagePath: ImageConstant.imgArrowBack,
        height: 40.adaptSize,
        width: 40.adaptSize,
        margin: EdgeInsets.only(bottom: 5.v),
      ),
    );
  }
}