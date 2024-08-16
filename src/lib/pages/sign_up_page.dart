import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:myapp/firebase_auth_services/authServices.dart';
import '../utils/app_export.dart';
import '../classes/account.dart';
import '../classes/pet.dart';
import '../firebase_operations/FirestoreCommunication.dart';

class SignUpPageScreen extends StatefulWidget {
  SignUpPageScreen({Key? key}) : super(key: key);

  @override
  State<SignUpPageScreen> createState() => _SignUpPageScreenState();
}

class _SignUpPageScreenState extends State<SignUpPageScreen> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _mailAdressController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _passwordController1 = TextEditingController();
  TextEditingController _locationController = TextEditingController();

  bool showWrongIdentitalsError = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Container(
          height: 840.v,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomArrowBack(),
                if (!showWrongIdentitalsError)
                  SizedBox(
                    height: 10.v,
                  )
                else
                  Center(
                    child: Container(
                        width: 278.h,
                        height: 60.v,
                        decoration: BoxDecoration(
                            color: appTheme.blueGray100.withOpacity(0.8),
                            borderRadius: BorderRadius.circular(30.h)),
                        child: Center(
                          child: Text("Girdiğin bilgi yanlış",
                              style: CustomTextStyles.bodyMedium14),
                        )),
                  ),
                _customTextFieldWidget(
                    context, "Kullanıcı Adı", _usernameController),
                _customTextFieldWidget(
                    context, "Konum(İlçe)", _locationController),
                _customTextFieldWidgetNumber(
                    context, "Telefon Numarası", _phoneNumberController),
                _customTextFieldWidgetMail(
                    context, "Mail Adresi", _mailAdressController),
                _customTextFieldWidget(
                    context, "Şifre Oluştur", _passwordController1),
                _signUpWidget(context)
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
        height: 55.v,
        decoration: BoxDecoration(
            color: appTheme.blueGray100.withOpacity(0.8),
            borderRadius: BorderRadius.circular(30.h)),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: TextFormField(
              style: CustomTextStyles.bodyMediumTimmana,
              cursorColor: Colors.black,
              decoration: InputDecoration(border: InputBorder.none),
              controller: textController,
            ),
          ),
        ),
      ),
      SizedBox(height: 2.v),
    ]);
  }

  Widget _customTextFieldWidgetMail(BuildContext context, String topText,
      TextEditingController textController) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(topText, style: CustomTextStyles.bodyMedium15Italic),
      SizedBox(height: 2.v),
      Container(
        height: 55.v,
        decoration: BoxDecoration(
            color: appTheme.blueGray100.withOpacity(0.8),
            borderRadius: BorderRadius.circular(30.h)),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: TextFormField(
              style: CustomTextStyles.bodyMediumTimmana,
              cursorColor: Colors.black,
              decoration: InputDecoration(border: InputBorder.none),
              controller: textController,
              keyboardType: TextInputType.emailAddress,
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
            color: appTheme.blueGray100.withOpacity(0.8),
            borderRadius: BorderRadius.circular(30.h)),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: TextFormField(
              style: CustomTextStyles.bodyMediumTimmana,
              cursorColor: Colors.black,
              decoration: InputDecoration(border: InputBorder.none),
              controller: textController,
              keyboardType: TextInputType.number,
            ),
          ),
        ),
      ),
      SizedBox(height: 2.v),
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
                              color: appTheme.gray800Ef.withOpacity(0.4),
                              borderRadius: BorderRadius.circular(30.h)))),
                  Align(
                      alignment: Alignment.center,
                      child: Text("Kayıt Ol",
                          style:
                              CustomTextStyles.headlineLargeTimmanaBlackItalic))
                ])),
          )),
    );
  }

  /// _usernameController
  /// _locationController
  /// _mailAdressController
  /// _phoneNumberController
  /// _passwordController1
  /// veriler sırasıyla yukarıdaki gibi
  /// her birinin sonuna .text ekleyerek string olarak erişilebilir
  /// aşağıdaki fonksiyon Register butonuna basınca çalışacak fonksiyon
  /// if parantez içi herhangi bi verinin yanlış olduğuyla alakalı olacak
  onTapSignUp(BuildContext context) async {
    String userName = _usernameController.text;
    String location = _locationController.text;
    String email = _mailAdressController.text;
    String phone = _phoneNumberController.text;
    String pass = _passwordController1.text;

    final authServices _auth = authServices();
    User? user = await _auth.signUpWithEmailAndPassword(email, pass);
    print("${user?.email}\n");

    if (user == null) {
      setState(() {
        print("fail\n");
        showWrongIdentitalsError = true;
      });
    } else {
      print("User created!\n");
      _auth.sendEmailVerification();
      account newAccount = account(userName, location, email, phone);
      //testing account
      //comment print if needed
      // print("Account communication info;\n ${newAccount.getCommInfo()}\n");
      //To write data to firestore first need to generate an instance.
      FirestoreCommunication fsc1 = FirestoreCommunication();
      //Passing acocunt object to FirestoreCommunication instance to store in Firestore.
      fsc1.addToFirestore(newAccount);

      Navigator.pushNamed(context, AppRoutes.logInPageScreen);
    }
  }
}
