import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task/View/Widgets/CustomTextFormField.dart';

class AddTask extends StatefulWidget {
  const AddTask({Key? key}) : super(key: key);
  static String id = 'AddTask';
  @override
  _AddTaskState createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  int? gValue;
  List<String> h = ['High', 'Intermediate', 'Low'];
  DateTime date = DateTime.now();
  showDate() async {
    await showDatePicker(
        context: context,
        initialDate: date,
        firstDate: DateTime(1999),
        lastDate: DateTime(2030));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: InkWell(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: SingleChildScrollView(
            child: Column(
              children: [
                Align(alignment: Alignment.topLeft, child: BackButton()),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 35),
                      child: Text(
                        'Add Task',
                        style: GoogleFonts.jomolhari(
                            fontSize: 40, fontWeight: FontWeight.w600),
                      ),
                    )),
                SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 33),
                            child: CustomTextFormField(
                              labelText: 'Task Title',
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 33),
                            child: CustomTextFormField(
                              labelText: 'Task Date',
                              onTap: showDate,
                              readOnly: true,
                            ),
                          ),
                          CustomTextFormField(
                            labelText: 'Task Description',
                            lines: 3,
                          ),
                        ],
                      )),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: 70,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Radio(
                                fillColor: MaterialStateColor.resolveWith(
                                    (states) => Colors.deepPurple),
                                value: index,
                                groupValue: gValue,
                                onChanged: (v) {
                                  setState(() {
                                    gValue = index;
                                  });
                                }),
                            Text(h[index]),
                          ],
                        );
                      }),
                ),
                SizedBox(
                  height: 30,
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: 55,
                    width: 200,
                    decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(8)),
                    child: Center(
                        child: Text(
                      'Add Task',
                      style:
                          GoogleFonts.share(color: Colors.white, fontSize: 33),
                    )),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
