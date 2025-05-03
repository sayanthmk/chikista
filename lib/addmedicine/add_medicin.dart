import 'package:chikitsa/addmedicine/count.dart';
import 'package:chikitsa/addmedicine/drop_down_selector.dart';
import 'package:chikitsa/addmedicine/quantity_input.dart';
import 'package:chikitsa/addmedicine/selectors/color_selector.dart';
import 'package:chikitsa/addmedicine/selectors/compartment_selector.dart';
import 'package:chikitsa/addmedicine/selectors/date_selector.dart';
import 'package:chikitsa/addmedicine/selectors/meal_selector.dart';
import 'package:chikitsa/addmedicine/medicin_search_field.dart';
import 'package:chikitsa/addmedicine/selectors/type_selector.dart';
import 'package:chikitsa/addmedicine/title.dart';
import 'package:chikitsa/constants/color/colors.dart';
import 'package:flutter/material.dart';

class AddMedicinePage extends StatefulWidget {
  const AddMedicinePage({super.key});

  @override
  State<AddMedicinePage> createState() => AddMedicinePageState();
}

class AddMedicinePageState extends State<AddMedicinePage> {
  String frequency = 'Everyday';
  String timesPerDay = 'Three Time';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Add Medicines',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const MedicinSearchField(),

              const SizedBox(height: 20),

              // Compartment Selection
              const AddMeSectionTile(title: 'Compartment'),
              const SizedBox(height: 10),
              const CompartmentSelector(),

              const SizedBox(height: 20),

              // Color Selection
              const AddMeSectionTile(title: 'Colour'),
              const SizedBox(height: 10),
              const ColorSelector(),
              const SizedBox(height: 20),

              // Type Selection
              const AddMeSectionTile(title: 'Type'),
              const SizedBox(height: 10),
              TypeSelector(),

              const SizedBox(height: 20),

              // Quantity
              const AddMeSectionTile(title: 'Quantity'),
              const SizedBox(height: 10),
              const QuantityInput(),

              const SizedBox(height: 20),

              // Total Count
              const AddMeSectionTile(title: 'Total Count'),
              const SizedBox(height: 10),
              const CountPage(),

              const SizedBox(height: 20),

              // Set Date
              const AddMeSectionTile(title: 'Set Date'),
              const SizedBox(height: 10),
              const DateSelector(),
              const SizedBox(height: 20),

              // Frequency
              const AddMeSectionTile(title: 'Frequency of Days'),
              const SizedBox(height: 10),
              DropdownSelector(
                value: frequency,
                items: const [
                  'Everyday',
                  'Every Other Day',
                  'Weekly',
                  'Monthly'
                ],
                onChanged: (value) {
                  setState(() {
                    frequency = value!;
                  });
                },
              ),

              const SizedBox(height: 20),

              // Times per Day
              const AddMeSectionTile(title: 'How many times a Day'),
              const SizedBox(height: 10),
              DropdownSelector(
                value: timesPerDay,
                items: const ['Once', 'Twice', 'Three Time', 'Four Time'],
                onChanged: (value) {
                  setState(() {
                    timesPerDay = value!;
                  });
                },
              ),

              const SizedBox(height: 20),

              // Doses
              const DoseItemTitle(title: 'Dose 1'),
              const Divider(height: 1),
              const DoseItemTitle(title: 'Dose 1'),
              const Divider(height: 1),
              const DoseItemTitle(title: 'Dose 1'),

              const SizedBox(height: 20),

              // Meal timing
              MealTimeSelector(),

              const SizedBox(height: 20),

              // Add Button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF667EEA),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: const Text(
                    'Add',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: ChikitsaColors.white),
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
