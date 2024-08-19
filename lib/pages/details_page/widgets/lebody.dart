import 'package:flutter/material.dart';

class PropertyDetailBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image carousel and details section
          _buildImageCarouselAndDetails(),

          // Description section
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Description",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit...",
              style: TextStyle(fontSize: 14),
            ),
          ),

          // Price and Action Buttons
          _buildPriceAndActions(context),
        ],
      ),
    );
  }

  Widget _buildImageCarouselAndDetails() {
    return Column(
      children: [
        // Image Carousel
        Container(
          height: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              // Replace with your own image URLs
              _buildImageItem("assets/onboardings/onboarding_3.jpg"),
              _buildImageItem("assets/onboardings/onboarding_3.jpg"),
              _buildImageItem("assets/onboardings/onboarding_3.jpg"),
            ],
          ),
        ),
        // Property Details
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              // Icon and details here
              Icon(Icons.home, color: Colors.blue),
              SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Villa luxieuse",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Cotonou, Littoral - Bénin",
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildImageItem(String imageUrl) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Image.asset(
          imageUrl,
          fit: BoxFit.cover,
          width: 100,
        ),
      ),
    );
  }

  Widget _buildPriceAndActions(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "50.000 FCFA / mois",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {},
                child: Text("Appeler"),
                style: ElevatedButton.styleFrom(foregroundColor: Colors.black, backgroundColor: Colors.grey[200]),
              ),
              SizedBox(width: 8),
              ElevatedButton(
                onPressed: () {},
                child: Text("Message"),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              ),
            ],
          )
        ],
      ),
    );
  }
}
