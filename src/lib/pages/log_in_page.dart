import 'package:myapp/firebase_auth_services/authServices.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:myapp/testClasses/testaccount.dart';
import '../utils/app_export.dart';
import '../classes/account.dart';
import '../classes/pet.dart';
import '../firebase_operations/FirestoreCommunication.dart';
import '../testClasses/testaccount.dart';
import '../global.dart';

class LogInPageScreen extends StatefulWidget {
  LogInPageScreen({Key? key}) : super(key: key);

  @override
  State<LogInPageScreen> createState() => _LogInPageScreenState();
}

class _LogInPageScreenState extends State<LogInPageScreen> {
  TextEditingController _emailController = TextEditingController();

  TextEditingController _passwordController = TextEditingController();

  bool showWrongIdentitalsError = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: true,
          body: SingleChildScrollView(
            child: Container(
                width: MediaQuery.of(context).size.width,
                height: 850.v,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          spreadRadius: 2.h,
                          blurRadius: 2.h,
                          offset: const Offset(0, 4))
                    ],
                    image: DecorationImage(
                        image: AssetImage(ImageConstant.imgLoginBg),
                        fit: BoxFit.cover)),
                child: SizedBox(
                    width: double.maxFinite,
                    child: Column(mainAxisSize: MainAxisSize.min, children: [
                      SizedBox(height: 52.v),
                      Expanded(
                          child: Padding(
                              padding: EdgeInsets.only(
                                  left: 57.h, right: 57.h, bottom: 117.v),
                              child: Column(children: [
                                CustomLogo(),
                                SizedBox(
                                  height: 163.v,
                                ),
                                if (showWrongIdentitalsError)
                                  Container(
                                      width: 278.h,
                                      height: 60.v,
                                      decoration: AppDecoration
                                          .outlineBlack900Opac
                                          .copyWith(
                                              borderRadius: BorderRadiusStyle
                                                  .roundedBorder10),
                                      child: Center(
                                        child: Text(
                                            "Kullanıcı adı veya şifre yanlış.",
                                            style: CustomTextStyles
                                                .bodyMedium14White),
                                      ))
                                else
                                  SizedBox(
                                    height: 60.v,
                                  ),
                                SizedBox(
                                  height: 10.v,
                                ),
                                SizedBox(
                                    height: 79.v,
                                    width: 278.h,
                                    child: Stack(
                                        alignment: Alignment.topLeft,
                                        children: [
                                          Align(
                                              alignment: Alignment.bottomCenter,
                                              child: Container(
                                                height: 57.v,
                                                width: 278.h,
                                                decoration: BoxDecoration(
                                                    color: appTheme
                                                        .lightGreen508901,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            28.h),
                                                    //border: Border.all(
                                                    //color: appTheme.gray600,
                                                    //width: 10.h),
                                                    boxShadow: [
                                                      BoxShadow(
                                                          color: appTheme
                                                              .black900
                                                              .withOpacity(
                                                                  0.25),
                                                          spreadRadius: 2.h,
                                                          blurRadius: 2.h,
                                                          offset: const Offset(
                                                              0, 4))
                                                    ]),
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 8.v),
                                                  child: TextFormField(
                                                    style: const TextStyle(
                                                        fontSize: 14,
                                                        decoration:
                                                            TextDecoration
                                                                .none),
                                                    cursorColor: Colors.black,
                                                    decoration:
                                                        const InputDecoration(
                                                            border: InputBorder
                                                                .none),
                                                    controller:
                                                        _emailController,
                                                  ),
                                                ),
                                              )),
                                          Align(
                                              alignment: Alignment.topLeft,
                                              child: Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 19.h),
                                                  child: Text("KULLANICI ADI",
                                                      style: theme
                                                          .textTheme.bodyLarge!
                                                          .copyWith(
                                                              fontStyle:
                                                                  FontStyle
                                                                      .italic))))
                                        ])),
                                SizedBox(height: 24.v),
                                SizedBox(
                                    height: 79.v,
                                    width: 278.h,
                                    child: Stack(
                                        alignment: Alignment.topLeft,
                                        children: [
                                          Align(
                                              alignment: Alignment.bottomCenter,
                                              child: Container(
                                                height: 57.v,
                                                width: 278.h,
                                                decoration: BoxDecoration(
                                                    color:
                                                        appTheme.lightGreen5089,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            28.h),
                                                    //border: Border.all(
                                                    //color: appTheme.gray600,
                                                    //width: 10.h),
                                                    boxShadow: [
                                                      BoxShadow(
                                                          color: appTheme
                                                              .black900
                                                              .withOpacity(
                                                                  0.25),
                                                          spreadRadius: 2.h,
                                                          blurRadius: 2.h,
                                                          offset: const Offset(
                                                              0, 4))
                                                    ]),
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 8.v),
                                                  child: TextFormField(
                                                    obscureText: true,
                                                    style: const TextStyle(
                                                        fontSize: 14,
                                                        decoration:
                                                            TextDecoration
                                                                .none),
                                                    cursorColor: Colors.black,
                                                    decoration:
                                                        const InputDecoration(
                                                            border: InputBorder
                                                                .none),
                                                    controller:
                                                        _passwordController,
                                                  ),
                                                ),
                                              )),
                                          Align(
                                              alignment: Alignment.topLeft,
                                              child: Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 19.h),
                                                  child: Text("ŞİFRE",
                                                      style: theme
                                                          .textTheme.bodyLarge!
                                                          .copyWith(
                                                              fontStyle:
                                                                  FontStyle
                                                                      .italic))))
                                        ])),
                                SizedBox(height: 29.v),
                                GestureDetector(
                                    onTap: () {
                                      onTapLogin(context);
                                    },
                                    child: Container(
                                        width: 159.h,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 30.h, vertical: 8.v),
                                        decoration: AppDecoration
                                            .outlineBlack900
                                            .copyWith(
                                                borderRadius: BorderRadiusStyle
                                                    .customBorderTL22),
                                        child: Center(
                                          child: Text("Giriş Yap",
                                              style: CustomTextStyles
                                                  .headlineLargeTimmanaItalic),
                                        ))),
                                SizedBox(height: 22.v),
                                GestureDetector(
                                    onTap: () {
                                      onTapSignUp(context);
                                    },
                                    child: Container(
                                        width: 159.h,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 30.h, vertical: 8.v),
                                        decoration: AppDecoration
                                            .outlineBlack900
                                            .copyWith(
                                                borderRadius: BorderRadiusStyle
                                                    .customBorderTL22),
                                        child: Center(
                                          child: Text("Kayıt Ol",
                                              style: CustomTextStyles
                                                  .headlineLargeTimmanaItalic),
                                        )))
                              ])))
                    ]))),
          )),
    );
  }

  /* giriş yapa basılınca tetiklenecek fonksiyon */
  /* _emailController.text ile email alanına girilen veriye string olarak */
  /* _passwordController.text ile şifre alanına girilen veriye erişilebilir */
  /* bunlar kontrol edilip aşağıdaki setState ve Navigator pushnamed fonksiyonları tetiklenecek */
  onTapLogin(BuildContext context) async {
    String email = _emailController.text;
    String pw = _passwordController.text;

    final authServices _auth = authServices();
    User? user = await _auth.signInWithEmailAndPassword(email, pw);
    if (user == null) {
      print("Login fail!\n");
      setState(() {
        showWrongIdentitalsError = true;
      });
    } else {
      if (user.emailVerified) {
        print("Succesful login!\n");
        FirestoreCommunication fsc1 = FirestoreCommunication();
        account tempAccount = await fsc1.readFromFStore(email);
        acc =account.copy(tempAccount);
        print(acc.getUserName());
        Navigator.pushNamed(context, AppRoutes.frontPageScreen);
      } else {
        print("Verify your email and try again!\n");

        ///Email verification message should add here to show on the screen!!!
        setState(() {
          showWrongIdentitalsError = true;
        });
      }
    }
  }

  /* kayıt ola basılınca tetiklenecek fonksiyon */
  /* sign up page bitmediği için şuanlık home page e yolluyor */
  onTapSignUp(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.signUpPageScreen);
  }
}
