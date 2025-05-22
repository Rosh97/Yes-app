import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../core/widgets/animated_gradient_background.dart';

class UserInfoScreen extends StatefulWidget {
  const UserInfoScreen({super.key});

  @override
  State<UserInfoScreen> createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends State<UserInfoScreen> {
  final _formKey = GlobalKey<FormState>();

  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _phoneController = TextEditingController(text: '+1 ');
  final _emergencyNameController = TextEditingController();
  final _emergencyPhoneController = TextEditingController(text: '+1 ');
  final _addressController = TextEditingController();

  String? _gender;
  DateTime? _dob;

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _phoneController.dispose();
    _emergencyNameController.dispose();
    _emergencyPhoneController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() => _dob = picked);
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
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      'Tell us about yourself',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 24),
                    TextFormField(
                      controller: _firstNameController,
                      decoration: const InputDecoration(labelText: 'First Name', filled: true, fillColor: Colors.white),
                      validator: (value) => value == null || value.isEmpty ? 'Required' : null,
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: _lastNameController,
                      decoration: const InputDecoration(labelText: 'Last Name', filled: true, fillColor: Colors.white),
                      validator: (value) => value == null || value.isEmpty ? 'Required' : null,
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: _phoneController,
                      decoration: const InputDecoration(labelText: 'Phone Number', filled: true, fillColor: Colors.white),
                      keyboardType: TextInputType.phone,
                      inputFormatters: [
                        TextInputFormatter.withFunction((oldValue, newValue) {
                          if (!newValue.text.startsWith('+1 ')) {
                            return oldValue;
                          }
                          return newValue;
                        }),
                      ],
                      validator: (value) => value == null || value.isEmpty ? 'Required' : null,
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: _emergencyNameController,
                      decoration: const InputDecoration(labelText: 'Emergency Contact Name', filled: true, fillColor: Colors.white),
                      validator: (value) => value == null || value.isEmpty ? 'Required' : null,
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: _emergencyPhoneController,
                      decoration: const InputDecoration(labelText: 'Emergency Contact Phone', filled: true, fillColor: Colors.white),
                      keyboardType: TextInputType.phone,
                      inputFormatters: [
                        TextInputFormatter.withFunction((oldValue, newValue) {
                          if (!newValue.text.startsWith('+1 ')) {
                            return oldValue;
                          }
                          return newValue;
                        }),
                      ],
                      validator: (value) => value == null || value.isEmpty ? 'Required' : null,
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: _addressController,
                      decoration: const InputDecoration(
                        labelText: 'Address',
                        filled: true,
                        fillColor: Colors.white,
                        suffixIcon: Icon(Icons.location_on_outlined),
                      ),
                      onTap: () {
                        // Optional: future hook for autocomplete dropdown
                        // For now: no Snackbar
                      },
                      validator: (value) => value == null || value.isEmpty ? 'Required' : null,
                    ),
                    const SizedBox(height: 12),
                    DropdownButtonFormField<String>(
                      value: _gender,
                      items: const [
                        DropdownMenuItem(value: 'Male', child: Text('Male')),
                        DropdownMenuItem(value: 'Female', child: Text('Female')),
                        DropdownMenuItem(value: 'Other', child: Text('Other')),
                      ],
                      decoration: const InputDecoration(labelText: 'Gender', filled: true, fillColor: Colors.white),
                      onChanged: (value) => setState(() => _gender = value),
                      validator: (value) => value == null ? 'Required' : null,
                    ),
                    const SizedBox(height: 12),
                    GestureDetector(
                      onTap: _pickDate,
                      child: AbsorbPointer(
                        child: TextFormField(
                          decoration: InputDecoration(
                            labelText: _dob == null ? 'Date of Birth' : 'DOB: ${_dob!.toLocal().toString().split(' ')[0]}',
                            filled: true,
                            fillColor: Colors.white,
                          ),
                          validator: (_) => _dob == null ? 'Required' : null,
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.pushNamed(context, '/signup-id');
                        }
                      },
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
      ),
    );
  }
}
