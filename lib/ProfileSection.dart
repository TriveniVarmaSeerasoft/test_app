// ignore_for_file: non_constant_identifier_names, prefer_final_fields, unused_field, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:getwidget/getwidget.dart';
import 'package:test_app/models/to_do_model.dart';
import 'package:test_app/utilities/db_helper.dart';
// import 'package:test_app/model/mysql.dart';
import 'package:mysql1/mysql1.dart';
// import 'AcademicDetails.dart';
// import 'Address.dart';
// import 'EmploymentDetails.dart';
// import 'ExtracurricularActivities.dart';
// import 'FamilyDetails.dart';
// import 'Goals.dart';
// import 'LanguagesKnown.dart';
// import 'PersonalityTraits.dart';
// import 'PersonalDetails.dart';
// import 'SoftSkills.dart';
// import 'TechnicalSkills.dart';
import 'package:geolocator/geolocator.dart';
import 'package:toast/toast.dart';

import 'model.dart/ToDoModel.dart';
import 'model.dart/mySql.dart';
import 'utilities.dart/db_helper.dart';

enum LanguageTypeEnum { Downloadable, Deliverable }

class ProfileSection extends StatefulWidget {
  const ProfileSection({Key? key}) : super(key: key);

  @override
  State<ProfileSection> createState() => _ProfileSectionState();
}

class _ProfileSectionState extends State<ProfileSection> {
  // _ProfileSectionState() {

  // }
  @override
  void initState() {
    dropdownValue = higherEducation[0];
    _databaseHelper = DataBaseHelper(); // TODO: implement initState
    super.initState();
  }

  var higherEducation = ["Post Graduation", "Graduation/Under Graduate"];
  String? dropdownValue = "Select Higher education";
  // DataBaseHelper dataBaseHelper = DataBaseHelper();
  // // ignore: prefer_final_fields
  // List<ToDoModel>? _todoList = null;
  // int count = 0;
  late ToDoModel toDoModel;

  // Future <List<ToDoModel>> toDoModel;
  // TextEditingController _idEditingController = TextEditingController();
  TextEditingController _firstnameEditingController = TextEditingController();
  TextEditingController _middlenameEditingController = TextEditingController();
  TextEditingController _lastnameEditingController = TextEditingController();
  TextEditingController _emailEditingController = TextEditingController();
  TextEditingController _mobileEditingController = TextEditingController();
  TextEditingController _dobEditingController = TextEditingController();

  var _databaseHelper;

  ProfilePage() {
    String firstname = _firstnameEditingController.text;
    String middlename = _middlenameEditingController.text;
    String lastname = _lastnameEditingController.text;
    String email = _emailEditingController.text;
    String mobile = _mobileEditingController.text;
    String DOB = _dobEditingController.text;

    if (firstname.isEmpty) {
      Toast.show("Please enter firstname",
          textStyle: context,
          duration: Toast.lengthLong,
          gravity: Toast.bottom);
    } else if (middlename.isEmpty) {
      Toast.show("Please enter middlename",
          textStyle: context,
          duration: Toast.lengthLong,
          gravity: Toast.bottom);
    } else if (lastname.isEmpty) {
      Toast.show("Please enter lastname",
          textStyle: context,
          duration: Toast.lengthLong,
          gravity: Toast.bottom);
    } else if (email.isEmpty) {
      Toast.show("Please enter email id",
          textStyle: context,
          duration: Toast.lengthLong,
          gravity: Toast.bottom);
    } else if (mobile.isEmpty) {
      Toast.show("Please enter mobile number",
          textStyle: context,
          duration: Toast.lengthLong,
          gravity: Toast.bottom);
    } else if (DOB.isEmpty) {
      Toast.show("Please enter Date of birth",
          textStyle: context,
          duration: Toast.lengthLong,
          gravity: Toast.bottom);
    }
  }

  // ...................................................................................
  late String firstname, lastname, middlename, DOB, mobile, email;
  late String _email, _phone;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  var _dataBaseHelper;
  late bool isUpdating;
  // @override
  // void initState() {
  //   super.initState();
  //   _dataBaseHelper = DataBaseHelper();
  //   isUpdating= false;

  // }
  refreshList() {
    setState() {
      toDoModel = _dataBaseHelper.getConnection();
    }
  }

// .............................
  int _counter = 0;
  var db = new Mysql();
  var mail = '';

  void getConnection() {
    db.getConnection().then((conn) {
      // String sql1 = 'create table PersonalDetails()';
      String sql = 'select lastname from PersonalDetails';
      conn.query(sql).then((results) {
        for (var row in results) {
          setState(() {
            email = row[0];
          });
        }
      });
    });
  }

