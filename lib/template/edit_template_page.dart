import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rip_card_maker/pages/final_card_page.dart';
import 'package:rip_card_maker/template/template2.dart';

class EditTemplatePage extends StatefulWidget {
  final TemplateData templateData;
  final Function(TemplateData) onEditComplete;
  final int index;

  EditTemplatePage({
    required this.templateData,
    required this.onEditComplete,
    required this.index,
  });

  @override
  _EditTemplatePageState createState() => _EditTemplatePageState();
}

class _EditTemplatePageState extends State<EditTemplatePage> {
  TextEditingController _birthDateController = TextEditingController();
  TextEditingController _deathDateController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  late ImagePicker _imagePicker;
  late XFile _pickedImage;

  @override
  void initState() {
    super.initState();

    _birthDateController.text = widget.templateData.dob;
    _deathDateController.text = widget.templateData.dod;
    _nameController.text = widget.templateData.latePerson;
    _descriptionController.text = widget.templateData.desc;
    _imagePicker = ImagePicker();
    _pickedImage = XFile('');
  }

  Future<void> _pickImage() async {
    final pickedFile =
        await _imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _pickedImage = pickedFile;
      });

      widget.templateData.image = _pickedImage.path;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Template"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: _pickImage,
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: const BoxDecoration(
                    color: Colors.grey,
                    shape: BoxShape.circle,
                  ),
                  child: _pickedImage.path.isEmpty
                      ? const Center(
                          child: Icon(CupertinoIcons.photo),
                        )
                      : ClipOval(
                          child: Image.file(
                            File(_pickedImage.path),
                            fit: BoxFit.cover,
                            width: 100,
                            height: 100,
                          ),
                        ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Name of decent"),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _birthDateController,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        hintText: 'From date',
                        label: const Text("Birth Date"),
                        hintStyle: const TextStyle(fontSize: 12),
                        suffixIcon: IconButton(
                          icon: const Icon(
                            Icons.calendar_today,
                            size: 18,
                          ),
                          onPressed: () {
                            showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1900),
                              lastDate: DateTime.now(),
                            ).then((date) {
                              if (date != null) {
                                _birthDateController.text =
                                    date.toString().split(' ')[0];
                              }
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextFormField(
                      controller: _deathDateController,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        hintText: 'To date',
                        label: const Text("Death Date"),
                        hintStyle: const TextStyle(fontSize: 12),
                        suffixIcon: IconButton(
                          icon: const Icon(
                            Icons.calendar_today,
                            size: 18,
                          ),
                          onPressed: () {
                            showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1900),
                              lastDate: DateTime.now(),
                            ).then((date) {
                              if (date != null) {
                                _deathDateController.text =
                                    date.toString().split(' ')[0];
                              }
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Description"),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          widget.templateData.latePerson = _nameController.text;
          widget.templateData.dob = _birthDateController.text;
          widget.templateData.dod = _deathDateController.text;
          widget.templateData.desc = _descriptionController.text;
          widget.templateData.image = _pickedImage.path;

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FinalCard(
                index: widget.index,
                templateData: widget.templateData,
              ),
            ),
          );
        },
        label: const Text("Generate Card"),
      ),
    );
  }
}
