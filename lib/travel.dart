
import 'package:flutter/material.dart';
import 'booking.dart';

class Travel extends StatelessWidget {
  final List<TravelDestination> destinations = [
    TravelDestination(
      imageUrl: 'https://i1.wp.com/beautifulplacestovisit.com/wp-content/uploads/2011/05/Tour_eiffel_paris-eiffel_tower.jpg',
      name: 'Paris',
      description: 'The capital of France, known for its art and culture and the most popular artist.',
      price: '\$500',
    ),
    TravelDestination(
      imageUrl: 'https://lp-cms-production.imgix.net/2021-02/500pxRF_62325271.jpg?auto=format&fit=crop&sharp=10&vib=20&ixlib=react-8.6.4&w=850&q=35&dpr=3',
      name: 'Tokyo',
      description: 'The capital of Japan, known for its modern technology, vibrant street life, and historic temples.',
      price: '\$600',
    ),
    TravelDestination(
      imageUrl: 'https://www.fodors.com/wp-content/uploads/2019/10/01_01_BarcelonaAvoidCrowds__TakeYourselfToChurch_iStock-1029265170-724x483.jpg',
      name: 'Barcelona',
      description: 'A vibrant city in Spain, famous for its architecture, art, and beautiful beaches.',
      price: '\$300',
    ),
    TravelDestination(
      imageUrl: 'https://www.madmonkeyhostels.com/wp-content/uploads/2018/10/shutterstock_309233000.jpg',
      name: 'Berlin',
      description: 'The capital of Germany, known for its rich history, cultural landmarks, and vibrant nightlife.',
      price: '\$700',
    ),
    TravelDestination(
      imageUrl: 'http://3.bp.blogspot.com/-900RpmLxX8k/T1xvY8XvjaI/AAAAAAAAAZg/CJBk7TeFskI/s1600/palacio+real+Madrid.jpg',
      name: 'Madrid',
      description: 'The region has its own legislature and enjoys a wide range of competencies in areas such as social spending, healthcare, and education.',
      price: '\$500',
    ),
    TravelDestination(
      imageUrl: 'https://idsb.tmgrup.com.tr/2015/11/07/1446843339883.jpg',
      name: 'turkey',
      description: 'Turkey has a history that spans thousands of years, including the Byzantine Empire and the Ottoman Empire. It is home to numerous historical sites, including the famous Hagia Sophia and the ancient city of Troy..',
      price: '\$350',
    ),
   
  ];

@override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:const Color.fromARGB(255, 1, 43, 63),
      appBar: AppBar(
        title: Text('Travel Destinations'),
        backgroundColor: Color.fromARGB(255, 42, 138, 216),
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: destinations.length,
          itemBuilder: (context, index) {
            return _buildDestinationCard(context, index);
          },
        ),
      ),
    );
  }

  Widget _buildDestinationCard(BuildContext context, int index) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BookingScreen(
              destination: destinations[index],
            ),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 20.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15.0),
                  topRight: Radius.circular(15.0),
                ),
                image: DecorationImage(
                  image: NetworkImage(destinations[index].imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
              height: 150,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.7),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15.0),
                  bottomRight: Radius.circular(15.0),
                ),
              ),
              padding: EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    destinations[index].name,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 4.0),
                  Text(
                    destinations[index].description,
                    style: TextStyle(
                      color: Colors.grey[300],
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(height: 4.0),
                  Text(
                    'Price: ${destinations[index].price}',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TravelDestination {
  final String name;
  final String imageUrl;
  final String price;
  final String description;

  TravelDestination({
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.description,
  });
}