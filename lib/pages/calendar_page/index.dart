import 'package:flutter/material.dart';
import 'package:get/get.dart';


class CalendarPage extends StatelessWidget {
  //final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Villa Luxieux'),
        actions: [
          IconButton(
            icon: Icon(Icons.star),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network('https://via.placeholder.com/400x200', fit: BoxFit.cover),
              SizedBox(height: 10),
              Text(
                'Villa Luxieux\nCotonou, Littoral',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(
                '15000F/mois',
                style: TextStyle(fontSize: 18, color: Colors.blue),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Icon(Icons.bed),
                  SizedBox(width: 5),
                  Text('18'),
                  SizedBox(width: 15),
                  Icon(Icons.bathroom),
                  SizedBox(width: 5),
                  Text('2'),
                  SizedBox(width: 15),
                  Icon(Icons.garage),
                  SizedBox(width: 5),
                  Text('1'),
                ],
              ),
              SizedBox(height: 10),
              Text(
                'Détails',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud.',
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {},
                child: Text('Message'),
              ),
              SizedBox(height: 10),
              Divider(),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 5,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('Villa Luxieux'),
                    subtitle: Text('Cotonou, Littoral\n15000F/mois'),
                    trailing: ElevatedButton(
                      onPressed: () {},
                      child: Text('Message'),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      
    );
  }
}
