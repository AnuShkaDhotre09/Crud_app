
import 'package:flutter/material.dart';

import 'data.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController IDController = TextEditingController();

  TextEditingController contactController = TextEditingController();
  List<Contact> contacts = List.empty(growable: true);

  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Student Information'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: TextFormField(
                controller: nameController,
                keyboardType: TextInputType.text,
                cursorColor: Colors.purpleAccent,
                decoration: InputDecoration(
                  labelText: "Student Name",
                  fillColor: Colors.purpleAccent,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.purple,
                      width: 2.0,
                    ),
                  ),

                ),

              ),
            ),

            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: TextFormField(
                controller: IDController,
                keyboardType: TextInputType.number,
                cursorColor: Colors.purpleAccent,
                decoration: InputDecoration(
                  labelText: "Student ID",
                  fillColor: Colors.purpleAccent,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.purple,
                      width: 2.0,
                    ),
                  ),

                ),

              ),
            ),

            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: TextFormField(
                controller: contactController,
                keyboardType: TextInputType.number,
                maxLength: 10,
                cursorColor: Colors.purpleAccent,
                decoration: InputDecoration(
                  labelText: "Contact Number",
                  fillColor: Colors.purpleAccent,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.purple,
                      width: 2.0,
                    ),
                  ),

                ),

              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () {
                      //
                      String name = nameController.text.trim();
                      String contact = contactController.text.trim();
                      String ID = IDController.text.trim();

                      if (name.isNotEmpty && contact.isNotEmpty && ID.isNotEmpty) {
                        setState(() {
                          nameController.text = '';
                          contactController.text = '';
                          IDController.text=' ';

                          contacts.add(Contact(name: name, contact: contact, ID: ID,));
                        });
                      }
                      //
                    },
                    child: const Text('Save')),
                ElevatedButton(
                    onPressed: () {
                      //
                      String name = nameController.text.trim();
                      String contact = contactController.text.trim();
                      String ID = IDController.text.trim();

                      if (name.isNotEmpty && contact.isNotEmpty && ID.isNotEmpty ) {
                        setState(() {
                          nameController.text = '';
                          IDController.text=' ';

                          contactController.text = '';

                          contacts[selectedIndex].name = name;
                          contacts[selectedIndex].ID = ID;

                          contacts[selectedIndex].contact = contact;

                          selectedIndex = -1;
                        });
                      }
                      //
                    },
                    child: const Text('Update')),
              ],
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: contacts.length,
                itemBuilder: (context, index) => getRow(index),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget getRow(int index) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor:
          index % 2 == 0 ? Colors.deepPurpleAccent : Colors.purple,
          foregroundColor: Colors.white,
          child: Text(
            contacts[index].name[0],
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              contacts[index].name,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              contacts[index].ID,

            ),

            Text(contacts[index].contact),
          ],
        ),
        trailing: SizedBox(
          width: 70,
          child: Row(
            children: [
              InkWell(
                  onTap: () {
                    //
                    nameController.text = contacts[index].name;

                    IDController.text = contacts[index].ID;

                    contactController.text = contacts[index].contact;
                    setState(() {
                      selectedIndex = index;
                    });
                    //
                  },
                  child: const Icon(Icons.edit)),
              InkWell(
                  onTap: (() {
                    //
                    setState(() {
                      contacts.removeAt(index);
                    });
                    //
                  }),
                  child: const Icon(Icons.delete)),
            ],
          ),
        ),
      ),
    );
  }
}
