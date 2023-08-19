import 'package:flutter/material.dart';
//import 'Home_Page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

//import 'package:flutter/material.dart';
//import 'package:sample/Edit_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Column(
        children: [
          const Placeholder(),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const EditPage()));
            },
            child: const Text('Add'),
          )
        ],
      ),
    );
  }
}

//import 'package:flutter/material.dart';

class EditPage extends StatefulWidget {
  const EditPage({super.key});

  @override
  State createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController jobNoController = TextEditingController();
  TextEditingController complaintController = TextEditingController();
  TextEditingController enginNoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit'), backgroundColor: Colors.teal),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Form(
            child: Column(
          children: [
            textField(nameController, 'Technician Name', Icons.people),
            const SizedBox(height: 20),
            textField(complaintController, 'Complaint Number', Icons.settings),
            const SizedBox(height: 20),
            textField(jobNoController, 'JobCard Number', Icons.notes),
            const SizedBox(height: 20),
            TextFormField(
              controller: enginNoController,
              decoration: const InputDecoration(
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
        border: const OutlineInputBorder(),
      ),
    );
  }
}
