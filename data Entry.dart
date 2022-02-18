import 'package:flutter/material.dart';
//import 'Home_Page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}


//import 'package:flutter/material.dart';
//import 'package:sample/Edit_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Column(
        children: [
          Placeholder(),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => EditPage()));
            },
            child: Text('Add'),
          )
        ],
      ),
    );
  }
}

//import 'package:flutter/material.dart';

class EditPage extends StatefulWidget {
  @override
  _EditPageState createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController jobNoController = TextEditingController();
  TextEditingController complaintController = TextEditingController();
  TextEditingController enginNoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit'), backgroundColor: Colors.teal),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Form(
            child: Column(
          children: [
            textField(nameController, 'Technician Name', Icons.people),
            SizedBox(height: 20),
            textField(complaintController, 'Complaint Number', Icons.settings),
            SizedBox(height: 20),
            textField(jobNoController, 'JobCard Number', Icons.notes),
            SizedBox(height: 20),
            TextFormField(
              controller: enginNoController,
              decoration: InputDecoration(
                labelText: 'Engine Number',
                prefixIcon: Icon(Icons.engineering),
                border: OutlineInputBorder(),
              ),
            ),
          ],
        )),
      ),
    );
  }

  Widget textField(
      TextEditingController controller, String labelText, IconData icon) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(),
      ),
    );
  }
}
