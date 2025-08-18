import 'dart:core';
import 'package:flutter/services.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class CtNewService extends StatefulWidget {
  const CtNewService({super.key});

  @override
  State<CtNewService> createState() => _CtNewServiceState();
}

class _CtNewServiceState extends State<CtNewService> {
  String? selectedDivision;
  String? selectedSubDivision;
  String? selectedSection;
  DateTime? selectedDate;

  String? selectedService;
 
  String? selectedNewMeterRatio;
  String? selectedNewMeterMakeName;
  String? selectedNewMeterWarranty;
  String? meterSatisfaction="Yes";

  final TextEditingController _controllerPO = TextEditingController();
  // ignore: non_constant_identifier_names
  final TextEditingController _meter_serial_no = TextEditingController();
  final TextEditingController _kwh = TextEditingController();

  final TextEditingController _kvah = TextEditingController();
  final TextEditingController _md = TextEditingController();
  final TextEditingController _kwhError = TextEditingController();
  final TextEditingController _importKWH = TextEditingController();
  final TextEditingController _exportKWH = TextEditingController();
  final TextEditingController _importKVAH = TextEditingController();
  final TextEditingController _exportKVAH = TextEditingController();
  final TextEditingController _importMD = TextEditingController();
  final TextEditingController _exportMD = TextEditingController();
  final TextEditingController _remarks = TextEditingController();
  final TextEditingController _kwhErrorInSolar = TextEditingController();

