import '../utils/app_export.dart';

class WorkAdPageScreen extends StatefulWidget {
  const WorkAdPageScreen({Key? key}) : super(key: key);

  @override
  State<WorkAdPageScreen> createState() => _WorkAdPageScreenState();
}

class _WorkAdPageScreenState extends State<WorkAdPageScreen> {
  final TextEditingController _breedController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _timesController = TextEditingController();
  final TextEditingController _detailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: SizedBox(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomArrowBack(),
                Center(child: CustomLogo()),
                Center(
                  child: Text("İş İlanı Oluştur",
                      style: theme.textTheme.headlineLarge!.copyWith(
                          color: Colors.black, fontStyle: FontStyle.italic)),
                ),
                SizedBox(
                  height: 10.v,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.v),
                  child: Column(
                    children: [
                      _customTextFieldWidget(
                          context, "Tür/Cins", _breedController),
                      _customTextFieldWidgetNumber(
                          context, "Telefon Numarası", _phoneNumberController),
                      _customTextFieldWidgetLong(
                          context, "Müsait Zamanlar", _timesController),
                      _customTextFieldWidgetLong(
                          context, "İş Detayı ve Notlar", _detailController),
                    ],
                  ),
                ),
                _signUpWidget(context),
              ],
            ),
          ),
        ),
      ),
    ));
  }

  Widget _customTextFieldWidget(BuildContext context, String topText,
      TextEditingController textController) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(topText, style: CustomTextStyles.bodyMedium15Italic),
      SizedBox(height: 2.v),
      Container(
        height: 60.v,
        decoration: BoxDecoration(
          color: Color(0xFF00008B).withOpacity(0.12),
          border: Border.all(
            color: appTheme.borderDarkBlue,
            width: 1.5,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: TextFormField(
              style: CustomTextStyles.bodyMediumTimmana,
              cursorColor: Colors.black,
              decoration: const InputDecoration(border: InputBorder.none),
              controller: textController,
            ),
          ),
        ),
      ),
      SizedBox(height: 2.v),
    ]);
  }

  Widget _customTextFieldWidgetNumber(BuildContext context, String topText,
      TextEditingController textController) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(topText, style: CustomTextStyles.bodyMedium15Italic),
      SizedBox(height: 2.v),
      Container(
        height: 55.v,
        decoration: BoxDecoration(
          color: Color(0xFF00008B).withOpacity(0.12),
          border: Border.all(
            color: appTheme.borderDarkBlue,
            width: 1.5,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: TextFormField(
              style: CustomTextStyles.bodyMediumTimmana,
              cursorColor: Colors.black,
              decoration: const InputDecoration(border: InputBorder.none),
              controller: textController,
              keyboardType: TextInputType.number,
            ),
          ),
        ),
      ),
      SizedBox(height: 2.v),
    ]);
  }

  Widget _customTextFieldWidgetLong(BuildContext context, String topText,
      TextEditingController textController) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(topText, style: CustomTextStyles.bodyMedium15Italic),
      Container(
        height: 150.v,
        width: 369.h,
        decoration: BoxDecoration(
          color: Color(0xFF00008B).withOpacity(0.12),
          border: Border.all(
            color: appTheme.borderDarkBlue,
            width: 1.5,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: Expanded(
            child: TextFormField(
              style: CustomTextStyles.bodyMediumTimmana,
              cursorColor: Colors.black,
              decoration: InputDecoration(border: InputBorder.none),
              controller: textController,
              keyboardType: TextInputType.multiline,
              maxLines: 10,
            ),
          ),
        ),
      ),
    ]);
  }

  Widget _signUpWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: GestureDetector(
          onTap: () {
            onTapSignUp(context);
          },
          child: Center(
            child: SizedBox(
                height: 60.v,
                width: 150.h,
                child: Stack(alignment: Alignment.center, children: [
                  Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                          height: 61.v,
                          width: 369.h,
                          decoration: BoxDecoration(
                            color: Color(0xFF00008B).withOpacity(0.12),
                            borderRadius: BorderRadius.circular(30.h),
                            border: Border.all(
                              color: appTheme.borderDarkBlue, // Sınır rengi
                              width: 1.5, // Sınır genişliği
                            ),
                          ))),
                  Align(
                      alignment: Alignment.center,
                      child: Text("Oluştur",
                          style:
                              CustomTextStyles.headlineLargeTimmanaBlackItalic))
                ])),
          )),
    );
  }

  onTapSignUp(BuildContext context) async {
    Navigator.pushNamed(context, AppRoutes.frontPageScreen);
  }
}