  // .................employment..............................
  bool checkbox1 = false;

  var employmentType = [
    "Course/certificate",
    "Full time",
    "Part time",
    "Self employed",
    "Freelance",
    "Internship",
    "Trainee"
  ];
  String type = 'Course/certificate';
  // ...............Languages........................................
  LanguageTypeEnum? _languageTypeEnum;
  // ........................Address...........................................

  _ProfileState() {
    _selectedState = _stateList[0];
  }

  final _stateList = [
    'Andhra Pradesh',
    'Arunachal Pradesh',
    'Assam',
    'Bihar',
    'Chhattisgarh',
    'Goa',
    'Gujarat',
    'Haryana',
    'Himachal Pradesh',
    'Jharkhand',
    'Karnataka',
    'Kerala',
    'Madhya Pradesh',
    'Maharashtra',
    'Manipur',
    'Meghalaya',
    'Mizoram',
    'Nagaland',
    'Odisha',
    'Punjab',
    'Rajasthan',
    'Sikkim',
    'Tamil Nadu',
    'Telangana',
    'Tripura',
    'Uttar Pradesh',
    'Uttarakhand',
    'West Bengal'
  ];
  String? _selectedState = '';

// ...........................droplist for city...........................................
  Profile() {
    _selectedCity = _cityList[0];
  }

  final _cityList = [
    'Amaravati',
    'Itanagar',
    'Dispur',
    'Patna',
    'Raipur',
    'Panaji',
    'Gandhinagar',
    'Chandigarh',
    'Shimla',
    'Ranchi',
    'Bengaluru',
    'Thiruvananthapuram',
    'Bhopal',
    'Mumbai',
    'Imphal',
    'Shillong',
    'Aizawl',
    'Kohima',
    'Bhubaneswar',
    'Chandigarh',
    'Jaipur',
    'Gangtok',
    'Chennai',
    'Hyderabad',
    'Agartala',
    'Lucknow',
    'Dehradun (Winter) Gairsain (Summer)',
    'Kolkata'
  ];

  String? _selectedCity = '';

  // .............................location......................................

  //
  // .......................Pick Location...................................
  var locationMessage = '';
  void getCurrentLocation() async {
    var position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    var lastPosition = await Geolocator.getLastKnownPosition();
    print(lastPosition);
    var lat = position.latitude;
    var long = position.longitude;
    print(('$lat,$long'));

    setState(() {
      locationMessage = 'latitude :$lat , longitude : $long';
    });
  }

