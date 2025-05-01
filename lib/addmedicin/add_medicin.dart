import 'package:chikitsa/addmedicin/medicin_search_field.dart';
import 'package:chikitsa/constants/color/colors.dart';
import 'package:flutter/material.dart';

class AddMedicinePage extends StatefulWidget {
  const AddMedicinePage({super.key});

  @override
  State<AddMedicinePage> createState() => _AddMedicinePageState();
}

class _AddMedicinePageState extends State<AddMedicinePage> {
  int selectedCompartment = 1;
  Color selectedColor = const Color(0xFFF8B7D3);
  String selectedType = 'Tablet';
  int totalCount = 1;
  double sliderValue = 1;
  String frequency = 'Everyday';
  String timesPerDay = 'Three Time';

  final TextEditingController quantityController =
      TextEditingController(text: 'Take 1/2 Pill');

  @override
  void dispose() {
    quantityController.dispose();
    super.dispose();
  }

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
              // Search Medicine Field
              MedicinSearchField(),

              const SizedBox(height: 20),

              // Compartment Selection
              AddMeSectionTile(title: 'Compartment'),
              const SizedBox(height: 10),
              _buildCompartmentSelector(),

              const SizedBox(height: 20),

              // Color Selection
              AddMeSectionTile(title: 'Colour'),
              const SizedBox(height: 10),
              _buildColorSelector(),

              const SizedBox(height: 20),

              // Type Selection
              AddMeSectionTile(title: 'Type'),
              const SizedBox(height: 10),
              _buildTypeSelector(),

              const SizedBox(height: 20),

              // Quantity
              AddMeSectionTile(title: 'Quantity'),
              const SizedBox(height: 10),
              _buildQuantityInput(),

              const SizedBox(height: 20),

              // Total Count
              AddMeSectionTile(title: 'Total Count'),
              const SizedBox(height: 10),
              _buildTotalCountInput(),

              const SizedBox(height: 20),

              // Set Date
              AddMeSectionTile(title: 'Set Date'),
              const SizedBox(height: 10),
              _buildDateSelector(),

              const SizedBox(height: 20),

              // Frequency
              AddMeSectionTile(title: 'Frequency of Days'),
              const SizedBox(height: 10),
              _buildDropdownSelector(frequency, [
                'Everyday',
                'Every Other Day',
                'Weekly',
                'Monthly'
              ], (value) {
                setState(() {
                  frequency = value!;
                });
              }),

              const SizedBox(height: 20),

              // Times per Day
              AddMeSectionTile(title: 'How many times a Day'),
              const SizedBox(height: 10),
              _buildDropdownSelector(
                  timesPerDay, ['Once', 'Twice', 'Three Time', 'Four Time'],
                  (value) {
                setState(() {
                  timesPerDay = value!;
                });
              }),

              const SizedBox(height: 20),

              // Doses
              _buildDoseItem('Dose 1'),
              const Divider(height: 1),
              _buildDoseItem('Dose 2'),
              const Divider(height: 1),
              _buildDoseItem(
                  'Dose 2'), // Note: The image shows "Dose 2" twice which might be a mistake in the design

              const SizedBox(height: 20),

              // Meal timing
              _buildMealTimingSelector(),

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

  // Widget _buildSectionTitle(String title) {
  //   return AddMeSectionTile();
  // }

