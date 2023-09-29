import 'package:flutter/material.dart';

import '../settings/settings_view.dart';

class ExpenditureView extends StatefulWidget {
  const ExpenditureView({super.key});

  static const routeName = '/expenditure';

  @override
  ExpenditureViewState createState() => ExpenditureViewState();
}

class ExpenditureViewState extends State<ExpenditureView> {
  final _formKey = GlobalKey<FormState>();
  final _dateController = TextEditingController();
  final _nominalController = TextEditingController();
  final _infoController = TextEditingController();

  @override
  void dispose() {
    _dateController.dispose();
    _nominalController.dispose();
    _infoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Cash Book'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.restorablePushNamed(context, SettingsView.routeName);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 16.0),
              child: Text(
                'Add Expenditure',
                style: TextStyle(fontSize: 16.0, color: Colors.red),
                textAlign: TextAlign.left,
              ),
            ),
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Date',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  TextFormField(
                    controller: _dateController,
                    decoration: const InputDecoration(
                      hintText: 'Enter date',
                      suffixIcon: Icon(Icons.calendar_month_outlined),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a date';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16.0),
                  const Text(
                    'Nominal',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  TextFormField(
                    controller: _nominalController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      hintText: 'Enter nominal',
                      prefixText: 'Rp. ',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a nominal';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16.0),
                  const Text(
                    'Information',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  TextFormField(
                    controller: _infoController,
                    decoration: const InputDecoration(
                      hintText: 'Enter information',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter information';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 32),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        _formKey.currentState!.reset();
                        _dateController.clear();
                        _nominalController.clear();
                        _infoController.clear();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                      ),
                      child: const Text('Reset'),
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // TODO: Save expenditure data
                          Navigator.pop(context);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                      ),
                      child: const Text('Save'),
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_left),
                      label: const Text('Back'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