  @override
  // ignore: dead_code, dead_code
  Widget build(BuildContext context) {
    // ignore: prefer_conditional_assignment
    // if (_todoList == null) {
    //   // ignore: deprecated_member_use, prefer_collection_literals
    //   _todoList = [];
    //   updateListView();
    // }

    return Scaffold(
        appBar: AppBar(
          title: const Text('Profile Section'),
          backgroundColor: Colors.green,
        ),
        // ignore: deprecated_member_use
        body:
            // FutureBuilder<List<ToDoModel>>(
            //   future: DataBaseHelper.instance.get,
            //   builder: ,)

            SingleChildScrollView(
                child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(children: [
            Text(
              'Profile',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(height: 10),
// ......................personal details.......................................

            // ignore: deprecated_member_use
            ExpansionTile(
              title: Text('Personal Details'),
              children: [
                Container(
                  height: 50,
                  child: TextFormField(
                    decoration: InputDecoration(
                        hintText: 'First Name',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                            color: Colors.green,
                            width: 2.0,
                          ),
                        )),
                    controller: _firstnameEditingController,
                    keyboardType: TextInputType.name,
                  ),
                ),
                SizedBox(height: 5),
                Container(
                  height: 50,
                  child: TextFormField(
                    decoration: InputDecoration(
                        hintText: 'Middle Name',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                            color: Colors.green,
                            width: 2.0,
                          ),
                        )),
                    controller: _middlenameEditingController,
                    keyboardType: TextInputType.name,
                  ),
                ),
                SizedBox(height: 05),
                Container(
                  height: 50,
                  child: TextFormField(
                    decoration: InputDecoration(
                        hintText: 'Last Name',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                            color: Colors.green,
                            width: 2.0,
                          ),
                        )),
                    controller: _lastnameEditingController,
                    keyboardType: TextInputType.name,
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  height: 50,
                  child: TextFormField(
                    decoration: InputDecoration(
                        hintText: 'Email-Id',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                            color: Colors.green,
                            width: 2.0,
                          ),
                        )),
                    // validator: (value) {
                    //   if (value!.isEmpty) {
                    //     return "enter valid email id";
                    //   {
                    //   if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z.-]+.[a-z]")
                    //       .hasMatch(value)) {
                    //     return ('Please enter valid email id ');
                    //   }}
                    //   return null;
                    // },
                    validator: (value) {
                      if (value!.isEmpty ||
                          !RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z.-]+.[a-zA-z]")
                              .hasMatch(value)) {
                        if (value.isNotEmpty) {
                          return ('Please enter valid email id ');
                        }
                        return "enter email id";
                      } else {
                        return null;
                      }
                    },
                    onSaved: (email) {
                      _email = email!;
                    },
                    controller: _emailEditingController,
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  height: 50,
                  child: TextFormField(
                    controller: _mobileEditingController,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(10),
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    decoration: InputDecoration(
                        hintText: 'Mobile Number',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                            color: Colors.green,
                            width: 2.0,
                          ),
                        )),
                    // validator: (value) {
                    //   if (value!.isEmpty) {
                    //     return "Enter mobile number";
                    //   }
                    //   if (value.length < 9) {
                    //     print('Please enter valid phone number');
                    //   }
                    //   return null;
                    // },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter phone number";
                      }
                      // else if (countryCode == null) {
                      //   return "select country code";
                      // }
                      else if (value.length != 10) {
                        return "enter valid phone number";
                      } else {
                        return null;
                      }
                    },
                    onSaved: (phone) {
                      _phone = phone!;
                    },

                    keyboardType: TextInputType.number,
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  height: 50,
                  child: TextFormField(
                    decoration: InputDecoration(
                        hintText: 'D O B',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                            color: Colors.green,
                            width: 2.0,
                          ),
                        ),
                        suffixIcon: Icon(Icons.calendar_month_outlined)),
                    keyboardType: TextInputType.datetime,
                  ),
                ),
                SizedBox(height: 10),
                Center(
                  child: Flexible(
                    child: ElevatedButton(
                      // ignore: sort_child_properties_last
                      child: Text('Save',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      // ignore: duplicate_ignore
                      onPressed: () {
                        getConnection;
                        if (_formKey.currentState!.validate()) {
                          //Navigator.push(context, MaterialPageRoute(builder: (context)=>));
                        } else {
                          print('Unsuccessful');
                        }

                        int i = DataBaseHelper.instance
                            .insert({_dataBaseHelper.firstname: firstname});
                        print('the firstname is $i');
                        validate();

                        var _firstname = _firstnameEditingController.text;
                        var _middlename = _middlenameEditingController.text;
                        var _lastname = _lastnameEditingController.text;
                        var _email = _emailEditingController.text;
                        var _mobilename = _mobileEditingController.text;
                        var DOB = _dobEditingController.text;
                      },
                      style: ElevatedButton.styleFrom(
                          primary: Colors.green, fixedSize: Size(350, 40)),
                    ),
                  ),
                ),
              ],
            ),
            // ..................................Academic Details..........................

            ExpansionTile(
              title: Text('Academic Details'),
              children: [
                // Text(
                //   'Academic Details',
                //   // ignore: prefer_const_constructors
                //   style: TextStyle(
                //       decoration: TextDecoration.underline,
                //       color: Color.fromARGB(255, 51, 131, 53),
                //       fontWeight: FontWeight.bold,
                //       fontSize: 25),
                // ),
                SizedBox(height: 5),
                Center(
                  child: DropdownButtonFormField(
                      value: dropdownValue,
                      items: higherEducation.map(
                        (item) {
                          return DropdownMenuItem(
                              child: Text(item), value: item);
                        },
                      ).toList(),
                      onChanged: (item) {
                        setState() {
                          dropdownValue = item as String;
                        }
                      }),
                ),

                Container(
                  height: 50,
                  child: TextFormField(
                    decoration: InputDecoration(
                        hintText: 'School / Institute name',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          // ignore: prefer_const_constructors
                          borderSide: BorderSide(
                            color: Colors.green,
                            width: 2.0,
                          ),
                        )),
                    keyboardType: TextInputType.name,
                  ),
                ),
                SizedBox(height: 5),
                Container(
                  height: 50,
                  child: TextFormField(
                    decoration: InputDecoration(
                        hintText: 'Degree',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          // ignore: prefer_const_constructors
                          borderSide: BorderSide(
                            color: Colors.green,
                            width: 2.0,
                          ),
                        )),
                    keyboardType: TextInputType.name,
                  ),
                ),
                SizedBox(height: 5),
                Container(
                  height: 50,
                  child: TextFormField(
                    decoration: InputDecoration(
                        hintText: 'Field of Study',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                            color: Colors.green,
                            width: 2.0,
                          ),
                        )),
                    keyboardType: TextInputType.name,
                  ),
                ),
                SizedBox(height: 5),
                Container(
                  height: 50,
                  child: Row(
                    children: [
                      Flexible(
                        child: TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Start Date',
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                color: Colors.green,
                                width: 2.0,
                              ),
                            ),
                            suffixIcon: Icon(Icons.calendar_month_outlined),
                          ),
                          keyboardType: TextInputType.name,
                        ),
                      ),
                      SizedBox(width: 10),
                      Flexible(
                        child: TextFormField(
                          decoration: InputDecoration(
                              labelText: 'End Date',
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(
                                  color: Colors.green,
                                  width: 2.0,
                                ),
                              ),
                              suffixIcon: Icon(Icons.calendar_month_outlined)),
                          keyboardType: TextInputType.name,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 5),
                // Container(
                //   height: 50,
                //   child: TextFormField(
                //     decoration: InputDecoration(
                //         hintText: 'End Date',
                //         enabledBorder: OutlineInputBorder(
                //           borderRadius: BorderRadius.circular(15),
                //           borderSide: BorderSide(
                //             color: Colors.green,
                //             width: 2.0,
                //           ),
                //         )),
                //     keyboardType: TextInputType.datetime,
                //   ),
                // ),
                SizedBox(height: 5),
                Container(
                  height: 50,
                  child: TextFormField(
                    decoration: InputDecoration(
                        hintText: 'Grade',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                            color: Colors.green,
                            width: 2.0,
                          ),
                        )),
                    keyboardType: TextInputType.name,
                  ),
                ),
                SizedBox(height: 5),
                Container(
                  child: TextFormField(
                    minLines: 3,
                    maxLines: 10,
                    decoration: InputDecoration(
                      hintText: 'Activities',
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: Colors.green,
                          width: 2.0,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: Colors.green,
                          width: 2.0,
                        ),
                      ),
                    ),
                    keyboardType: TextInputType.multiline,
                  ),
                ),
                SizedBox(height: 5),
                Container(
                  child: TextFormField(
                    minLines: 3,
                    maxLines: 10,
                    decoration: InputDecoration(
                        hintText: 'Description',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                            color: Colors.green,
                            width: 2.0,
                          ),
                        )),
                    keyboardType: TextInputType.multiline,
                  ),
                ),
                SizedBox(height: 5),
                Container(
                  height: 50,
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Add Certificate',
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: Colors.green,
                          width: 2.0,
                        ),
                      ),
                    ),
                    keyboardType: TextInputType.name,
                  ),
                ),
                SizedBox(height: 10),
                Center(
                  child: Flexible(
                    child: ElevatedButton(
                      child: Text('Save',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          primary: Colors.green, fixedSize: Size(350, 40)),
                    ),
                  ),
                ),
              ],
            ),