  Widget _buildCompartmentSelector() {
    return Row(
      children: List.generate(7, (index) {
        // Display only 6 compartments and make the last one slightly visible
        if (index > 5) {
          return Expanded(
            child: Container(
              margin: const EdgeInsets.only(right: 8),
              height: 48,
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          );
        }

        return Expanded(
          child: GestureDetector(
            onTap: () {
              setState(() {
                selectedCompartment = index + 1;
              });
            },
            child: Container(
              margin: const EdgeInsets.only(right: 8),
              height: 48,
              decoration: BoxDecoration(
                color: selectedCompartment == index + 1
                    ? const Color(0xFFEEF2FF)
                    : Colors.white,
                border: Border.all(
                  color: selectedCompartment == index + 1
                      ? ChikitsaColors.primaryColor
                      : Colors.grey[300]!,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  '${index + 1}',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: selectedCompartment == index + 1
                        ? ChikitsaColors.primaryColor
                        : Colors.grey[500],
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget _buildColorSelector() {
    List<Color> colors = [
      const Color(0xFFF8B7D3), // Pink
      const Color(0xFFD4C1F9), // Purple
      const Color(0xFFFF9F9F), // Coral
      const Color(0xFFCBF5CB), // Light Green
      const Color(0xFFFFD2A5), // Peach
      const Color(0xFFA5E1FF), // Light Blue
      const Color(0xFFFFF8A5), // Light Yellow
    ];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(colors.length, (index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              selectedColor = colors[index];
            });
          },
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: colors[index],
              shape: BoxShape.circle,
              border: Border.all(
                color: selectedColor == colors[index]
                    ? Colors.blue
                    : Colors.transparent,
                width: 2,
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget _buildTypeSelector() {
    List<Map<String, dynamic>> types = [
      {'name': 'Tablet', 'icon': Icons.tablet},
      {'name': 'Capsule', 'icon': Icons.medication},
      {'name': 'Cream', 'icon': Icons.water_drop},
      {'name': 'Liquid', 'icon': Icons.local_drink},
    ];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: types.map((type) {
        bool isSelected = selectedType == type['name'];
        return GestureDetector(
          onTap: () {
            setState(() {
              selectedType = type['name'];
            });
          },
          child: Column(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: isSelected
                      ? selectedColor.withOpacity(0.3)
                      : Colors.grey[100],
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  type['icon'],
                  color: isSelected ? selectedColor : Colors.grey[400],
                  size: 28,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                type['name'],
                style: TextStyle(
                  color: isSelected ? Colors.black : Colors.grey[500],
                  fontSize: 12,
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildQuantityInput() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: quantityController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.grey[300]!),
              ),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            ),
          ),
        ),
        const SizedBox(width: 8),
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: Colors.blue[50],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(Icons.remove, color: Colors.blue[400]),
        ),
        const SizedBox(width: 8),
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: Colors.blue[400],
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Icon(Icons.add, color: Colors.white),
        ),
      ],
    );
  }

  Widget _buildTotalCountInput() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: SliderTheme(
                data: SliderThemeData(
                  activeTrackColor: Colors.blue[400],
                  inactiveTrackColor: Colors.grey[200],
                  thumbColor: Colors.blue[400],
                  trackHeight: 4,
                ),
                child: Slider(
                  min: 1,
                  max: 100,
                  value: sliderValue,
                  onChanged: (value) {
                    setState(() {
                      sliderValue = value;
                      totalCount = value.round();
                    });
                  },
                ),
              ),
            ),
            const SizedBox(width: 8),
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  totalCount.toString().padLeft(2, '0'),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('01', style: TextStyle(color: Colors.grey)),
            Text('100', style: TextStyle(color: Colors.grey)),
          ],
        ),
      ],
    );
  }

  Widget _buildDateSelector() {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey[300]!),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Today'),
                Icon(Icons.chevron_right, color: Colors.grey),
              ],
            ),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey[300]!),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('End Date'),
                Icon(Icons.chevron_right, color: Colors.grey),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDropdownSelector(
      String value, List<String> items, Function(String?) onChanged) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(10),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          isExpanded: true,
          icon: const Icon(Icons.keyboard_arrow_down),
          items: items.map((String item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(item),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }

  Widget _buildDoseItem(String title) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          const Icon(Icons.access_time, color: Colors.grey),
          const SizedBox(width: 12),
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Spacer(),
          const Icon(Icons.chevron_right, color: Colors.grey),
        ],
      ),
    );
  }

  Widget _buildMealTimingSelector() {
    List<String> options = ['Before Food', 'After Food', 'Before Sleep'];

    return Row(
      children: options.map((option) {
        bool isFirst = option == options.first;

        return Container(
          margin: EdgeInsets.only(right: isFirst ? 8 : 0),
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: isFirst ? Colors.blue[100] : Colors.transparent,
              foregroundColor: isFirst ? Colors.blue[800] : Colors.black,
              elevation: 0,
              side: BorderSide(
                color: isFirst ? Colors.transparent : Colors.grey[300]!,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: Text(option),
          ),
        );
      }).toList(),
    );
  }
}

class AddMeSectionTile extends StatelessWidget {
  final String title;
  const AddMeSectionTile({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    );
  }
}

// void main() {
//   runApp(const MedicineApp());
// }

// class MedicineApp extends StatelessWidget {
//   const MedicineApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Medicine Tracker',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         scaffoldBackgroundColor: Colors.white,
//         fontFamily: 'SF Pro Display', // iOS-like font
//       ),
//       home: const AddMedicinePage(),
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }