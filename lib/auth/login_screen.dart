import 'package:danozone/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../classes/colors.dart';
import '../classes/main_class.dart';
import '../store/login_store/login_store.dart';
import '../widgets/button.dart';
import '../widgets/input_field.dart';

LoginStore store = LoginStore();
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);
  static const routeName = '/login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  FocusNode emailFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();

  LoginStore store = LoginStore();


  @override
  void initState() {
    store.setupValidations();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: ListView(
          padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 80.h),
          children: [
            Image.asset('assets/images/app_logo2.png', height: 37, width: 149,),
            MainClass.bH(40),
            Observer(
              builder: (ctx) => InputField(
                controller: emailController,
                type: TextInputType.emailAddress,
                hint: "Enter Email Address",
                onChanged: (text) {
                  store.email = text.trim();
                },
                message: store.error.email,
                error: store.error.email != null,
                color:  Colors.white,
                hintColor: AppColor.colorAppGray,
                textColor:  Colors.white,
                focusedColor: Colors.white,
                node: emailFocus,
              ),
            ),
            MainClass.bH(10),
            Observer(
              builder: (ctx) => InputField(
                controller: passwordController,
                type: TextInputType.text,
                hint: "Enter Password",
                obscureText: store.passwordVisible,
                suffixIcon: GestureDetector(
                    onTap: () {
                      store.passwordVisible = !store.passwordVisible;
                    },
                    child: IconButton(
                        icon: store.passwordVisible
                            ?  const Icon(Icons.visibility_off, color: AppColor.colorAppGray2,)
                            :  const Icon(Icons.visibility, color: AppColor.colorAppGray2,)
                    )),
                onChanged: (text) {
                  store.password = text.trim();
                },
                message: store.error.password,
                error: store.error.password != null,
                color:  passwordFocus.hasFocus?  AppColor.colorAppGray:Colors.white,
                hintColor: AppColor.colorAppGray,
                textColor:  Colors.white,
                focusedColor:  Colors.white,
                node: passwordFocus,
              ),
            ),
            MainClass.bH(180),
            Observer(
              builder: (ctx) => SizedBox(
                width: double.infinity,
                child: Button(
                    text: 'Sign in',
                    onPressed: () {
                      FocusScope.of(context).unfocus();
                      if(store.hasErrors){
                        return;
                      }else{
                        Navigator.pushNamed(context, HomeScreen.routeName);
                      }
                    },
                    loading: store.loading,
                    loaderColor: Colors.white,
                    textColor: Colors.white,
                    color: AppColor.colorApp
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
