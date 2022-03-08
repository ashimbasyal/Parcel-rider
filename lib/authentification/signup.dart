import 'dart:io';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:parcel_rider/widgets/custom.dart';
import 'package:parcel_rider/widgets/dialog.dart';

class SignupScreen extends StatefulWidget {


  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController locationController = TextEditingController();

  File imageFile;
  final picker = ImagePicker();

  chooseImage(ImageSource source) async {
    final PickedFile = await picker.getImage(source: source);
    setState(() {
      imageFile = File(PickedFile.path);
    });
  }

  XFile imageXFile;
  final ImagePicker _picker = ImagePicker();

  Position position;
  List<Placemark> placemark;

  Future<void> _getImage() async {
    imageXFile = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      imageXFile;
    });
  }

  getCurrentLocation() async {
    Position newPosition = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    position = newPosition;
    placemark =
        await placemarkFromCoordinates(position.latitude, position.longitude);

    //yo chai 0 index ko lagi

    Placemark pMark = placemark[0];

//yo chai exact kata parxa vanera ho

    String completeAddress =
        '${pMark.subThoroughfare} ${pMark.thoroughfare}, ${pMark.subLocality} ${pMark.locality}, ${pMark.subAdministrativeArea}, ${pMark.administrativeArea} ${pMark.postalCode}, ${pMark.country}';
    locationController.text = completeAddress;
  }

  Future<void> formValidation() async {
    if (imageXFile == null) {
      showDialog(
        context: context,
        builder: (c) {
          return ErrorDialog(
            message: "please select an image",
          );
        },
      );
    }
    else
    {
      if(passwordController.text == confirmPasswordController.text)
      {
        //start uploading
    if (confirmPasswordController.text.isNotEmpty && emailController.text.isNotEmpty  && nameController.text.isNotEmpty  && phoneController.text.isNotEmpty  && locationController.text.isNotEmpty)
    {

    }

    else
    {
            showDialog(
        context: context,
        builder: (c) {
          return ErrorDialog(
            message: "please provide all information",
          );
        },
      );
    }

      }

      else
      {
              showDialog(
        context: context,
        builder: (c) {
          return ErrorDialog(
            message: "password milena",
          );
        },
      );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          const SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {
              _getImage();
            },
            child: CircleAvatar(
              radius: MediaQuery.of(context).size.width * 0.20,
              backgroundColor: Colors.white,
              backgroundImage:
                  imageXFile == null ? null : FileImage(File(imageXFile.path)),
              child: imageXFile == null
                  ? Icon(
                      Icons.add_photo_alternate,
                      size: MediaQuery.of(context).size.width * 0.20,
                      color: Colors.grey,
                    )
                  : null,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Form(
            key: _formkey,
            child: Column(
              children: [
                CustomTextfield(
                  data: Icons.person,
                  controller: nameController,
                  hintText: "Enter Your Name",
                  isObsecre: false,
                ),
                CustomTextfield(
                  data: Icons.email,
                  controller: emailController,
                  hintText: "Enter Your Email",
                  isObsecre: false,
                ),
                CustomTextfield(
                  data: Icons.lock,
                  controller: passwordController,
                  hintText: "Enter Your Password",
                  isObsecre: true,
                ),
                CustomTextfield(
                  data: Icons.lock,
                  controller: confirmPasswordController,
                  hintText: "Confirm Password",
                  isObsecre: true,
                ),
                CustomTextfield(
                  data: Icons.phone,
                  controller: phoneController,
                  hintText: " Phone",
                  isObsecre: false,
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(
                          child: imageFile != null
                              ? Container(
                                  height: 300,
                                  width: 300,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: FileImage(imageFile))),
                                )
                              : Container(
                                  height: 300,
                                  width: 300,
                                  decoration:
                                      BoxDecoration(color: Colors.white),
                                )),
                      Container(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: FlatButton(
                                  onPressed: () {
                                    chooseImage(ImageSource.camera);
                                  },
                                  color: Colors.red,
                                  child: const Text(
                                    'Camera',
                                    style: TextStyle(color: Colors.white),
                                  )),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: FlatButton(
                                  onPressed: () {
                                    chooseImage(ImageSource.gallery);
                                  },
                                  color: Colors.red,
                                  child: const Text(
                                    'Gallery',
                                    style: TextStyle(color: Colors.white),
                                  )),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                CustomTextfield(
                  data: Icons.confirmation_number,
                  controller: numberController,
                  hintText: " Licence No",
                  isObsecre: false,
                ),
                CustomTextfield(
                  data: Icons.my_location,
                  controller: locationController,
                  hintText: "Home Address",
                  isObsecre: false,
                  enabled: false,
                ),
                Container(
                  width: 400,
                  height: 40,
                  alignment: Alignment.center,
                  child: ElevatedButton.icon(
                    label: const Text(
                      "Get My Current Location",
                      style: TextStyle(color: Colors.white),
                    ),
                    icon: const Icon(
                      Icons.location_on,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      getCurrentLocation();
                    },
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    )),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
            onPressed: () {
              formValidation();
            },
            child: const Text(
              'Sign Up',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            style: ElevatedButton.styleFrom(
                primary: Colors.green,
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 10)),
          ),
          const SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }
}
