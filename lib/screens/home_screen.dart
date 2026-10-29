import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../models/contact_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<ContactModel> contacts = [];

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff29384D),
      appBar: AppBar(
        backgroundColor: const Color(0xff29384D),
        elevation: 0,
        centerTitle: true,
        title: Image.asset(
          'assets/images/route_logo.png',
          height: 50,
        ),
      ),
      body: contacts.isEmpty
          ? Column(
        children: [
          Expanded(
            child: Lottie.asset(
              'assets/animations/empty_list.json',
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 24),
            child: Text(
              'There is No Contacts Added Here',
              style: TextStyle(
                color: Color(0xffFFF1D4),
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      )
          : GridView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: contacts.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 0.7,
        ),
        itemBuilder: (context, index) {
          return Card(
            color: const Color(0xffFFF1D4),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    radius: 35,
                    backgroundColor: Color(0xff29384D),
                    child: Icon(
                      Icons.person,
                      size: 35,
                      color: Color(0xffFFF1D4),
                    ),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    contacts[index].name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 6),

                  Text(
                    contacts[index].email,
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 6),

                  Text(
                    contacts[index].phone,
                    textAlign: TextAlign.center,
                  ),

                  const Spacer(),

                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        contacts.removeAt(index);
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    child: const Text(
                      'Delete',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [

          if (contacts.isNotEmpty)
            FloatingActionButton(
              heroTag: 'delete',
              backgroundColor: Colors.red,
              onPressed: () {
                setState(() {
                  contacts.removeLast();
                });
              },
              child: const Icon(
                Icons.delete,
                color: Colors.white,
              ),
            ),

          const SizedBox(width: 10),

          if (contacts.length < 6)
            FloatingActionButton(
              heroTag: 'add',
              backgroundColor: const Color(0xffFFF1D4),
              child: const Icon(
                Icons.add,
                color: Color(0xff29384D),
              ),
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (context) {
                    return Padding(
                      padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom,
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: const BoxDecoration(
                          color: Color(0xff29384D),
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(20),
                          ),
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                width: double.infinity,
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: const Color(0xffFFF1D4),
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      nameController.text.isEmpty
                                          ? 'User Name'
                                          : nameController.text,
                                      style: const TextStyle(
                                        color: Color(0xffFFF1D4),
                                      ),
                                    ),

                                    const SizedBox(height: 8),

                                    Text(
                                      emailController.text.isEmpty
                                          ? 'User Email'
                                          : emailController.text,
                                      style: const TextStyle(
                                        color: Color(0xffFFF1D4),
                                      ),
                                    ),

                                    const SizedBox(height: 8),

                                    Text(
                                      phoneController.text.isEmpty
                                          ? 'User Phone'
                                          : phoneController.text,
                                      style: const TextStyle(
                                        color: Color(0xffFFF1D4),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              const SizedBox(height: 20),
                              TextField(
                                controller: nameController,
                                onChanged: (value) {
                                  setState(() {});
                                },
                                decoration: InputDecoration(
                                  hintText: 'User Name',
                                  filled: true,
                                  fillColor: const Color(0xffFFF1D4),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                              ),

                              const SizedBox(height: 16),

                              TextField(
                                controller: emailController,
                                onChanged: (value) {
                                  setState(() {});
                                },
                                decoration: InputDecoration(
                                  hintText: 'User Email',
                                  filled: true,
                                  fillColor: const Color(0xffFFF1D4),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                              ),

                              const SizedBox(height: 16),
                              TextField(
                                controller: phoneController,
                                onChanged: (value) {
                                  setState(() {});
                                },
                                decoration: InputDecoration(
                                  hintText: 'User Phone',
                                  filled: true,
                                  fillColor: const Color(0xffFFF1D4),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),

                              SizedBox(
                                width: double.infinity,
                                height: 55,
                                child: ElevatedButton(
                                  onPressed: () {
                                    if (nameController.text.isEmpty ||
                                        emailController.text.isEmpty ||
                                        phoneController.text.isEmpty) {
                                      return;
                                    }

                                    contacts.add(
                                      ContactModel(
                                        name: nameController.text,
                                        email: emailController.text,
                                        phone: phoneController.text,
                                        imagePath: '',
                                      ),
                                    );

                                    Navigator.pop(context);

                                    nameController.clear();
                                    emailController.clear();
                                    phoneController.clear();

                                    setState(() {});
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xffFFF1D4),
                                  ),
                                  child: const Text(
                                    'Enter User',
                                    style: TextStyle(
                                      color: Color(0xff29384D),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),

                              const SizedBox(height: 20),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
        ],
      ),
    );
  }
}