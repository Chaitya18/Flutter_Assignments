import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pos/Screen/MenuDrawer/MenuDrawer.dart';
import 'package:pos/Frontend/UX/textField.dart';

class NewProductScreen extends StatefulWidget {
  const NewProductScreen({super.key});

  @override
  State<NewProductScreen> createState() => _NewProductScreenState();
}

class _NewProductScreenState extends State<NewProductScreen> {
  TextEditingController price_controller = TextEditingController();
  TextEditingController name_controller = TextEditingController();

  File? _pic;
  Future<void> selectimage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image == null) {
        return;
      }
      final pic = File(image.path);
      setState(() {
        _pic = pic;
      });
    } on PlatformException catch (e) {
      print("Failed to pick image: $e");
    }
  }

  Future<void> uploadfile() async {
    
    setState(() {
      _pic = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent),
      drawer: MyMenuDrawer(),
      body: SingleChildScrollView(
        child: Expanded(
          child: Container(
            color: Colors.orange,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                SizedBox(height: 50,),
                GestureDetector(
                  child: Container(
                    decoration: BoxDecoration(color: Colors.white),
                    height: 200,
                    width: 200,
                    child: _pic != null
                        ? Image.file(_pic!,fit: BoxFit.cover,)
                        : Image.asset("assets/logos/upload.jpeg",fit: BoxFit.contain,),
                  ),
                  onTap: () => selectimage(),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: textField(
                      name_controller, "Product Name", "Product Name"),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: textField(price_controller, "Price", "Price"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
