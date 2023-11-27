


import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'travel.dart';

class BookingScreen extends StatefulWidget {
  final TravelDestination destination;

  BookingScreen({required this.destination});

  @override
  _BookingScreenState createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _numberOfPersonsController;
  late TextEditingController _departureTimeController;
  late TextEditingController _arrivalTimeController;
  late TextEditingController _selectedCountryController;
  late TextEditingController _nbofdayscontroller;
  bool _wantFood = false; // Added variable to track food preference
  

  // Pricing structure for each country (example)
  Map<String, double> countryPrices = {
    'paris': 500.0,
    'Tokyo': 600.0,
    'barcelona': 300.0,
    'berlin': 700.0,
    'madrid': 500.0,
    'turkey': 800.0,
    'Newyork': 400.0,

    // Add more countries and their base prices as needed
  };

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _numberOfPersonsController = TextEditingController();
    _departureTimeController = TextEditingController();
    _arrivalTimeController = TextEditingController();
    _selectedCountryController = TextEditingController();
    _nbofdayscontroller= TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _numberOfPersonsController.dispose();
    _departureTimeController.dispose();
    _arrivalTimeController.dispose();
    _selectedCountryController.dispose();
    _nbofdayscontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 42, 138, 216),
        title: Text('Booking ${widget.destination.name}'),
      ),
      body: ListView(
        children: [
           Padding(
        padding: const EdgeInsets.all(16.0),
         child:Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Please provide your booking details:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Your Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name.';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _numberOfPersonsController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Number of Persons'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the number of persons.';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),

              DateTimeField(
  controller: _departureTimeController,
  format: DateFormat("HH:mm"), // Use HH:mm for time format
  decoration: InputDecoration(
    labelText: 'Departure Time',
    labelStyle: TextStyle(
      fontSize: 16, // Adjust the font size as needed
    ),
  ),
  onShowPicker: (context, currentValue) async {
    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
    );
    return time == null ? currentValue : DateTimeField.convert(time);
  },
  validator: (value) {
    if (value == null) {
      return 'Please enter the departure time.';
    }
    return null;
  },
),

DateTimeField(
  controller: _arrivalTimeController,
  format: DateFormat("yyyy-MM-dd"),
  decoration: InputDecoration(
    labelText: 'Arrival Time',
    labelStyle: TextStyle(
      fontSize: 16, // Adjust the font size as needed
    ),
  ),
  onShowPicker: (context, currentValue) async {
    return showDatePicker(
      context: context,
      firstDate: DateTime(2000),
      initialDate: currentValue ?? DateTime.now(),
      lastDate: DateTime(2101),
    );
  },
  validator: (value) {
    if (value == null) {
      return 'Please enter the arrival time.';
    }
    return null;
  },
),
              SizedBox(height: 10),
            DropdownButtonFormField<String>(
  value: _selectedCountryController.text.isNotEmpty ? _selectedCountryController.text : 'Tokyo',
  items: ['Paris', 'Tokyo', 'Madrid', 'Barcelona', 'Berlin','Turkey']
      .map((String country) {
    return DropdownMenuItem<String>(
      value: country,
      child: Text(country),
    );
  }).toList(),
  onChanged: (String? value) {
    setState(() {
      _selectedCountryController.text = value ?? '';
    });
  },
  decoration: InputDecoration(
    labelText: 'Country to Visit',
  ),
  validator: (value) {
    if (value == null || value.isEmpty) {
      return 'Please select the country you want to visit.';
    }
    return null;
  },
),
              SizedBox(height: 10),
              TextFormField(
                controller: _nbofdayscontroller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Number of days'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the number of days.';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
               Row(
                children: [
                  Checkbox(
                    value: _wantFood,
                    onChanged: (value) {
                      setState(() {
                        _wantFood = value ?? false;
                      });
                    },
                  ),
                  Text('I want to include food during travel'),
                ],
              ),
              ElevatedButton(
  style: ElevatedButton.styleFrom(
    side: BorderSide(
      color: Colors.blue, // Adjust the color of the border
      width: 1.0, // Adjust the width of the border
    ),
    padding: EdgeInsets.symmetric(vertical: 5.0),
  ),
  onPressed: () {
    if (_formKey.currentState?.validate() ?? false) {
      // Use the selected destination to determine the base price
      double basePricePerPerson = countryPrices[_selectedCountryController.text.toLowerCase()] ?? 0.0;
      int numberOfPersons = int.parse(_numberOfPersonsController.text);
      double totalPrice = basePricePerPerson * numberOfPersons;

      // You can also include other factors like the number of days, food preference, etc., in the pricing calculation

      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Booking Successful'),
            content: Text('Your ticket has been booked.\nTotal Price: \$${totalPrice.toStringAsFixed(2)}.\nFood: ${_wantFood ? 'Included' : 'Not Included'}'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  },
  child: Text(
    'Book Ticket',
    style: TextStyle(fontSize: 20),
  ),
),

            ],
          ),
        ),
           )
        ]
      ),
    );
  }
}