// ............................Employment details...............................
            ExpansionTile(title: Text('Employment Details'), children: [
              // Text(
              //   'Employment Details',
              //   // ignore: prefer_const_constructors
              //   style: TextStyle(
              //       decoration: TextDecoration.underline,
              //       color: Color.fromARGB(255, 51, 131, 53),
              //       fontWeight: FontWeight.bold,
              //       fontSize: 25),
              // ),
              SizedBox(width: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(Icons.add_box_outlined, size: 30),
                ],
              ),

              SizedBox(height: 5),
              Center(
                child: DropdownButtonFormField(
                    value: type,
                    items: employmentType.map(
                      (item) {
                        return DropdownMenuItem(child: Text(item), value: item);
                      },
                    ).toList(),
                    onChanged: (item) {
                      setState() {
                        // type = item;
                      }
                    }),
              ),
              SizedBox(height: 10),
              Container(
                height: 50,
                child: TextFormField(
                  decoration: InputDecoration(
                      hintText: 'Title',
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        // ignore: prefer_const_constructors
                        borderSide: BorderSide(
                          color: Colors.green,
                          width: 2.0,
                        ),
                      )),
                  keyboardType: TextInputType.name,
                ),
              ),
              SizedBox(height: 5),
              Container(
                height: 50,
                child: TextFormField(
                  decoration: InputDecoration(
                      hintText: 'Organisation / Institute  name',
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: Colors.green,
                          width: 2.0,
                        ),
                      )),
                  keyboardType: TextInputType.name,
                ),
              ),
              SizedBox(height: 5),
              Container(
                child: TextFormField(
                  minLines: 3,
                  maxLines: 10,
                  decoration: InputDecoration(
                      hintText: 'Location',
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: Colors.green,
                          width: 2.0,
                        ),
                      )),
                  keyboardType: TextInputType.name,
                ),
              ),
              SizedBox(height: 5),
              Container(
                height: 50,
                child: TextFormField(
                  decoration: InputDecoration(
                      hintText: 'Start Date',
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: Colors.green,
                          width: 2.0,
                        ),
                      ),
                      suffixIcon: Icon(Icons.calendar_month_outlined)),
                  keyboardType: TextInputType.datetime,
                ),
              ),
              SizedBox(height: 5),
              Container(
                height: 50,
                child: TextFormField(
                  decoration: InputDecoration(
                      hintText: 'End Date',
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: Colors.green,
                          width: 2.0,
                        ),
                      ),
                      suffixIcon: Icon(Icons.calendar_month_outlined)),
                  keyboardType: TextInputType.datetime,
                ),
              ),
              SizedBox(height: 5),
              Container(
                height: 50,
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Industry / Domain',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color: Colors.green,
                        width: 2.0,
                      ),
                    ),
                  ),
                  keyboardType: TextInputType.datetime,
                ),
              ),
              SizedBox(height: 5),
              Container(
                child: TextFormField(
                  minLines: 3,
                  maxLines: 10,
                  decoration: InputDecoration(
                    hintText: 'Description',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color: Colors.green,
                        width: 2.0,
                      ),
                    ),
                  ),
                  keyboardType: TextInputType.datetime,
                ),
              ),
              SizedBox(height: 5),
              Container(
                height: 50,
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Profile headline',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color: Colors.green,
                        width: 2.0,
                      ),
                    ),
                  ),
                  keyboardType: TextInputType.multiline,
                ),
              ),
              // Autocomplete<String>(
              //   optionsBuilder:
              //       (TextEditingValue textEditingValue) {
              //     if (textEditingValue.text == '') {
              //       return const Iterable<String>.empty();
              //     }
              //     return listItems.where((String item) {
              //       return item.contains(
              //           textEditingValue.text.toLowerCase());
              //     });
              //   },
              //   onSelected: (String item) {
              //     print('The $item Was selected');
              //   },
              // ),

              // CheckboxListTile(
              //   value: isChecked,
              //   controlAffinity: ListTileControlAffinity.leading,
              //   title: Text('Certificate Available'),
              //   onChanged: (val) {
              //     print('check $val');
              //     setState() {
              //       isChecked = val!;
              //     }
              //   },
              // ),

              SizedBox(height: 5),
              Row(
                children: [
                  Checkbox(
                      value: checkbox1,
                      onChanged: (val) {
                        setState(() {
                          checkbox1 = val!;
                        });
                      }),
                  Text(
                    'Certificate Available',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),

              // CheckboxListTile(
              //     value: isChecked,
              //     title: Text('Certificates Available'),
              //     onChanged: (val) {
              //       print('check $val');
              //       setState() {}
              //     }),

              SizedBox(height: 5),
              Container(
                height: 50,
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Add Certificate',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color: Colors.green,
                        width: 2.0,
                      ),
                    ),
                  ),
                  keyboardType: TextInputType.datetime,
                ),
              ),
              SizedBox(height: 10),
              Center(
                child: Flexible(
                  child: ElevatedButton(
                    // ignore: sort_child_properties_last
                    child: Text('Save',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        primary: Colors.green, fixedSize: Size(350, 40)),
                  ),
                ),
              ),
            ]),
