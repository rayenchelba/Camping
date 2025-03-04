import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:untitled1/classes/alergies.dart';
import 'package:untitled1/main.dart';

class Addview extends StatefulWidget {
  const Addview({super.key});

  @override
  State<Addview> createState() => _AddviewState();
}

class _AddviewState extends State<Addview> {
  bool _showAllHobbies=true;
  String childimg = 'assets/images/camping.jpg';
  final _formkey = GlobalKey<FormState>();
  List<String> gender = ['male', 'female'];
  TextEditingController date = TextEditingController();
  final Set<String> _selectedAllergies = {};
  final Set<String> _selectedHobby = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20),
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.white10,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const MyApp()));
                      },
                      child: Material(
                        elevation: 2,
                        shape: const CircleBorder(),
                        child: CircleAvatar(
                          radius: 24,
                          backgroundColor: Colors.white,
                          child: const Icon(Icons.keyboard_arrow_left, size: 30),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 3 - 65,
                    ),
                    const Center(
                      child: Text(
                        'Child Registration',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 35),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) => buildBottomSheet(),
                        );
                      },
                      child: Center(
                        child: CircleAvatar(
                          radius: 60,
                          backgroundImage: AssetImage(childimg),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: MediaQuery.of(context).size.width / 2 - 80,
                      child: CircleAvatar(
                        radius: 21,
                        backgroundColor: const Color(0xff677E32),
                        child: const Icon(Icons.camera_alt_outlined, color: Colors.white),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Form(
                  key: _formkey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Card(
                              color: Colors.white,
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(21),
                                side: BorderSide.none,
                              ),
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                                child: TextFormField(
                                  maxLength: 20,
                                  decoration: const InputDecoration(
                                    labelText: 'First name',
                                    counterText: '',
                                    border: InputBorder.none,
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'This field is required';
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {},
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Card(
                              color: Colors.white,
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(21),
                                side: BorderSide.none,
                              ),
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                                child: TextFormField(
                                  maxLength: 20,
                                  decoration: const InputDecoration(
                                    labelText: 'Last name',
                                    counterText: '',
                                    border: InputBorder.none,
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'This field is required';
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {},
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Card(
                        color: Colors.white,
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(21),
                          side: BorderSide.none,
                        ),
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                          child: TextFormField(
                            readOnly: true,
                            onTap: () {
                              pickDate();
                            },
                            controller: date,
                            decoration: const InputDecoration(
                              labelText: 'Birthday date',
                              suffixIcon: Icon(Icons.calendar_today_outlined),
                              border: InputBorder.none,
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'This field is required';
                              }
                              return null;
                            },
                            onSaved: (value) {},
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(21),
                          side: BorderSide.none,
                        ),
                        color: Colors.white,
                        elevation: 2,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            children: [
                              Container(
                                width: double.infinity,
                                color: Colors.white,
                                padding: EdgeInsets.only(bottom: 8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Hobby (Max5)",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500
                                      ),
                                    ),
                                    IconButton(
                                      icon: Icon(_showAllHobbies ? Icons.expand_less : Icons.expand_more),
                                      onPressed: () {
                                        setState(() {
                                          _showAllHobbies = !_showAllHobbies;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              Wrap(
                                spacing: 8.0,
                                runSpacing: 8.0,
                                children: (_showAllHobbies ? Hobby.values : Hobby.values.where((hob) => _selectedHobby.contains(hob.name)))
                                    .map((hob) {
                                  bool isSelected = _selectedHobby.contains(hob.name);
                                  return FilterChip(
                                    label: Text(hob.name),
                                    selected: isSelected,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25),
                                      side: BorderSide(
                                        color: isSelected
                                            ? hob.color
                                            : Colors.grey[300]!,
                                        width: 1.5,
                                      ),
                                    ),
                                    selectedColor: hob.color.withOpacity(0.2),
                                    checkmarkColor: hob.color,
                                    onSelected: (selected) {
                                      setState(() {
                                        if (selected) {
                                          if (_selectedHobby.length < 5) {
                                            _selectedHobby.add(hob.name);
                                          }
                                        } else {
                                          _selectedHobby.remove(hob.name);
                                        }
                                      });
                                    },
                                  );
                                }).toList(),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Card(
                        color: Colors.white,
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(21),
                          side: BorderSide.none,
                        ),
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                          child: DropdownButtonFormField<String>(
                            decoration: const InputDecoration(
                              labelText: 'Gender',
                              border: InputBorder.none,
                            ),
                            value: gender[0],
                            items: gender.map((p) {
                              return DropdownMenuItem(
                                value: p,
                                child: Text(p.substring(0, 1).toUpperCase() + p.substring(1)),
                              );
                            }).toList(),
                            onChanged: (value) {},
                            onSaved: (value) {},
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Card(
                        color: Colors.white,
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(21),
                          side: BorderSide.none,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            children: [
                              Container(
                                width: double.infinity,
                                padding: EdgeInsets.only(bottom: 8.0),
                                child: Text(
                                  "Allergies",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500
                                  ),
                                ),
                              ),
                              Wrap(
                                spacing: 8.0,
                                runSpacing: 8.0,
                                children: alergies.values.map((allergy) {
                                  final isSelected = _selectedAllergies.contains(allergy.name);
                                  return FilterChip(
                                    avatar: SvgPicture.asset(
                                      allergy.icon,
                                      semanticsLabel: 'Dart Logo',
                                    ),
                                    label: Text(allergy.name),
                                    selected: isSelected,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25),
                                      side: BorderSide(
                                        color: isSelected
                                            ? Colors.yellowAccent[700]!
                                            : Colors.grey[300]!,
                                        width: 1.5,
                                      ),
                                    ),
                                    selectedColor: const Color(0xFFFFF3E6),
                                    onSelected: (selected) {
                                      setState(() {
                                        if (selected) {
                                          _selectedAllergies.add(allergy.name);
                                        } else {
                                          _selectedAllergies.remove(allergy.name);
                                        }
                                      });
                                    },
                                  );
                                }).toList(),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: 150,
                  child: FilledButton(
                    style: FilledButton.styleFrom(
                      backgroundColor: Color(0xff677E32),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(21),
                      ),
                    ),
                    onPressed: () {},
                    child: Padding(
                        padding: EdgeInsets.only(top: 15, bottom: 15),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [Icon(Icons.add, size: 25,), Text('Add child', style: TextStyle(fontSize: 17),)])),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildBottomSheet() {
    return Container(
      padding: const EdgeInsets.all(15),
      height: 120,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          const Center(
            child: Text('Choose Profile Photo', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18)),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  takePhoto();
                  Navigator.pop(context);
                },
                child: const Row(
                  children: [
                    Icon(Icons.camera),
                    SizedBox(width: 5),
                    Text('Camera'),
                  ],
                ),
              ),
              const SizedBox(width: 40),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Row(
                  children: [
                    Icon(Icons.photo),
                    SizedBox(width: 5),
                    Text('Gallery'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void takePhoto() {
  }

  Future<void> pickDate() async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        firstDate: DateTime(2000),
        lastDate: DateTime.now()
    );

    if (pickedDate != null) {
      setState(() {
        date.text = pickedDate.toString().split(" ")[0];
      });
    }
  }
}