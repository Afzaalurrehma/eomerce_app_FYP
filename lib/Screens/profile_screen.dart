import 'package:ecomerance_app/Screens/favourite_screen.dart';
import 'package:ecomerance_app/Screens/signin_screen.dart';
import 'package:ecomerance_app/routes/route_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../AppColors/appcolors.dart';
import '../CustomWidgets/CustomButton.dart';
import '../CustomWidgets/appText.dart';
import '../CustomWidgets/customListTile.dart';

class ProfileScreen extends StatefulWidget {
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Icon(Icons.settings_outlined),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              children: [
                Card(
                  elevation: 10,
                  shadowColor: AppColors.lightPrimary,
                  child: Container(
                    width: double.infinity,
                    height: 70,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      leading: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      title: AppText(
                        text: 'Muhammad Anus',
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                      subtitle: AppText(
                        text: 'anusakhtar@gmail.com',
                        textColor: Colors.grey,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade200, width: 2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      CustomListTile(
                        title: 'Personal Details',
                        icon: Icons.person_outline,
                      ),
                      CustomListTile(
                          title: 'My Order', icon: Icons.shopping_bag_outlined),
                      CustomListTile(
                        onTap: () {
                          Get.to(() => FavouriteScreen());
                        },
                        title: 'My Favourites',
                        icon: Icons.favorite_outline,
                      ),
                      CustomListTile(
                        title: 'Shipping Address',
                        icon: Icons.local_shipping_outlined,
                      ),
                      CustomListTile(
                        title: 'My Card',
                        icon: Icons.credit_card_outlined,
                      ),
                      CustomListTile(
                        title: 'Settings',
                        icon: Icons.settings_outlined,
                        onTap: () {
                          Get.toNamed(RouteName.settingScreen);
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade200, width: 2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      CustomListTile(
                        title: 'FAQs',
                        icon: Icons.help_outline,
                        onTap: () {
                          Get.toNamed(RouteName.faqsScreen);
                        },
                      ),
                      CustomListTile(
                        title: 'Help And Support',
                        icon: Icons.support_agent_outlined,
                        onTap: () {
                          Get.toNamed(RouteName.helpAndSupportScreen);
                        },
                      ),
                      CustomListTile(
                        title: 'Languages',
                        icon: Icons.language_outlined,
                        onTap: () {
                          Get.toNamed(RouteName.languageScreen);
                        },
                      ),
                      CustomListTile(
                        title: 'Notifications',
                        icon: Icons.notifications_off_outlined,
                        onTap: () {
                          Get.toNamed(RouteName.notifications);
                        },
                      ),
                      CustomListTile(
                        title: 'Security',
                        icon: Icons.security_outlined,
                        onTap: () {
                          Get.toNamed(RouteName.securityScreen);
                        },
                      ),
                      CustomListTile(
                        title: 'Legal and Polices',
                        icon: Icons.policy_outlined,
                        onTap: () {
                          Get.toNamed(RouteName.legalAndPolicyScreen);
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade200, width: 2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      CustomListTile(
                        title: 'Logout',
                        icon: Icons.logout,
                        onTap: () {
                          _showSuccessDialog(context);
                        },
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

  void _showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Icon(Icons.close))),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                textAlign: TextAlign.center,
                text: 'Are you sure you want to logout?',
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
            ],
          ),
          actions: [
            CustomButton(
              onTap: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              label: 'Cancel',
              labelColor: Colors.white,
              bgColor: AppColors.primary,
            ),
            CustomButton(
              onTap: () {
                Navigator.of(context).pop(); // Close the dialog
                Get.offAll(() => SignInScreen());
              },
              label: 'Log Out',
              labelColor: Colors.red,
              bgColor: Colors.transparent,
            ),
          ],
        );
      },
    );
  }
}
