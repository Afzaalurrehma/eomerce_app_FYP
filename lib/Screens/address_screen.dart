import 'package:ecomerance_app/CustomWidgets/CustomButton.dart';
import 'package:ecomerance_app/CustomWidgets/appText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../AppColors/appcolors.dart';
import '../routes/route_name.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({super.key});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  int? _selectedRadio;

  @override
  void initState() {
    super.initState();
    // Initialize the selected radio button value
    _selectedRadio = null; // Initialize as null
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        backgroundColor: AppColors.primary,
        centerTitle: true,
        title: const Text(
          'Address',
          style: TextStyle(color: Colors.white),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Icon(Icons.notifications_outlined, color: Colors.white),
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AppText(
                text: 'Saved Address',
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 370,
                child: Expanded(
                  child: ListView.builder(
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.grey),
                        ),
                        child: ListTile(
                          leading: const Icon(
                            Icons.location_on_outlined,
                            color: Colors.grey,
                            size: 30,
                          ),
                          title: AppText(
                            text: 'Home',
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                          subtitle: const AppText(
                            text: '925 S Chugach St #APT 10, Alas...',
                          ),
                          trailing: Radio(
                            value: index,
                            groupValue: _selectedRadio,
                            onChanged: (value) {
                              setState(() {
                                _selectedRadio =
                                    value; // Update the selected radio button value
                              });
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              CustomButton(
                onTap: () {
                  Get.toNamed(RouteName.newAddressScreen);
                },
                imagePath: 'assets/icons/Plus.svg',
                borderColor: Colors.grey.shade300,
                label: 'Add New Address',
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              const Spacer(),
              CustomButton(
                onTap: () {
                  // Get.toNamed(RouteName.checkoutScreen);
                },
                label: 'Apply',
                bgColor: AppColors.primary,
                labelColor: Colors.white,
                fontSize: 18,
              )
            ],
          ),
        ),
      ),
    );
  }
}
