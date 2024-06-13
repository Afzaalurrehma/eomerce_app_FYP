import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../AppColors/appcolors.dart';
import '../CustomWidgets/CustomButton.dart';
import '../CustomWidgets/CustomTextformField.dart';
import '../CustomWidgets/appText.dart';


class NewCard extends StatefulWidget {
  const NewCard({super.key});

  @override
  State<NewCard> createState() => _NewCardState();
}

class _NewCardState extends State<NewCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('New Card'),
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Icon(Icons.notifications_outlined),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText(
              text: 'Add Debit or Credit Card',
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
            const SizedBox(
              height: 10,
            ),
            const AppText(
              text: 'Card Number',
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
            const SizedBox(
              height: 5,
            ),
            CustomTextFormField(
              hintText: 'Enter your Card Number',
              borderColor: Colors.grey.shade300,
              bgColor: Colors.white,
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const AppText(
                      text: 'Expiry Date',
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextFormField(
                      width: MediaQuery.of(context).size.width * .43,
                      hintText: 'MM/YY',
                      borderColor: Colors.grey.shade300,
                      bgColor: Colors.white,
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const AppText(
                      text: 'Security Code',
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextFormField(
                      width: MediaQuery.of(context).size.width * .43,
                      hintText: 'CVC',
                      borderColor: Colors.grey.shade300,
                      bgColor: Colors.white,
                    ),

                  ],
                ),

              ],
            ),
            const Spacer(),
            CustomButton(
              onTap: () {
                _showSuccessDialog(context);
              },
              label: 'Add',
              bgColor: AppColors.primary,
              labelColor: Colors.white,
              fontSize: 18,
            ),
            SizedBox(height: 10,),
          ],
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
              AppText(text: 'Congratulations!',fontWeight: FontWeight.w500,fontSize: 20,),
              AppText(text: 'Your new card has been added',fontWeight: FontWeight.w400,fontSize: 14,
                textColor: Colors.grey,),

            ],
          ),
          actions: [
            CustomButton(
              onTap: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              label:'Thanks',
              labelColor: Colors.white,
              bgColor: AppColors.primary,
            ),
          ],
        );
      },
    );
  }
}
