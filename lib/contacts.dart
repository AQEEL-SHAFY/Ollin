// main.dart
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:url_launcher/url_launcher.dart';


import 'database.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

        // Remove the debug banner
        debugShowCheckedModeBanner: false,
        home: const ContactPage());
  }
}

class ContactPage extends StatefulWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  // All journals
  List<Map<String, dynamic>> _journals = [];

  bool _isLoading = true;
  // This function is used to fetch all data from the database
  void _refreshJournals() async {
    final data = await SQLHelper.getItems();
    setState(() {
      _journals = data;
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _refreshJournals(); // Loading the diary when the app starts
  }

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  // This function will be triggered when the floating button is pressed
  // It will also be triggered when you want to update an item
  void _showForm(int? id) async {
    if (id != null) {
      // id == null -> create new item
      // id != null -> update an existing item
      final existingJournal =
          _journals.firstWhere((element) => element['id'] == id);
      _titleController.text = existingJournal['title'];
      _descriptionController.text = existingJournal['description'];
    }

    showModalBottomSheet(
        context: context,
        elevation: 5,
        isScrollControlled: true,
        builder: (_) => Container(
              padding: EdgeInsets.only(
                top: 50,
                left: 15,
                right: 15,
                bottom: 5,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextField(
                    controller: _titleController,
                    decoration: const InputDecoration(hintText: 'User Name'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: _descriptionController,
                    decoration:
                        const InputDecoration(hintText: 'Contact Number'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 70,
                    width: 448,
                    margin: EdgeInsets.only(
                        top: 50.0, left: 0.0, right: 0.0, bottom: 20.0),
                    child: ElevatedButton(
                      child: Text(
                        (id == null ? 'Save Contact' : 'Update'),
                        style: TextStyle(fontSize: 24.0),
                      ),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Color(0xFF9B9A93)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        )),
                      ),
                      onPressed: () async {
                        // Save new journal
                        if (id == null) {
                          await _addItem();
                        }

                        if (id != null) {
                          await _updateItem(id);
                        }

                        // Clear the text fields
                        _titleController.text = '';
                        _descriptionController.text = '';

                        // Close the bottom sheet
                        Navigator.of(context).pop();
                      },

                      // ignore: prefer_const_constructors
                    ),
                  ),
                ],
              ),
            ));
  }

// Insert a new journal to the database
  Future<void> _addItem() async {
    await SQLHelper.createItem(
        _titleController.text, _descriptionController.text);
    _refreshJournals();
  }

  // Update an existing journal
  Future<void> _updateItem(int id) async {
    await SQLHelper.updateItem(
        id, _titleController.text, _descriptionController.text);
    _refreshJournals();
  }

  // Delete an item
  void _deleteItem(int id) async {
    await SQLHelper.deleteItem(id);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Successfully deleted a journal!'),
    ));
    _refreshJournals();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFDEDCD2),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: _journals.length,
              itemBuilder: (context, index) => Card(
                color: Color.fromARGB(255, 221, 241, 255),
                margin: const EdgeInsets.all(15),
                child: ListTile(
                  title: Text(_journals[index]['title']),
                  subtitle: Text(_journals[index]['description']),
                  trailing: SizedBox(
                    width: 100,
                    child: Row(
                      children: [
                        // IconButton(
                        //   icon: const Icon(Icons.edit),
                        //   onPressed: () => _showForm(_journals[index]['id']),
                        // ),
                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () => _deleteItem(_journals[index]['id']),
                          // launch(('tel://${item.mobile_no}'));
                        ),
                        IconButton(
                          icon: const Icon(Icons.call),
                          onPressed: () =>launch(('tel:${_journals[index]['description']}')),
                          //  FlutterPhoneDirectCaller.callNumber(_journals[index]['description']);
                          // launch(('tel://${item.mobile_no}'));
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => _showForm(null),
      ),
    );
    // ignore: dead_code
  }
}