// ............................Technical skills...............................
            ExpansionTile(
              title: Text('Technical skills'),
              children: [],
            ),
// ............................Soft skills.....................................
            ExpansionTile(
              title: Text('Soft skills'),
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                SizedBox(width: 80),
                Icon(Icons.add_box_outlined, size: 30),
                SizedBox(height: 5),
                Container(
                  child: TextFormField(
                      minLines: 3,
                      maxLines: 10,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                            color: Colors.green,
                            width: 2.0,
                          ),
                        ),
                      ),
                      keyboardType: TextInputType.multiline),
                ),
                SizedBox(height: 10),
                Center(
                  child: Flexible(
                    child: ElevatedButton(
                      // ignore: sort_child_properties_last
                      child: Text('Save',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          primary: Colors.green, fixedSize: Size(350, 40)),
                    ),
                  ),
                ),
              ],
            ),
//.............................Extracurricular activities........................
            ExpansionTile(
              title: Text('Extracurricular Activities'),
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                SizedBox(width: 30),
                Icon(Icons.add_box_outlined, size: 30),
                SizedBox(height: 5),
                Container(
                  child: TextFormField(
                      minLines: 3,
                      maxLines: 10,
                      decoration: InputDecoration(
                        hintText: 'Interests',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                            color: Colors.green,
                            width: 2.0,
                          ),
                        ),
                      ),
                      keyboardType: TextInputType.multiline),
                ),
                SizedBox(height: 5),
                Container(
                  child: TextFormField(
                      minLines: 3,
                      maxLines: 10,
                      decoration: InputDecoration(
                        hintText: 'Achievements',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                            color: Colors.green,
                            width: 2.0,
                          ),
                        ),
                      ),
                      keyboardType: TextInputType.multiline),
                ),
                SizedBox(height: 10),
                Center(
                  child: Flexible(
                    child: ElevatedButton(
                      // ignore: sort_child_properties_last
                      child: Text('Save',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          primary: Colors.green, fixedSize: Size(350, 40)),
                    ),
                  ),
                ),
              ],
            ),
