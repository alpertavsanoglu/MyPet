import '../utils/app_export.dart';

class CustomLogo extends StatelessWidget {
  const CustomLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomImageView(
      imagePath: ImageConstant.imgMyPetRemoveBg,
      height: 90.v,
      width: 100.h,
    );
  }
}