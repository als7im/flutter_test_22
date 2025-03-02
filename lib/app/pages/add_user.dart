// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class AddUser extends StatefulWidget {
  const AddUser({super.key});

  @override
  _AddUserState createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  // المتحولات لتخزين القيم المدخلة
  final _formKey = GlobalKey<FormState>();
  String firstName = '';
  String lastName = '';
  String familyName = '';
  DateTime? dateOfBirth; // لتخزين تاريخ الميلاد كقيمة DateTime
  String nationalId = '';
  String phoneNumber = '';
  String gender = 'ذكر'; // القيمة الافتراضية
  String nationality = '';

  // دالة لفتح DatePicker واختيار تاريخ الميلاد
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2050),
    );
    if (picked != null && picked != dateOfBirth) {
      setState(() {
        dateOfBirth = picked;
      });
    }
  }

  // دالة لجمع البيانات ووضعها في Map
  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      Map<String, String> userData = {
        "الاسم الأول": firstName,
        "الاسم الثاني": lastName,
        "اسم العائلة": familyName,
        "تاريخ الميلاد":
            dateOfBirth != null
                ? "${dateOfBirth!.year}-${dateOfBirth!.month}-${dateOfBirth!.day}"
                : "غير محدد",
        "الرقم الوطني": nationalId,
        "رقم الهاتف": phoneNumber,
        "الجنس": gender,
        "الجنسية": nationality,
      };

      // عرض البيانات في وحدة التحكم (Console)
      print("بيانات المستخدم: $userData");

      // يمكنك هنا إرسال البيانات إلى قاعدة بيانات أو معالجتها حسب الحاجة
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('نموذج إضافة المستخدمين')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // الاسم الأول
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'الاسم الأول',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 0.5),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'يرجى إدخال الاسم الأول';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    firstName = value!;
                  },
                ),
                SizedBox(height: 16),

                // الاسم الثاني
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'الاسم الثاني',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 0.5),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'يرجى إدخال الاسم الثاني';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    lastName = value!;
                  },
                ),
                SizedBox(height: 16),

                // اسم العائلة
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'اسم العائلة',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 0.5),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'يرجى إدخال اسم العائلة';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    familyName = value!;
                  },
                ),
                SizedBox(height: 16),

                // تاريخ الميلاد مع DatePicker
                InkWell(
                  onTap: () => _selectDate(context),
                  child: InputDecorator(
                    decoration: InputDecoration(
                      labelText: 'تاريخ الميلاد',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 0.5),
                      ),
                    ),
                    child: Text(
                      dateOfBirth != null
                          ? "${dateOfBirth!.year}-${dateOfBirth!.month}-${dateOfBirth!.day}"
                          : "اختر تاريخ الميلاد",
                      style: TextStyle(
                        color: dateOfBirth != null ? Colors.black : Colors.grey,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16),

                // الرقم الوطني (أرقام فقط)
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'الرقم الوطني',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 0.5),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'يرجى إدخال الرقم الوطني';
                    } else if (!RegExp(r'^\d+$').hasMatch(value)) {
                      return 'الرقم الوطني يجب أن يحتوي على أرقام فقط';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    nationalId = value!;
                  },
                ),
                SizedBox(height: 16),

                // رقم الهاتف (أرقام فقط)
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'رقم الهاتف',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 0.5),
                    ),
                  ),
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'يرجى إدخال رقم الهاتف';
                    } else if (!RegExp(r'^\d+$').hasMatch(value)) {
                      return 'رقم الهاتف يجب أن يحتوي على أرقام فقط';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    phoneNumber = value!;
                  },
                ),
                SizedBox(height: 16),

                // الجنس
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: 'الجنس',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 0.5),
                    ),
                  ),
                  value: gender,
                  onChanged: (String? newValue) {
                    setState(() {
                      gender = newValue!;
                    });
                  },
                  items:
                      ['ذكر', 'أنثى'].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                ),
                SizedBox(height: 16),

                // الجنسية
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'الجنسية',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 0.5),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'يرجى إدخال الجنسية';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    nationality = value!;
                  },
                ),
                SizedBox(height: 24),

                // زر الإرسال
                Center(
                  child: ElevatedButton(
                    onPressed: _submitForm,
                    child: Text('إرسال'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