//.........................Languages Known......................................
            ExpansionTile(title: Text('Languages Known'),
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  SizedBox(width: 50),
                  Icon(Icons.add_box_outlined, size: 30),

                  // TextField(
                  //   controller: controller,
                  //   decoration: InputDecoration(
                  //     hintText: 'Languages known',
                  //     suffixIcon: Icon(Icons.search_off_outlined),
                  //     border: OutlineInputBorder(
                  //         borderRadius: BorderRadius.circular(10.0),
                  //         borderSide:
                  //             BorderSide(color: Colors.green)),
                  //   ),
                  //   //  onChanged: searchLanguage,
                  // ),
                  // Expanded(
                  //   child: ListView.builder(
                  //       itemCount: display_language.length,
                  //       itemBuilder: (context, index) => ListTile(
                  //             title: Text(
                  //               display_language[index].language,
                  //             ),
                  //           )
                  //       //   final language = languages[index];

                  //       //   return ListTile(
                  //       //     title: Text('English'),
                  //       //   );
                  //       ),
                  // ),
                  Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Proficiency',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Text('Elementary'),
                              SizedBox(width: 10),
                              Radio<LanguageTypeEnum>(
                                  value: LanguageTypeEnum.Downloadable,
                                  groupValue: _languageTypeEnum,
                                  onChanged: (val) {
                                    setState(() {
                                      _languageTypeEnum = val;
                                    });
                                  }),
// RadiobuttonGroup()
                              // Radio(
                              //   value: 1,
                              //   groupValue: _value,
                              //   onChanged: (value) {
                              //     setState(() {
                              //       _value:
                              //       value;
                              //     });
                              //   },
                              // ),
                            ],
                          ),
                          SizedBox(width: 30),
                          Column(
                            children: [
                              Text('Limited working'),
                              SizedBox(width: 10),
                              Radio<LanguageTypeEnum>(
                                  value: LanguageTypeEnum.Downloadable,
                                  groupValue: _languageTypeEnum,
                                  onChanged: (val) {
                                    setState(() {
                                      _languageTypeEnum = val;
                                    });
                                  }),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Text('Professional working'),
                              SizedBox(width: 10),
                              Radio<LanguageTypeEnum>(
                                  value: LanguageTypeEnum.Downloadable,
                                  groupValue: _languageTypeEnum,
                                  onChanged: (val) {
                                    setState(() {
                                      _languageTypeEnum = val;
                                    });
                                  }),
                            ],
                          ),
                          SizedBox(width: 30),
                          Column(
                            children: [
                              Text('Native / Bilingual'),
                              SizedBox(width: 10),
                              Radio<LanguageTypeEnum>(
                                value: LanguageTypeEnum.Downloadable,
                                groupValue: _languageTypeEnum,
                                onChanged: (val) {
                                  setState(() {
                                    _languageTypeEnum = val;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Center(
                        child: Flexible(
                          child: ElevatedButton(
                            // ignore: sort_child_properties_last
                            child: Text('Save',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold)),
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                primary: Colors.green,
                                fixedSize: Size(350, 40)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ]),
//...........................Family details..................................
            ExpansionTile(
              title: Text('Family Details'),
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                SizedBox(width: 50),
                Icon(Icons.add_box_outlined, size: 30),
                SizedBox(height: 10),
                Container(
                  height: 50,
                  child: TextFormField(
                    decoration: InputDecoration(
                        hintText: "Father's Name",
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                            color: Colors.green,
                            width: 2.0,
                          ),
                        )),
                    keyboardType: TextInputType.name,
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  height: 50,
                  child: TextFormField(
                    decoration: InputDecoration(
                        hintText: "Father's Occupation",
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                            color: Colors.green,
                            width: 2.0,
                          ),
                        )),
                    keyboardType: TextInputType.name,
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  height: 50,
                  child: TextFormField(
                    decoration: InputDecoration(
                        hintText: "Mother's Name",
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                            color: Colors.green,
                            width: 2.0,
                          ),
                        )),
                    keyboardType: TextInputType.name,
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  height: 50,
                  child: TextFormField(
                    decoration: InputDecoration(
                        hintText: "Mother's Occupation",
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                            color: Colors.green,
                            width: 2.0,
                          ),
                        )),
                    keyboardType: TextInputType.name,
                  ),
                ),
                SizedBox(height: 10),
                Center(
                  child: Flexible(
                    child: ElevatedButton(
                      child: Text('Save',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          primary: Colors.green, fixedSize: Size(350, 40)),
                    ),
                  ),
                ),
              ],
            ),
