import 'package:ecomerance_app/CustomWidgets/CustomTextformField.dart';
import 'package:ecomerance_app/routes/route_name.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../CustomWidgets/appText.dart';
import '../AppColors/appcolors.dart';
import '../CustomWidgets/CustomButton.dart';
import '../controllers/checkout_screen_controller.dart';
import 'checkout_payment_tabs/card_payment.dart';
import 'checkout_payment_tabs/cash_payment.dart';
import 'checkout_payment_tabs/pay_payment.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  final CheckoutController controller = Get.put(CheckoutController());
  List<String> paymentType = ["Card", "Cash", "Pay"];
  List<String> imagePathList = [
    "assets/icons/card.svg",
    "assets/icons/cash.svg",
    "assets/icons/apple.svg"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        backgroundColor: AppColors.primary,
        centerTitle: true,
        title: const Text(
          'Checkout Screen',
          style: TextStyle(color: Colors.white),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Icon(Icons.notifications_outlined, color: Colors.white),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: DefaultTabController(
          length: 3,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const AppText(
                        text: 'Delivery Address',
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(RouteName.addressScreen);
                        },
                        child: const AppText(
                          text: 'Change',
                          fontSize: 14,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.location_on_outlined),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(
                            text: 'Home',
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                          AppText(
                            text: '925 S Chugach St #APT 10, Alaska 99645',
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            textColor: Colors.grey,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(5, 5, 15, 5),
                    child: Divider(
                      color: Colors.grey.shade200,
                      height: 1,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const AppText(
                    text: 'Payment Method',
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  Obx(
                    () => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 40,
                        child: TabBar(
                          // isScrollable: true,
                          dividerColor: Colors.transparent,
                          indicator: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.transparent,
                          ),
                          onTap: (index) {
                            controller.changeTabIndex(index);
                          },
                          tabs:
                              paymentType.asMap().entries.map<Widget>((entry) {
                            final type = entry.value;
                            final imagePath = imagePathList[entry.key];
                            return Tab(
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () {
                                    controller.changeTabIndex(entry.key);
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 1),
                                    height: 100,
                                    width: 90,
                                    decoration: BoxDecoration(
                                      color:
                                          controller.selectedIndex == entry.key
                                              ? AppColors.primary
                                              : Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color: controller.selectedIndex ==
                                                entry.key
                                            ? Colors.transparent
                                            : Colors.grey.shade200,
                                        width: 2,
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(
                                          imagePath,
                                          width: 18,
                                          height: 18,
                                          color: controller.selectedIndex ==
                                                  entry.key
                                              ? Colors.white
                                              : Colors.black,
                                        ),
                                        const SizedBox(width: 8),
                                        Text(
                                          type,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleLarge!
                                              .merge(
                                                TextStyle(
                                                  color: controller
                                                              .selectedIndex ==
                                                          entry.key
                                                      ? Colors.white
                                                      : Colors.black,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 12,
                                                ),
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 150,
                    child: Expanded(
                      flex: 1,
                      child: Obx(() {
                        switch (controller.selectedIndex) {
                          case 0:
                            return const CardPayment();
                          case 1:
                            return const CashPayment();
                          case 2:
                            return const PayPayment();
                          default:
                            return const SizedBox.shrink();
                        }
                      }),
                    ),
                  ),
                  const AppText(
                    text: 'Order Summary',
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    textColor: Colors.black,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppText(
                        text: 'Sub-total',
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        textColor: Colors.grey,
                      ),
                      AppText(
                        text: '\$ 5,870',
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppText(
                        text: 'Vat(%)',
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        textColor: Colors.grey,
                      ),
                      AppText(
                        text: '\$ 0.00',
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppText(
                        text: 'Shipping fee',
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        textColor: Colors.grey,
                      ),
                      AppText(
                        text: '\$ 80',
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(5, 5, 15, 5),
                    child: Divider(
                      color: Colors.grey.shade200,
                      height: 1,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppText(
                        text: 'Total',
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        textColor: Colors.grey,
                      ),
                      AppText(
                        text: '\$ 5,950',
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 52,
                        width: MediaQuery.of(context).size.width * .6,
                        child: CustomTextFormField(
                            borderColor: Colors.grey,
                            prefixIcon: Icons.card_giftcard_sharp,
                            bgColor: Colors.white,
                            hintText: 'Enter promo code'),
                      ),
                      CustomButton(
                        width: MediaQuery.of(context).size.width * .25,
                        height: 52,
                        onTap: () {
                          // Get.toNamed(RouteName.checkoutScreen);
                        },
                        label: 'Add',
                        bgColor: AppColors.primary,
                        labelColor: Colors.white,
                        fontSize: 18,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  CustomButton(
                    onTap: () {
                      _showSuccessDialog(context);
                    },
                    label: 'Place Order',
                    bgColor: AppColors.primary,
                    labelColor: Colors.white,
                    fontSize: 18,
                  )
                ],
              ),
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
          title: SvgPicture.asset('assets/icons/done.svg'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                text: 'Congratulations!',
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
              AppText(
                text: 'Your order has been placed.',
                fontWeight: FontWeight.w400,
                fontSize: 14,
                textColor: Colors.grey,
              ),
            ],
          ),
          actions: [
            CustomButton(
              onTap: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              label: 'Track Your Order',
              labelColor: Colors.white,
              bgColor: AppColors.primary,
            ),
          ],
        );
      },
    );
  }
}
