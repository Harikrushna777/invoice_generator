import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import '../components/my_snackbar.dart';
import '../modals/global.dart';

class user_detail extends StatefulWidget {
  const user_detail({Key? key}) : super(key: key);

  @override
  State<user_detail> createState() => _user_detailState();
}

class _user_detailState extends State<user_detail> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController nameController =
      TextEditingController(text: Global.name);

  ImagePicker picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "User Details",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        // leading: MyBackButton(),
        backgroundColor: Colors.purple,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.purple,
            borderRadius: BorderRadius.circular(10),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 20),
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    CircleAvatar(
                      radius: 80,
                      foregroundImage: Global.image != null
                          ? FileImage(Global.image!)
                          : null,
                      child: const Text(
                        "Add",
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.purple,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    FloatingActionButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text("Selete The Method ?"),
                            actions: [
                              TextButton.icon(
                                onPressed: () async {
                                  Navigator.of(context).pop();

                                  XFile? img = await picker.pickImage(
                                      source: ImageSource.camera);

                                  if (img != null) {
                                    setState(() {
                                      Global.image = File(img.path);
                                    });
                                  }
                                },
                                label: const Text("Camara"),
                                icon: const Icon(Icons.camera_alt),
                              ),
                              const SizedBox(width: 50),
                              TextButton.icon(
                                onPressed: () async {
                                  XFile? img = await picker.pickImage(
                                      source: ImageSource.gallery);

                                  if (img != null) {
                                    setState(() {
                                      Global.image = File(img.path);
                                    });
                                  }
                                  Navigator.of(context).pop();
                                },
                                label: const Text("Gallery"),
                                icon: const Icon(Icons.image),
                              ),
                            ],
                          ),
                        );
                      },
                      mini: true,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: const Icon(Icons.camera, color: Colors.purple),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                // Name
                Row(
                  children: [
                    const SizedBox(width: 10),
                    Expanded(
                      child: Icon(
                        Icons.account_circle_sharp,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      flex: 8,
                      child: TextFormField(
                        initialValue: Global.name,
                        cursorColor: Colors.white,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Please Enter The Name";
                          } else {
                            return null;
                          }
                        },
                        onSaved: (val) {
                          Global.name = val;
                        },
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          hintText: "Enter The Name",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          hintStyle: const TextStyle(
                            color: Colors.white,
                          ),
                          labelText: "Name",
                          labelStyle: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                  ],
                ),
                const SizedBox(height: 20),
                //E-mail
                Row(
                  children: [
                    const SizedBox(width: 10),
                    Expanded(
                      child: Icon(
                        Icons.mail,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      flex: 8,
                      child: TextFormField(
                        initialValue: Global.name,
                        cursorColor: Colors.white,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Please Enter Your E-mail";
                          } else {
                            return null;
                          }
                        },
                        onSaved: (val) {
                          Global.email = val;
                        },
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          hintText: "Enter Your E-mail",
                          hintStyle: const TextStyle(
                            color: Colors.white,
                          ),
                          labelText: "E-mail",
                          labelStyle: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                  ],
                ),
                const SizedBox(height: 20),
                // Mobail Number
                Row(
                  children: [
                    const SizedBox(width: 10),
                    Expanded(
                      child: Icon(
                        Icons.phone_android,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      flex: 8,
                      child: TextFormField(
                        maxLength: 10,
                        initialValue: (Global.contact == null)
                            ? null
                            : Global.contact.toString(),
                        cursorColor: Colors.white,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                        keyboardType: TextInputType.phone,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Please Enter Your Mobail No";
                          } else if (val.length < 10) {
                            return "Contact Number must have 10 digits...";
                          } else {
                            return null;
                          }
                        },
                        onSaved: (val) {
                          Global.contact = int.parse(val!);
                        },
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          hintText: "Enter Your Mobail No",
                          hintStyle: const TextStyle(
                            color: Colors.white,
                          ),
                          prefixText: "+91 ",
                          labelText: "Mobail Number",
                          labelStyle: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                  ],
                ),
                const SizedBox(height: 20),
                //Address
                Row(
                  children: [
                    const SizedBox(width: 10),
                    Expanded(
                      child: Icon(
                        Icons.location_pin,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      flex: 8,
                      child: TextFormField(
                        maxLines: 3,
                        textAlign: TextAlign.start,
                        initialValue: Global.address,
                        cursorColor: Colors.white,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Please Enter Your Address";
                          } else {
                            return null;
                          }
                        },
                        onSaved: (val) {
                          Global.address = val;
                        },
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          hintText: "Enter Your Address",
                          hintStyle: const TextStyle(
                            color: Colors.white,
                          ),
                          labelText: "Address",
                          labelStyle: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                  ],
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
