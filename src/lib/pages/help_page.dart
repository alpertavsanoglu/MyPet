import 'package:myapp/firebase_operations/FirestoreCommunication.dart';
import "../firebase_operations/FirestoreCommunication.dart";
import 'package:firebase_core/firebase_core.dart';
import '../utils/app_export.dart';
import "package:myapp/global.dart";

class HelpPageScreen extends StatefulWidget {
  const HelpPageScreen({Key? key}) : super(key: key);

  @override
  State<HelpPageScreen> createState() => _HelpPageScreenState();
}

class _HelpPageScreenState extends State<HelpPageScreen> {
  TextEditingController _topicController = TextEditingController();
  TextEditingController _complainController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: appTheme.whiteA700,
            body: SizedBox(
                height: 873.v,
                width: double.maxFinite,
                child: Stack(alignment: Alignment.center, children: [
                  CustomImageView(
                      imagePath: ImageConstant.imgHelpPageBg,
                      height: 850.v,
                      width: 393.h,
                      alignment: Alignment.center),
                  Align(
                      alignment: Alignment.center,
                      child: SingleChildScrollView(
                          child: Container(
                              height: 750.v,
                              width: double.maxFinite,
                              margin: EdgeInsets.only(bottom: 89.v),
                              padding: EdgeInsets.symmetric(horizontal: 11.h),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomArrowBack(),
                                    Center(child: CustomLogo()),
                                    _textFieldTopic(context),
                                    _textFieldComplain(context),
                                    _sendButton(context),
                                  ]))))
                ]))));
  }

  /// Section Widget
  Widget _textFieldTopic(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("Şikayet Konusu:", style: theme.textTheme.titleLarge),
      Container(
        height: 61.v,
        width: 369.h,
        decoration: BoxDecoration(
            color: appTheme.blueGray100.withOpacity(0.8),
            borderRadius: BorderRadius.circular(30.h)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: TextFormField(
            style: CustomTextStyles.bodyMediumTimmana,
            cursorColor: Colors.black,
            decoration: InputDecoration(border: InputBorder.none),
            controller: _topicController,
          ),
        ),
      )
    ]);
  }

  Widget _textFieldComplain(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("Şikayet Metni:", style: theme.textTheme.titleLarge),
      Container(
        height: 285.v,
        width: 369.h,
        decoration: BoxDecoration(
            color: appTheme.blueGray100.withOpacity(0.8),
            borderRadius: BorderRadius.circular(30.h)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Expanded(
            child: TextFormField(
              style: CustomTextStyles.bodyMediumTimmana,
              cursorColor: Colors.black,
              decoration: InputDecoration(border: InputBorder.none),
              controller: _complainController,
              keyboardType: TextInputType.multiline,
              maxLines: 10,
              maxLength: 400,
            ),
          ),
        ),
      ),
    ]);
  }

  Widget _sendButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: GestureDetector(
          onTap: () {
            onTapSend(context);
          },
          child: Center(
            child: Container(
                height: 60.v,
                width: 150.h,
                child: Stack(alignment: Alignment.center, children: [
                  Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                          height: 61.v,
                          width: 369.h,
                          decoration: BoxDecoration(
                              color: appTheme.blueGray100.withOpacity(0.8),
                              borderRadius: BorderRadius.circular(30.h)))),
                  Align(
                      alignment: Alignment.center,
                      child: Text("Oluştur",
                          style:
                              CustomTextStyles.headlineLargeTimmanaBlackItalic))
                ])),
          )),
    );
  }

  /// Navigates to the frontPageScreen when the action is triggered.
  onTapArrowBack(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.frontPageScreen);
  }

  onTapSend(BuildContext context) {
    String userTopic = _topicController.text;
    String userText = _complainController.text;
    Firebase.initializeApp();
    FirestoreCommunication fscHelp = FirestoreCommunication();

    String? mailAdd = acc?.getMail();
    print(mailAdd);
    fscHelp.addHelpToFirestore(userTopic, userText, mailAdd);

    Navigator.pushNamed(context, AppRoutes.frontPageScreen);
  }
}
