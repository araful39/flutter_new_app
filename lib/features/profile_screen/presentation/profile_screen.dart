import 'package:flutter/material.dart';
import 'package:flutter_application/features/authentication/presentation/log_in_screen.dart';
import 'package:flutter_application/features/product_details/presentation/save_product_screen.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_application/features/profile_screen/model/get_profile_response.dart';
import 'package:flutter_application/helpers/data_base_helper.dart';
import 'package:flutter_application/networks/api_acess.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int productCount = 0;
  final dbHelper = DatabaseHelper();

  @override
  void initState() {
    super.initState();
    getProfileRX.getProfile();
    loadProductCount();
  }

  Future<void> loadProductCount() async {
    int count = await dbHelper.getProductCount();
    setState(() {
      productCount = count;
    });
  }

  Future<void> _logout() async {
    await dbHelper.clearAll();
    EasyLoading.showSuccess("Logged out successfully");
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (_) => const LoginScreen()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white, size: 24),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text(
          'Profile',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.deepPurple,
      ),
      body: StreamBuilder<GetProfileResponse>(
        stream: getProfileRX.dataFetcher,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data == null) {
            return const Center(child: Text('No profile data found'));
          }

          final profile = snapshot.data!;

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.deepPurple.shade100,
                      backgroundImage: profile.avatar != null
                          ? NetworkImage(profile.avatar!)
                          : null,
                      child: profile.avatar == null
                          ? Text(
                              profile.name != null && profile.name!.isNotEmpty
                                  ? profile.name![0].toUpperCase()
                                  : '?',
                              style: const TextStyle(
                                fontSize: 40,
                                color: Colors.white,
                              ),
                            )
                          : null,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      profile.name ?? 'No Name',
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      profile.email ?? 'No Email',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey.shade700,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Chip(
                      label: Text(profile.role ?? 'No Role'),
                      backgroundColor: Colors.deepPurple.shade50,
                    ),
                    const SizedBox(height: 20),
                    _buildInfoRow('User ID', profile.id?.toString() ?? '-'),
                    _buildInfoRow('Created At', profile.creationAt ?? '-'),
                    _buildInfoRow('Updated At', profile.updatedAt ?? '-'),
                    const SizedBox(height: 12),
                    GestureDetector(
                      child: _buildInfoRow('See Saved Job', productCount.toString()),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SavedProductsScreen(),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton.icon(
                      onPressed: _logout,
                      icon: const Icon(Icons.logout, color: Colors.white),
                      label: const Text(
                        "Logout",
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple,
                        minimumSize: const Size(double.infinity, 48),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildInfoRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(flex: 3, child: Text(value)),
        ],
      ),
    );
  }
}
