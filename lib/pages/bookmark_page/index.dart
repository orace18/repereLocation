import 'package:flutter/material.dart';
import 'package:get/get.dart';


class BookmarkPage extends StatelessWidget {
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
              Image.network('https://imgs.search.brave.com/a1YqwbHniy02l766Yv1dUPYsxC0HP6h8v3jQRyS5Fnw/rs:fit:500:0:0:0/g:ce/aHR0cHM6Ly9iZW5p/bi1pbW1vLmNvbS93/cC1jb250ZW50L3Vw/bG9hZHMvMjAyNC8w/Ni9WaWxsYS1kdXBs/ZXgtYS12ZW5kcmUt/YS1Db3Rvbm91LUFr/cGFrcGEtNTI1eDMy/OC5qcGc', fit: BoxFit.cover),
              SizedBox(height: 10),
              Text(
                'Villa Luxieux\nCotonou, Littoral',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
           BottomNavigationBarItem(
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
          ),        ],
      ),
    );
  }
}
