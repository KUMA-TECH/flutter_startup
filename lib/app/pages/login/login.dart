import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
  //final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildForm(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Welcome back',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        TextFormField(
          decoration: const InputDecoration(
            hintText: 'Enter Email / Phone No',
          ),
          validator: (String? value) {
            if (value == null || value.isEmpty) {
              return 'Please enter some text';
            }
            return null;
          },
        ),
        TextFormField(
          decoration: const InputDecoration(
            hintText: 'Passcode',
          ),
          validator: (String? value) {
            if (value == null || value.isEmpty) {
              return 'Please enter some text';
            }
            return null;
          },
        ),
        Text(
          'Having trouble in login?',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: ElevatedButton(
            onPressed: () {},
            child: const Text('Login'),
          ),
        ),
        const Text('-- Or Login with --'),
        Row(
          children: const [
            Text('Google'),
            Text('Apple Id'),
            Text('Facebook'),
          ],
        ),
        const Text("Don't have an account? Sign in Now"),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const IconButton(
          icon: Icon(Icons.menu),
          tooltip: 'Navigation menu',
          onPressed: null,
        ),
        title: const Text('Start up'),
        actions: const [
          IconButton(
            icon: Icon(Icons.search),
            tooltip: 'Search',
            onPressed: null,
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/bg_login_form.avif"),
            fit: BoxFit.cover,
          ),
        ),
        child: _buildForm(context),
      ),
      floatingActionButton: const FloatingActionButton(
        tooltip: 'Add',
        onPressed: null,
        child: Icon(Icons.add),
      ),
    );
  }
}
