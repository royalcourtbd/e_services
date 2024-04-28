import 'package:e_services/core/static/svg_path.dart';
import 'package:e_services/core/static/ui_const.dart';
import 'package:e_services/presentation/common/submit_button.dart';
import 'package:e_services/presentation/common/text_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BuyerHomePage extends StatelessWidget {
  BuyerHomePage({Key? key}) : super(key: key);
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        leading: const Icon(
          Icons.menu,
          color: Colors.blue,
        ),
        actions: [
          SvgPicture.asset(
            SvgPath.icNotification,
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextBox(
                hintText: 'Search Here',
                textEditingController: _controller,
                bgColor: Colors.white,
                border: Border.all(color: Colors.white),
                isSearch: true,
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.5,
                child: CarouselSlider.builder(
                  itemCount: 3,
                  slideBuilder: (index) => _buildCarouselItem(context),
                  slideIndicator: CircularSlideIndicator(
                    padding: const EdgeInsets.only(bottom: 15),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Categories',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 20),
              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: _serviceModelList.length,
                itemBuilder: (context, index) =>
                    _buildCategoryItem(_serviceModelList[index]),
              ),
              const SizedBox(height: 25),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Popular Services',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    'See All',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.8,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _productList.length,
                  itemBuilder: (context, index) =>
                      _buildProductItem(_productList[index]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCarouselItem(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      width: 200, // Set the width as needed
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Get 30% on repairing',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 5),
              const Text(
                ' Code: AFR34',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
              ),
              gapH50,
              const SizedBox(
                  width: 150, child: SubmitButton(buttonTitle: 'Book Now')),
            ],
          ),
          SvgPicture.asset('assets/images/svg/setting2.svg'),
        ],
      ),
    );
  }

  Widget _buildCategoryItem(ServiceModel model) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(model.icPath),
          const SizedBox(height: 10),
          Text(model.title),
        ],
      ),
    );
  }

  Widget _buildProductItem(ProductModel model) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(model.icPath),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: RatingBar.builder(
                initialRating: 5,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemSize: 20,
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                model.sellerName,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                model.serviceName,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                "€${model.price}/h",
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Colors.blue,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ServiceModel {
  final String icPath, title;
  ServiceModel({required this.title, required this.icPath});
}

class ProductModel {
  final String sellerName, serviceName, icPath;
  final double price;

  ProductModel({
    required this.sellerName,
    required this.serviceName,
    required this.icPath,
    required this.price,
  });
}

List<ProductModel> _productList = [
  ProductModel(
    sellerName: 'Shehnaz Dey',
    serviceName: 'Room cleaning',
    price: 20.0,
    icPath: 'assets/images/png/img11.png',
  ),
  // Add more product models here
];

List<ServiceModel> _serviceModelList = [
  ServiceModel(title: 'Cleaning', icPath: "assets/images/svg/ic_clining.svg"),
  // Add more service models here
];
