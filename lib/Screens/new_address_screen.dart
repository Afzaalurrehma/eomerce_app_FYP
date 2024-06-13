import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_svg/svg.dart';
import '../AppColors/appcolors.dart';
import '../CustomWidgets/CustomButton.dart';
import '../CustomWidgets/CustomTextformField.dart';
import '../CustomWidgets/appText.dart';
import 'package:latlong2/latlong.dart';

class NewAddressScreen extends StatefulWidget {
  const NewAddressScreen({Key? key}) : super(key: key);

  @override
  State<NewAddressScreen> createState() => _NewAddressScreenState();
}

class _NewAddressScreenState extends State<NewAddressScreen> {
  bool checkValue = false;
  int _selectedItem = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
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
          'New Address',
          style: TextStyle(color: Colors.white),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Icon(Icons.notifications_outlined, color: Colors.white),
          ),
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            FlutterMap(
              options: MapOptions(
                center: LatLng(51.5, -0.09), // Initial location
                zoom: 13.0, // Initial zoom level
              ),
              children: [
                // TileLayerOptions(
                //   urlTemplate:
                //       'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                //   subdomains: ['a', 'b', 'c'],
                // ),
              ],
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                height: 390,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            height: 7,
                            width: 70,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade400,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppText(
                              text: 'Address',
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                            const Icon(
                              Icons.close,
                              size: 25,
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Divider(
                          color: Colors.grey.shade300,
                          thickness: 2,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const AppText(
                          text: 'Address Nickname',
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        SizedBox(
                          height: 60,
                          child: DropdownButtonFormField<int>(
                            value: _selectedItem,
                            onChanged: (int? newValue) {
                              setState(() {
                                _selectedItem = newValue!;
                              });
                            },
                            items: const [
                              DropdownMenuItem<int>(
                                value: 0,
                                child: Text(
                                  "Choose one",
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                              DropdownMenuItem<int>(
                                value: 1,
                                child: Text(
                                  "Option 1",
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                              DropdownMenuItem<int>(
                                value: 2,
                                child: Text(
                                  "Option 2",
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                              DropdownMenuItem<int>(
                                value: 3,
                                child: Text(
                                  "Option 3",
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                            ],
                            decoration: InputDecoration(
                              hintText: 'Select Option',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                    color: Colors
                                        .grey), // Change border color to grey
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const AppText(
                          text: 'Full Address',
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        CustomTextFormField(
                          hintText: 'Enter your Full Address',
                          borderColor: Colors.grey.shade300,
                          bgColor: Colors.white,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Checkbox(
                              activeColor: Colors.black,
                              value: checkValue,
                              onChanged: (value) {
                                setState(() {
                                  checkValue = value!;
                                });
                              },
                            ),
                            const AppText(
                              text: 'Make this as a default address',
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
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
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
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
              AppText(
                text: 'Congratulations!',
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
              AppText(
                text: 'Your new Address has been added',
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
              label: 'Thanks',
              labelColor: Colors.white,
              bgColor: AppColors.primary,
            ),
          ],
        );
      },
    );
  }
}
