import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:testapp/cubit/auth_cubit.dart';
import 'package:testapp/cubit/auth_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    User? user = _auth.currentUser; // Fetch the currently logged-in user
    if (user == null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
          backgroundColor: const Color(0xFFf1b202),
        ),
        body: const Center(
          child: Text('No user is logged in. Please log in.'),
        ),
      );
    }
    String name = user.displayName ?? 'No Name';
    String email = user.email ?? 'No Email';
    String userid = user.uid;
    String? profile = user.photoURL ?? "No Profile Picture";

    // User data

    return Scaffold(
      backgroundColor: const Color(0xfff9faff),
      appBar: AppBar(
          elevation: 1,
          centerTitle: true,
          title: Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(profile),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontSize: 15.sp,
                        ),
                  ),
                  Text(
                    email,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontSize: 13.sp,
                        ),
                  )
                ],
              )
            ],
          )),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ListTile(
              leading: const Text("Name"),
              title: Text(
                name,
                style: const TextStyle(color: Colors.black),
              ),
            ),
            ListTile(
              leading: const Text("UserId"),
              title: Text(
                userid,
                style: const TextStyle(color: Colors.black),
              ),
            ),
            ListTile(
              leading: const Text("Email"),
              title: Text(
                email,
                style: const TextStyle(color: Colors.black),
              ),
            ),
            BlocBuilder<AuthCubit, AuthState>(
              builder: (context, state) {
                bool isloading = false;
                if (state is AuthLoading) {
                  isloading == true;
                } else if (state is AuthLogout) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    Navigator.pushReplacementNamed(context, '/login');
                  });

                  isloading == false;
                }
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        context.read<AuthCubit>().logout();
                      },
                      icon: const Icon(Icons.logout),
                      label: isloading == false
                          ? const Text('Logout')
                          : const CircularProgressIndicator(
                              color: Colors.white,
                            ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
