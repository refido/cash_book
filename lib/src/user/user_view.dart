import 'package:flutter/material.dart';

class UserView extends StatefulWidget {
  const UserView({super.key});

  static const routeName = '/user';

  @override
  UserViewState createState() => UserViewState();
}

class UserViewState extends State<UserView> {
  final String _name = 'Refido Berliano'; // replace with actual username
  final String _nim = 'johndoe@example.com'; // replace with actual email
  final String _date = '25 September 2023'; // replace with actual date
  final String _imageUrl =
      'https://via.placeholder.com/150'; // replace with actual image URL
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Change Password',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: 'Current Password',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your current password';
                        }
                        // validate current password here
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {});
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: 'New Password',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter a new password';
                        }
                        // validate new password here
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {});
                      },
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            // submit password change request here
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Save')),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Colors.green, // set the background color to green
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
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                CircleAvatar(
                  radius: 75,
                  backgroundImage: NetworkImage(_imageUrl),
                ),
                const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'About This App...',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const Text('This app is built by:'),
                    Text(
                      _name,
                    ),
                    Text(
                      _nim,
                    ),
                    Text(
                      _date,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
