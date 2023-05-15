import 'package:flutter/material.dart';
import 'package:multiselect/multiselect.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddPage extends StatefulWidget {
  const AddPage({Key? key}) : super(key: key);
  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  final nameController = TextEditingController();
  final yearController = TextEditingController();
  final posterController = TextEditingController();
  List<String> categories = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Movie'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
