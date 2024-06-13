import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../AppColors/appcolors.dart';
import '../CustomWidgets/CustomButton.dart';
import '../CustomWidgets/CustomIconButton.dart';
import '../CustomWidgets/CustomTextformField.dart';
import '../CustomWidgets/appText.dart';
import '../routes/route_name.dart';
import 'bottom_navigationbar_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool checkValue = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const AppText(
                  text: 'Login to your Account',
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
                const SizedBox(
                  height: 50,
                ),
                const CustomTextFormField(
                  hintText: 'Email',
                  prefixIcon: Icons.email,
                ),
                const SizedBox(
                  height: 20,
                ),
                const CustomTextFormField(
                  hintText: 'Password',
                  prefixIcon: Icons.lock,
                ),
                Row(
                  children: [
                    Checkbox(
                        activeColor: AppColors.primary,
                        value: checkValue,
                        onChanged: (value) {
                          setState(() {
                            checkValue = value!;
                          });
                        }),
                    const AppText(
                      text: 'Remember me',
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomButton(
                  onTap: () {
                    Get.to(
                      BottomNevigationBar(),
                    );
                  },
                  label: 'Sign In',
                  bgColor: AppColors.primary,
                  labelColor: Colors.white,
                  borderRadius: 50,
                  height: 50,
                ),
                const SizedBox(
                  height: 40,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: <Widget>[
                      Expanded(child: Divider(color: Colors.grey)),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        child: AppText(text: "Or Continue with", fontSize: 12),
                      ),
                      Expanded(child: Divider(color: Colors.grey)),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomIconButton(
                      imgPath: 'assets/icons/facebook.svg',
                    ),
                    CustomIconButton(
                      imgPath: 'assets/icons/google.svg',
                    ),
                    CustomIconButton(
                      imgPath: 'assets/icons/apple.svg',
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                RichText(
                  text: TextSpan(
                    text: "Already have an account ?  ",
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Get.toNamed(RouteName.signUpScreen);
                          },
                        text: 'Sign Up',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
