import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../core/widgets/animated_gradient_background.dart';

class IDVerificationScreen extends StatefulWidget {
  const IDVerificationScreen({Key? key}) : super(key: key);

  @override
  State<IDVerificationScreen> createState() => _IDVerificationScreenState();
}

class _IDVerificationScreenState extends State<IDVerificationScreen> {
  final ImagePicker _picker = ImagePicker();
  String? _selectedIdType;
  File? _frontImage;
  File? _backImage;

  Future<void> _pickImage(bool isFront) async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        if (isFront) {
          _frontImage = File(pickedFile.path);
        } else {
          _backImage = File(pickedFile.path);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedGradientBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'ID Verification',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Please verify your ID to keep the community safe.',
                    style: TextStyle(fontSize: 16, color: Colors.black87),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),
                  DropdownButtonFormField<String>(
                    value: _selectedIdType,
                    decoration: const InputDecoration(
                      labelText: 'Select ID Type',
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    items: const [
                      DropdownMenuItem(
                          value: 'Driver\'s License',
                          child: Text("Driver's License")),
                      DropdownMenuItem(
                          value: 'Passport', child: Text("Passport")),
                      DropdownMenuItem(
                          value: 'National ID', child: Text("National ID")),
                    ],
                    onChanged: (value) => setState(() => _selectedIdType = value),
                  ),
                  const SizedBox(height: 24),
                  const Text('Front of ID:', textAlign: TextAlign.center),
                  const SizedBox(height: 8),
                  _frontImage != null
                      ? Image.file(_frontImage!, height: 150)
                      : ElevatedButton(
                    onPressed: () => _pickImage(true),
                    child: const Text('Take Front Photo'),
                  ),
                  const SizedBox(height: 16),
                  const Text('Back of ID:', textAlign: TextAlign.center),
                  const SizedBox(height: 8),
                  _backImage != null
                      ? Image.file(_backImage!, height: 150)
                      : ElevatedButton(
                    onPressed: () => _pickImage(false),
                    child: const Text('Take Back Photo'),
                  ),
                  const SizedBox(height: 32),
                  ElevatedButton(
                    onPressed: _selectedIdType != null &&
                        _frontImage != null &&
                        _backImage != null
                        ? () => Navigator.pushNamed(context, '/thank-you')
                        : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text('Next'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}