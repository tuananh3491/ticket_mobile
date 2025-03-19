import 'package:flutter/material.dart';
import 'package:ticket_system/common/widgets/button/basic_app_button.dart';
import 'package:ticket_system/presentation/user/pages/success_page.dart';
import '../widgets/input_field.dart';
import '../widgets/image_picker.dart';

class CreateTicketPage extends StatefulWidget {
  @override
  _CreateTicketPageState createState() => _CreateTicketPageState();
}

class _CreateTicketPageState extends State<CreateTicketPage> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  final TextEditingController departmentController = TextEditingController();
  String? imagePath;
  String? selectedPriority;

  final List<String> priorityLevels = ["Thấp", "Trung bình", "Cao", "Khẩn cấp"];

  void saveTicket() {
    if (titleController.text.isEmpty || descriptionController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Vui lòng nhập đầy đủ thông tin")),
      );
      return;
    }

    // Ticket newTicket = Ticket(
    //   title: titleController.text,
    //   description: descriptionController.text,
    //   category: categoryController.text,
    //   priority: selectedPriority ?? "Thấp",
    //   department: departmentController.text,
    //   imagePath: imagePath,
    // );

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Create Request",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InputField(label: "Title", controller: titleController),
              InputField(
                  label: "Description", controller: descriptionController),
              ImagePickerWidget(onImageSelected: (path) {
                setState(() {
                  imagePath = path;
                });
              }),
              InputField(label: "Category", controller: categoryController),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelStyle: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Inter"),
                  labelText: "Priority",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.black, width: 2)),
                ),
                value: selectedPriority,
                onChanged: (value) {
                  setState(() {
                    selectedPriority = value!;
                  });
                },
                items: priorityLevels.map((priority) {
                  return DropdownMenuItem(
                    value: priority,
                    child: Text(priority),
                  );
                }).toList(),
              ),
              SizedBox(height: 20),
              InputField(label: "Department", controller: departmentController),
              SizedBox(height: 20),
              BasicAppButton(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (ctx) => SuccessPage()));
                  },
                  height: 50,
                  title: "SAVE"),
            ],
          ),
        ),
      ),
    );
  }
}