// ................................Address......................................
            ExpansionTile(
              title: Text('Address'),
              children: [
                SizedBox(width: 80),
                Icon(Icons.add_box_outlined, size: 30),

                SizedBox(height: 10),
                Text(
                  'Communication Address',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),

                SizedBox(height: 10),
                Container(
                  height: 50,
                  child: TextFormField(
                    decoration: InputDecoration(
                        hintText: 'H.No/Flat No.',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                            color: Colors.green,
                            width: 2.0,
                          ),
                        )),
                    keyboardType: TextInputType.name,
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  height: 50,
                  child: TextFormField(
                    decoration: InputDecoration(
                        hintText: 'Block / Apartment',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                            color: Colors.green,
                            width: 2.0,
                          ),
                        )),
                    keyboardType: TextInputType.name,
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  height: 50,
                  child: TextFormField(
                    decoration: InputDecoration(
                        hintText: 'Street',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                            color: Colors.green,
                            width: 2.0,
                          ),
                        )),
                    keyboardType: TextInputType.name,
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  height: 50,
                  child: TextFormField(
                    decoration: InputDecoration(
                        hintText: 'Locality / Village',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                            color: Colors.green,
                            width: 2.0,
                          ),
                        )),
                    keyboardType: TextInputType.name,
                  ),
                ),
                DropdownButton(
                    //value: _selectedState,
                    items: _stateList.map((e) {
                      return DropdownMenuItem(
                        child: Text(e),
                        value: (e),
                      );
                    }).toList(),
                    onChanged: (val) {
                      setState(() {
                        _selectedState = val as String;
                      });
                    }),
// ...........................................................................
                DropdownButton(
                    // value: _selectedCity,
                    items: _cityList.map((e) {
                      return DropdownMenuItem(
                        child: Text(e),
                        value: (e),
                      );
                    }).toList(),
                    onChanged: (val) {
                      setState(() {
                        _selectedCity = val as String;
                      });
                    }),
                SizedBox(height: 10),
                Container(
                  height: 50,
                  child: TextFormField(
                    decoration: InputDecoration(
                        hintText: 'Pin Code',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                            color: Colors.green,
                            width: 2.0,
                          ),
                        )),
                    keyboardType: TextInputType.name,
                  ),
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    Icon(Icons.location_on, size: 45.0, color: Colors.red),

                    Text(locationMessage),
                    SizedBox(height: 5),
                    // ignore: deprecated_member_use
                    TextButton(
                      child: Text(
                        'Pick location from google',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      onPressed: () {
                        getCurrentLocation();
                      },
                    ),
                  ],
                ),

                SizedBox(height: 5),
                Row(
                  children: [
                    Checkbox(
                        value: checkbox1,
                        onChanged: (val) {
                          setState(() {
                            checkbox1 = val!;
                          });
                        }),
                    Text('Permanent address same as communication address'),
                  ],
                ),

                SizedBox(height: 10),
                Text(
                  'Permanent Address',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),

                SizedBox(height: 10),
                Container(
                  height: 50,
                  child: TextFormField(
                    decoration: InputDecoration(
                        hintText: 'H.No/Flat No.',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                            color: Colors.green,
                            width: 2.0,
                          ),
                        )),
                    keyboardType: TextInputType.name,
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  height: 50,
                  child: TextFormField(
                    decoration: InputDecoration(
                        hintText: 'Block / Apartment',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                            color: Colors.green,
                            width: 2.0,
                          ),
                        )),
                    keyboardType: TextInputType.name,
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  height: 50,
                  child: TextFormField(
                    decoration: InputDecoration(
                        hintText: 'Street',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                            color: Colors.green,
                            width: 2.0,
                          ),
                        )),
                    keyboardType: TextInputType.name,
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  height: 50,
                  child: TextFormField(
                    decoration: InputDecoration(
                        hintText: 'Locality / Village',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                            color: Colors.green,
                            width: 2.0,
                          ),
                        )),
                    keyboardType: TextInputType.name,
                  ),
                ),
                DropdownButton(
                    //value: _selectedState,
                    items: _stateList.map((e) {
                      return DropdownMenuItem(
                        child: Text(e),
                        value: (e),
                      );
                    }).toList(),
                    onChanged: (val) {
                      setState(() {
                        _selectedState = val as String;
                      });
                    }),
