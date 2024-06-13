import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../CustomWidgets/appText.dart';
import '../../routes/route_name.dart';

class CardPayment extends StatefulWidget {
  const CardPayment({super.key});

  @override
  State<CardPayment> createState() => _CardPaymentState();
}

class _CardPaymentState extends State<CardPayment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: GestureDetector(
          onTap: () {
            Get.toNamed(RouteName.paymentMethodScreen);
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppText(
                  text: 'Visa',
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
                SizedBox(
                  width: 10,
                ),
                AppText(
                  text: '**** **** **** 2512',
                  fontWeight: FontWeight.w500,
                ),
                Spacer(),
                Icon(Icons.edit),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