  // void _showAlertDialog(String message) {
  //   showDialog(
  //     context: context,
  //     builder: (context) => AlertDialog(
  //       title: const Text("Validation"),
  //       content: Text(message),
  //       actions: [
  //         TextButton(
  //           onPressed: () => Navigator.pop(context),
  //           child: const Text("OK"),
  //         ),
  //       ],
  //     ),
  //   );
  // }
  void _showAlertDialog(BuildContext context, String message) {
  // Decide color based on message content
  final isSuccess = !message.toLowerCase().contains("please") && !message.toLowerCase().contains("error");

  showDialog(
    context: context,
    builder: (ctx) => AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
      ),
      backgroundColor: Colors.white,
      titlePadding: EdgeInsets.zero,
      title: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(12),
        color: isSuccess ? Colors.green : Colors.red,
        child: Text(
          isSuccess ? "Success" : "Failed",
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      content: Text(
        message,
        style: TextStyle(
          color: isSuccess ? Colors.green : Colors.red,
          fontSize: 16,
        ),
        textAlign: TextAlign.center,
      ),
      actionsPadding: const EdgeInsets.only(left: 12, right: 12, bottom: 12),
      actions: [
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: isSuccess ? Colors.green : Colors.red,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text("OK"),
          ),
        ),
      ],
    ),
  );
}


  bool isChecked =
      false; // This is for solar meter  in new meter reading details.

  void _checkField() {
    if (selectedDivision == null || selectedDivision!.isEmpty) {
      _showAlertDialog(context,"Please Select your Division !");
    } else if (selectedSubDivision == null || selectedSubDivision!.isEmpty) {
      _showAlertDialog(context,"Please Select your Sub Division !");
    } else if (selectedSection == null || selectedSection!.isEmpty) {
      _showAlertDialog(context,"Please Select your Section !");
    } else if (selectedDate == null) {
      _showAlertDialog(context,"Please Select Date of Charge");
    } else if (selectedNewMeterMakeName == null ||
        selectedNewMeterMakeName!.isEmpty) {
      _showAlertDialog(context,"Please Select Your Meter Make Name");
    } else if (_meter_serial_no.text.trim().isEmpty) {
      _showAlertDialog(context,"Please enter Meter Serial NO.");
    } else if (selectedNewMeterRatio == null || selectedNewMeterRatio!.isEmpty) {
      _showAlertDialog(context,"Please Select Meter Ratio");
    } else if (selectedNewMeterWarranty == null || selectedNewMeterWarranty!.isEmpty) {
      _showAlertDialog(context,"Please Select Your Meter Warranty");
    } else if (_controllerPO.text.trim().isEmpty) {
      _showAlertDialog(context,"Please Enter Your PO");
    } else if (!isChecked && _kwh.text.trim().isEmpty) {
      _showAlertDialog(context,"Please Enter KWH");
    } else if (!isChecked && _kvah.text.trim().isEmpty) {
      _showAlertDialog(context,"Please Enter KVAH");
    } else if (!isChecked && _md.text.trim().isEmpty) {
      _showAlertDialog(context,"Please Enter MD");
    } else if (!isChecked && _kwhError.text.trim().isEmpty) {
      _showAlertDialog(context,"Please Enter KWH ERROR");
    } else if (!isChecked && meterSatisfaction == null ||
        meterSatisfaction!.isEmpty) {
      _showAlertDialog(context,"Please Check the METER SATISFACTION");
    } else if (isChecked && _importKWH.text.trim().isEmpty) {
      _showAlertDialog(context,"Please Enter IMPORT KWH ");
    } else if (isChecked && _exportKWH.text.trim().isEmpty) {
      _showAlertDialog(context,"Please Enter EXPORT  KWH");
    } else if (isChecked && _importKVAH.text.trim().isEmpty) {
      _showAlertDialog(context,"Please Enter IMPORT KVAH");
    } else if (isChecked && _exportKVAH.text.trim().isEmpty) {
      _showAlertDialog(context,"Please Enter EXPORT  KAVH");
    } else if (isChecked && _importMD.text.trim().isEmpty) {
      _showAlertDialog(context,"Please Enter IMPORT  MD");
    } else if (isChecked && _exportMD.text.trim().isEmpty) {
      _showAlertDialog(context,"Please Enter EXPORT  MD");
    } else if (isChecked && _kwhErrorInSolar.text.trim().isEmpty) {
      _showAlertDialog(context,"Please Enter KWH ERROR IN SOLAR");
    } else if (isChecked && meterSatisfaction == null ||
        meterSatisfaction!.isEmpty) {
      _showAlertDialog(context,"Please Check the METER SATISFACTION");
    } else if (_remarks.text.trim().isEmpty) {
      _showAlertDialog(context,"Please fill the REMARKS");
    } else {
      _showAlertDialog(context,"All Fields is filled ✅");
    }
  }

  //for dropdown code
  List<String> selectDivision = [
    "SELECT",
    "HANAMKONDA TOWN",
    "HANAMKONDA RURAL",
  ];
  List<String> selectSubDivision = [
    "SELECT",
    "KAZIPET",
    "HANAMKONDA",
    "NAYEEMANAGAR",
  ];
  List<String> selectSection = [
    "SELECT",
    "NIT",
    "MADIKONDA",
    "KAZIPET",
    "KADIPIKONDA",
    "WADDEPALLY",
  ];
  List<String> selectNewMeterMakeName = [
    "Eister",
    "GENUS",
    "HE",
    "HPL",
    "L&G",
    "L&T",
    "SECURE",
    "UTL",
  ];
  //

  final InputDecoration myTextFieldDecoration = const InputDecoration(
    border: UnderlineInputBorder(),
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.grey, width: 1),
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.blue, width: 2),
    ),
    contentPadding: EdgeInsets.symmetric(vertical: 4),
  );

  Future<void> _pickDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: const Color.fromARGB(255, 16, 156, 188),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('CT METERS', style: TextStyle(fontSize: 18)),
            Text(
              'CT_NEW_SERVICE',
              style: TextStyle(fontSize: 14, color: Colors.white70),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            children: [
              Card(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        "SECTION DETAILS",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Division Dropdown
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text(
                            "SELECT DIVISION",
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),

                      DropdownButtonFormField2<String>(
                        isExpanded: true,
                        value: selectedDivision,
                        decoration: InputDecoration(
                          hintText: "SELECT",
                          border: OutlineInputBorder(),
                          // labelText: 'Select Complaint 2',
                        ),
                        items: selectDivision
                            .map(
                              (e) => DropdownMenuItem<String>(
                                value: e,
                                child: Text(e),
                              ),
                            )
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedDivision = value;
                            selectedSubDivision = null;
                            //selectSubDivision[0]; // reset next
                            selectedSection = null; // reset third
                          });
                        },
                      ),
                      const SizedBox(height: 12),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text(
                            "SELECT SUB-DIVISION",
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                      DropdownButtonFormField2<String>(
                        isExpanded: true,
                        value: selectedSubDivision,
                        decoration: InputDecoration(
                          hintText: "SELECT",
                          border: OutlineInputBorder(),
                          // labelText: 'Select Complaint 2',
                        ),
                        items: selectSubDivision
                            .map(
                              (e) => DropdownMenuItem<String>(
                                value: e,
                                child: Text(e),
                              ),
                            )
                            .toList(),
                        onChanged: selectedDivision == null
                            ? null
                            : (value) {
                                setState(() {
                                  selectedSubDivision = value;
                                  selectedSection = null;
                                  // selectedSection = selectSection[0];
                                });
                              },
                      ),

                      const SizedBox(height: 12),

                      // Status Dropdown
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text(
                            "SELECT SECTION",
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),

                      DropdownButtonFormField2<String>(
                        isExpanded: true,
                        value: selectedSection,
                        decoration: InputDecoration(
                          hintText: "SELECT",
                          border: OutlineInputBorder(),
                          // labelText: 'Select Complaint 2',
                        ),
                        items: selectSection
                            .map(
                              (e) => DropdownMenuItem<String>(
                                value: e,
                                child: Text(e),
                              ),
                            )
                            .toList(),
                        onChanged: selectedSubDivision == null
                            ? null
                            : (value) {
                                setState(() {
                                  selectedSection = value;
                                });
                              },
                      ),

                      const SizedBox(height: 12),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text(
                            "Date of Charge",
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: _pickDate,
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 14,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            selectedDate != null
                                ? "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}"
                                : "TAP HERE",
                            style: const TextStyle(fontSize: 14),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              ),

              Card(
                color: Colors.white,

                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        "REGISTRATION DETAILS",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Divider(color: Colors.grey, thickness: 0.5),
                      SizedBox(height: 10),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "REG NUMBER",
                            style: TextStyle(fontSize: 12),
                          ),
                          const SizedBox(height: 4),
                          TextField(
                            style: const TextStyle(fontSize: 12),
                            keyboardType: TextInputType.text, // keyboard type
                            maxLength: 4, // restrict to 4 characters
                            decoration: const InputDecoration(
                              isDense: true,
                              contentPadding: EdgeInsets.all(8),
                              counterText:
                                  "", // hide default counter below field
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "SERVICE NAME",
                            style: TextStyle(fontSize: 12),
                          ),
                          const SizedBox(height: 4),
                          TextField(
                            style: const TextStyle(fontSize: 12),
                            keyboardType: TextInputType.text, // keyboard type
                            maxLength: 4, // restrict to 4 characters
                            decoration: const InputDecoration(
                              isDense: true,
                              contentPadding: EdgeInsets.all(8),
                              counterText:
                                  "", // hide default counter below field
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 10),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "LOAD (KW)",
                            style: TextStyle(fontSize: 12),
                          ),
                          const SizedBox(height: 4),
                          TextField(
                            style: const TextStyle(fontSize: 12),
                            keyboardType: TextInputType.number,
                            maxLength: 4,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            decoration: const InputDecoration(
                              isDense: true,
                              contentPadding: EdgeInsets.all(8),
                              counterText: "",
                            ),
                          ),
                          
                        ],
                        
                        
                      ),
                                            SizedBox(height: 10),

                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),

              Card(
                color: Colors.white,

                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        "NEW METER DETAILS",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Divider(thickness: 0.5, color: Colors.grey),
                      const SizedBox(height: 16),

                      // Division Dropdown
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text(
                            "METER MAKE",
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),

                      DropdownButtonFormField2<String>(
                        isExpanded: true,
                        value: selectedNewMeterMakeName,
                        decoration: InputDecoration(
                          hintText: "SELECT",
                          border: OutlineInputBorder(),
                          // labelText: 'Select Complaint 2',
                        ),
 
                        items: selectNewMeterMakeName
                            .map(
                              (e) => DropdownMenuItem<String>(
                                value: e,
                                child: Text(e),
                              ),
                            )
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedNewMeterMakeName = value;
                          });
                        },
                      ),
                      const SizedBox(height: 12),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text(
                            "NEW METER SERIAL NO",
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                      TextField(
                        controller: _meter_serial_no,
                        decoration: InputDecoration(
                          // labelText: "Enter Meter Make",
                        ),
                        onChanged: (value) {
                          // Handle input change
                        },
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text(
                            "NEW METER CT RATIO",
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),

                      DropdownButtonFormField2<String>(
                        isExpanded: true,
                        value: selectedNewMeterRatio,
                        decoration: InputDecoration(
                          hintText: "SELECT",
                          border: OutlineInputBorder(),
                          // labelText: 'Select Complaint 2',
                        ),
                        items: ["100/5A", "125/5A", "200/5A"]
                            .map(
                              (e) => DropdownMenuItem<String>(
                                value: e,
                                child: Text(e),
                              ),
                            )
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedNewMeterRatio = value;
                          });
                        },
                      ),

                      const SizedBox(height: 12),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text(
                            "NEW METER WARRANTY",
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),

                      DropdownButtonFormField2<String>(
                        isExpanded: true,
                        value: selectedNewMeterWarranty,
                        decoration: InputDecoration(
                          hintText: "SELECT",
                          border: OutlineInputBorder(),
                          // labelText: 'Select Complaint 2',
                        ),
                        items: ["WGP", "RGP", "BGP"]
                            .map(
                              (e) => DropdownMenuItem<String>(
                                value: e,
                                child: Text(e),
                              ),
                            )
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedNewMeterWarranty = value;
                            //     });
                          });
                        },
                      ),

                      const SizedBox(height: 12),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text(
                            "NEW METER PO NO",
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                     
                      TextField(
  keyboardType: TextInputType.text,  
  inputFormatters: [
    FilteringTextInputFormatter.allow(RegExp("[a-zA-Z0-9]")),  
    LengthLimitingTextInputFormatter(4),  
  ],
  decoration: const InputDecoration(
   ),
  onChanged: (value) {
    // handle input
  },
),
                      SizedBox(height: 12),

                      Row(
                        children: [
                          const Text(
                            "PO MONTH YEAR(MM/YY)",
                            style: TextStyle(fontSize: 12, color: Colors.red),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: TextField(
                              controller: _controllerPO,
                              textAlign: TextAlign.right,
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(
                                  6,
                                ), // MMYYYY (digits only, no slash)
                                TextInputFormatter.withFunction((
                                  oldValue,
                                  newValue,
                                ) {
                                  String digits = newValue.text.replaceAll(
                                    '/',
                                    '',
                                  );

                                  // Auto-prepend '0' if month is single digit and > 1
                                  if (digits.length == 1 &&
                                      int.tryParse(digits) != null) {
                                    int m = int.parse(digits);
                                    if (m > 1) {
                                      digits = '0' + digits; // e.g., 3 → 03
                                    }
                                  }

                                  // Validate month
                                  if (digits.length >= 2) {
                                    int month =
                                        int.tryParse(digits.substring(0, 2)) ??
                                        0;
                                    if (month < 1 || month > 12) {
                                      return oldValue; // Reject invalid month
                                    }
                                  }

                                  // Limit to 6 digits (MMYYYY)
                                  if (digits.length > 6) {
                                    digits = digits.substring(0, 6);
                                  }

                                  // Insert slash after month
                                  String formatted = digits;
                                  if (digits.length > 2) {
                                    formatted =
                                        digits.substring(0, 2) + '/' +   digits.substring(2);
                                  }

                                  return TextEditingValue(
                                    text: formatted,
                                    selection: TextSelection.collapsed(
                                      offset: formatted.length,
                                    ),
                                  );
                                }),
                              ],
                              decoration: InputDecoration(
                                hintText: "MM/YYYY",
                                border: OutlineInputBorder(),
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 8,
                                  horizontal: 10,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              Card(
                color: Colors.white,

                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        "NEW  METER READING DETAILS",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Division Dropdown
                      Row(
                        children: [
                          Checkbox(
                            value: isChecked,
                            onChanged: (bool? value) {
                              setState(() {
                                isChecked = value ?? false;
                              });
                            },
                          ),
                          const Text("SOLAR METER"),
                        ],
                      ),
                      if (!isChecked) ...[
                        Row(
                          children: [
                            Expanded(flex: 2, child: const Text("KWH")),
                            Expanded(
                              flex: 2,
                              child: TextField(
                                controller: _kwh,
                                textAlign: TextAlign.right,
                                keyboardType: TextInputType.number,
                                decoration: myTextFieldDecoration,
                              ),
                            ),
                          ],
                        ),

                        Row(
                          children: [
                            Expanded(flex: 2, child: const Text("KVAH")),
                            Expanded(
                              flex: 2,
                              child: TextField(
                                controller: _kvah,
                                textAlign: TextAlign.right,
                                keyboardType: TextInputType.number,
                                decoration: myTextFieldDecoration,
                              ),
                            ),
                          ],
                        ),

                        Row(
                          children: [
                            Expanded(flex: 2, child: const Text("MD")),
                            Expanded(
                              flex: 2,
                              child: TextField(
                                controller: _md,
                                textAlign: TextAlign.right,
                                keyboardType: TextInputType.number,
                                decoration: myTextFieldDecoration,
                              ),
                            ),
                          ],
                        ),

                        Row(
                          children: [
                            Expanded(flex: 2, child: const Text("KWH ERROR %")),
                            Expanded(
                              flex: 2,
                              child: TextField(
                                controller: _kwhError,
                                textAlign: TextAlign.right,
                                keyboardType: TextInputType.number,
                                decoration: myTextFieldDecoration,
                              ),
                            ),
                          ],
                        ),

                        Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: const Text("METER SATISFACTORY"),
                            ),
                            Expanded(
                              flex: 2,
                              child: DropdownButtonFormField2<String>(
                                decoration: myTextFieldDecoration,
                                value: meterSatisfaction,
                                 items: ["Yes", "No"]
                                    .map(
                                      (e) => DropdownMenuItem<String>(
                                        value: e,
                                        child: Text(e),
                                      ),
                                    )
                                    .toList(),
                                onChanged: (value) {
                                  setState(() {
                                    meterSatisfaction = value;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ] else ...[
                        Row(
                          children: [
                            Expanded(flex: 2, child: const Text("IMPORT KWH")),
                            Expanded(
                              flex: 2,
                              child: TextField(
                                controller: _importKWH,
                                textAlign: TextAlign.right,
                                keyboardType: TextInputType.number,
                                decoration: myTextFieldDecoration,
                              ),
                            ),
                          ],
                        ),

                        Row(
                          children: [
                            Expanded(flex: 2, child: const Text("EXPORT KWH")),
                            Expanded(
                              flex: 2,
                              child: TextField(
                                controller: _exportKWH,
                                textAlign: TextAlign.right,
                                keyboardType: TextInputType.number,
                                decoration: myTextFieldDecoration,
                              ),
                            ),
                          ],
                        ),

                        Row(
                          children: [
                            Expanded(flex: 2, child: const Text("IMPORT KVAH")),
                            Expanded(
                              flex: 2,
                              child: TextField(
                                controller: _importKVAH,
                                textAlign: TextAlign.right,
                                keyboardType: TextInputType.number,
                                decoration: myTextFieldDecoration,
                              ),
                            ),
                          ],
                        ),

                        Row(
                          children: [
                            Expanded(flex: 2, child: const Text("EXPORT KVAH")),
                            Expanded(
                              flex: 2,
                              child: TextField(
                                controller: _exportKVAH,
                                textAlign: TextAlign.right,
                                keyboardType: TextInputType.number,
                                decoration: myTextFieldDecoration,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(flex: 2, child: const Text("IMPORT MD")),

                            Expanded(
                              flex: 2,
                              child: TextField(
                                controller: _importMD,
                                textAlign: TextAlign.right,
                                keyboardType: TextInputType.number,
                                decoration: myTextFieldDecoration,
                              ),
                            ),
                          ],
                        ),

                        Row(
                          children: [
                            Expanded(flex: 2, child: const Text("EXPORT MD")),

                            Expanded(
                              flex: 2,
                              child: TextField(
                                controller: _exportMD,
                                textAlign: TextAlign.right,
                                keyboardType: TextInputType.number,
                                decoration: myTextFieldDecoration,
                              ),
                            ),
                          ],
                        ),

                        Row(
                          children: [
                            Expanded(flex: 2, child: const Text("KWH ERROR %")),
                            Expanded(
                              flex: 2,
                              child: TextField(
                                controller: _kwhErrorInSolar,
                                textAlign: TextAlign.right,
                                keyboardType: TextInputType.number,
                                decoration: myTextFieldDecoration,
                              ),
                            ),
                          ],
                        ),

                        Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: const Text("METER SATISFACTORY"),
                            ),

                            Expanded(
                              flex: 2,
                              child: DropdownButtonFormField2<String>(
                                decoration: myTextFieldDecoration,
                                value: meterSatisfaction,
                                 items: ["Yes", "No"]
                                    .map(
                                      (e) => DropdownMenuItem<String>(
                                        value: e,
                                        child: Text(e),
                                      ),
                                    )
                                    .toList(),
                                onChanged: (value) {
                                  setState(() {
                                    meterSatisfaction = value;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ],
                  ),
                ),
              ),

              //remarks
              Card(
                color: Colors.white,

                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        "REMARKS",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text(
                            "REMARKS",
                            style: TextStyle(fontSize: 12, color: Colors.red),
                          ),
                        ],
                      ),
                      TextField(
                        controller: _remarks,
                        minLines: 5,
                        maxLines: null,
                        keyboardType: TextInputType.multiline,
                        decoration: InputDecoration(
                          hintText: "Enter remarks...",
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (value) {},
                      ),

                     ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

               Container(
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(
                    10,
                  ), // Adjust radius as needed
                ),
                child: TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        10,
                      ),  
                    ),
                  ),
                  onPressed:_checkField,
                  child: const Text("Submit"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