// ...........................................................................
                DropdownButton(
                    // value: _selectedCity,
                    items: _cityList.map((e) {
                      return DropdownMenuItem(
                        child: Text(e),
                        value: (e),
                      );
                    }).toList(),
                    onChanged: (val) {
                      setState(() {
                        _selectedCity = val as String;
                      });
                    }),
                SizedBox(height: 10),
                Container(
                  height: 50,
                  child: TextFormField(
                    decoration: InputDecoration(
                        hintText: 'Pin Code',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                            color: Colors.green,
                            width: 2.0,
                          ),
                        )),
                    keyboardType: TextInputType.name,
                  ),
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    Icon(Icons.location_on, size: 45.0, color: Colors.red),

                    Text(locationMessage),
                    SizedBox(height: 5),
                    // ignore: deprecated_member_use
                    TextButton(
                      child: Text(
                        'Pick location from google',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      onPressed: () {
                        getCurrentLocation();
                      },
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Center(
                  child: Flexible(
                    child: ElevatedButton(
                      // ignore: sort_child_properties_last
                      child: Text('Save',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          primary: Colors.green, fixedSize: Size(350, 40)),
                    ),
                  ),
                ),
              ],
            ),
//.............................Goals..........................................
            ExpansionTile(title: Text('Goals'), children: [
              SizedBox(height: 5),
              Container(
                child: TextFormField(
                    minLines: 3,
                    maxLines: 10,
                    decoration: InputDecoration(
                      hintText: 'Short term',
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: Colors.green,
                          width: 2.0,
                        ),
                      ),
                    ),
                    keyboardType: TextInputType.multiline),
              ),
              SizedBox(height: 5),
              Container(
                child: TextFormField(
                    minLines: 3,
                    maxLines: 10,
                    decoration: InputDecoration(
                      hintText: 'Long term',
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: Colors.green,
                          width: 2.0,
                        ),
                      ),
                    ),
                    keyboardType: TextInputType.multiline),
              ),
              SizedBox(height: 10),
              Center(
                child: Flexible(
                  child: ElevatedButton(
                    // ignore: sort_child_properties_last
                    child: Text('Save',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        primary: Colors.green, fixedSize: Size(350, 40)),
                  ),
                ),
              ),
            ]),
            // ................................Personality Traits..........................
            ExpansionTile(title: Text('Personality Traits'), children: [
              SizedBox(height: 5),
              Container(
                child: TextFormField(
                    minLines: 3,
                    maxLines: 10,
                    decoration: InputDecoration(
                      hintText: 'Strengths',
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: Colors.green,
                          width: 2.0,
                        ),
                      ),
                    ),
                    keyboardType: TextInputType.multiline),
              ),
              SizedBox(height: 5),
              Container(
                child: TextFormField(
                    minLines: 3,
                    maxLines: 10,
                    decoration: InputDecoration(
                      hintText: 'Weakness',
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: Colors.green,
                          width: 2.0,
                        ),
                      ),
                    ),
                    keyboardType: TextInputType.multiline),
              ),
              SizedBox(height: 10),
              Center(
                child: Flexible(
                  child: ElevatedButton(
                    // ignore: sort_child_properties_last
                    child: Text('Save',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        primary: Colors.green, fixedSize: Size(350, 40)),
                  ),
                ),
              ),
            ]),
          ]),
        )));
  }

  validate() {
    toDoModel.firstname = _firstnameEditingController.text;
    toDoModel.middlename = _middlenameEditingController.text;
    toDoModel.lastname = _lastnameEditingController.text;
    toDoModel.email = _emailEditingController.text;
    toDoModel.mobile = _mobileEditingController.text;
    toDoModel.DOB = _dobEditingController.text;

    DataBaseHelper dataBaseHelper = DataBaseHelper();
    dataBaseHelper.insert(toDoModel);

    Navigator.pop(context, true);
    AlertDialog(
      title: Text('inserted successfully'),
      actions: [
        MaterialButton(
          child: Text('Ok'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
