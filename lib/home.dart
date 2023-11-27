import 'package:flutter/material.dart';
import 'travel.dart';


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:const Color.fromARGB(255, 1, 43, 63),
        title: Center(
          child:Text(
          'Wanderlust Explore',
          style: TextStyle(color: Colors.white,fontSize: 23),
          textAlign:TextAlign.center,
        ),
        )
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                'https://images.designtrends.com/wp-content/uploads/2016/04/04072852/World-Travel-Wallpaper.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Discover amazing destinations and plan your next adventure with our travel app.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 23, color:  Color.fromARGB(255, 1, 52, 94),fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20), 
              
              SizedBox(  height: 50,width: 300,// Add some spacing
              child:ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Travel(),
                    ),
                  );
              
                },
              
                style: ElevatedButton.styleFrom(
                 backgroundColor: Colors.blue, // You can customize the button color
                ),
                child: Text(
                  'Explore Destinations',
                  style: TextStyle(fontSize: 20),
                )
                ),
              ),
            ],

          ),
        ),
      ),
    );
  }
}