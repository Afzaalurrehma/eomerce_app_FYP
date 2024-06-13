import 'package:ecomerance_app/controllers/productdetail_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:page_view_dot_indicator/page_view_dot_indicator.dart';
import '../AppColors/appcolors.dart';
import '../CustomWidgets/CustomButton.dart';
import '../CustomWidgets/appText.dart';

class ProductDetailScreen extends StatefulWidget {
  final String image;
  final String name;
  final String description;
  final String price;
  final String originalPrice;

  const ProductDetailScreen({
    Key? key,
    required this.image,
    required this.name,
    required this.description,
    required this.price,
    required this.originalPrice,
  }) : super(key: key);

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  ProductDetailScreenController controller = Get.put(ProductDetailScreenController());

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Product Details'),
        centerTitle: true,
      ),
      body: Obx(
        () => Container(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              SizedBox(
                height: 300,
                child: PageView(
                  controller: controller.pageController,
                  onPageChanged: (index) {
                    setState(() {
                      controller.currentPage.value = index;
                    });
                  },
                  children: [
                    Image.asset(
                      widget.image,
                      fit: BoxFit.cover,
                    ),
                    Image.asset(widget.image, fit: BoxFit.cover),
                    Image.asset(widget.image, fit: BoxFit.cover),
                  ],
                ),
              ),
              Positioned(
                top: 250,
                child: PageViewDotIndicator(
                  currentItem: controller.currentPage.value,
                  count: 3,
                  unselectedColor: Colors.grey,
                  selectedColor: AppColors.primary,
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: SingleChildScrollView(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 400,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(50),
                        topLeft: Radius.circular(50),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AppText(
                                text: widget.name,
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                              ),
                              Container(
                                padding: const EdgeInsets.all(5),
                                width: 80,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade300,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    AppText(
                                      text: '-',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25,
                                    ),
                                    AppText(
                                      text: '1',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22,
                                    ),
                                    AppText(
                                      text: '+',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          AppText(
                            text: widget.description,
                            fontWeight: FontWeight.w600,
                            textColor: Colors.grey.shade500,
                            fontSize: 15,
                          ),
                          const AppText(
                            text: '(270 Reviews)',
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                          ),
                          const SizedBox(height: 20),
                          const AppText(
                            text: 'Size',
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                          ),
                          const SizedBox(height: 5),
                          SizedBox(
                            height: 50,
                            child: ListView.builder(
                              itemCount: controller.sizeList.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        controller.selectedIndex.value = index;
                                      });
                                    },
                                    child: Container(
                                      height: 70,
                                      width: 70,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color:
                                              controller.selectedIndex.value ==
                                                      index
                                                  ? Colors.transparent
                                                  : AppColors.primary,
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                        color: controller.selectedIndex.value ==
                                                index
                                            ? AppColors.primary
                                            : Colors.transparent,
                                      ),
                                      child: Center(
                                        child: AppText(
                                          text: controller.sizeList[index],
                                          fontWeight: FontWeight.bold,
                                          textColor:
                                              controller.selectedIndex.value ==
                                                      index
                                                  ? Colors.white
                                                  : Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          const SizedBox(height: 5),
                          const AppText(
                            text: 'Description',
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                          const SizedBox(height: 10),
                          const AppText(
                            text:
                                'Engineered to crush any movement_based comfortable,',
                          ),
                          const Spacer(),
                          Container(
                            padding: const EdgeInsets.fromLTRB(20, 10, 10, 10),
                            width: double.infinity,
                            height: 70,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: AppColors.primary,
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                AppText(
                                  text: widget.price,
                                  textColor: Colors.white,
                                  fontSize: 18,
                                ),
                                CustomButton(
                                  borderRadius: 10,
                                  width: 140,
                                  height: 70,
                                  label: 'Add to cart',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  onTap: () {
                                    // Implement your add to cart functionality here
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
              ),
            ],
          ),
        ),
      ),
    );
  }


}
