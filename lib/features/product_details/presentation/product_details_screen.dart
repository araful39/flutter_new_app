// import 'package:flutter/material.dart';
// import 'package:flutter_application/features/home/model/product_list_response.dart';
// import 'package:flutter_application/helpers/data_base_helper.dart';

// class ProductDetailsScreen extends StatefulWidget {
//   final Products product;

//   const ProductDetailsScreen({super.key, required this.product});

//   @override
//   State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
// }

// class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
//   final dbHelper = DatabaseHelper();
//   bool isAdded = false;

//   @override
//   void initState() {
//     super.initState();
//     checkProductInDB();
//   }

//   // Check if product already exists in DB
//   Future<void> checkProductInDB() async {
//     final products = await dbHelper.getProducts();
//     bool exists = products.any(
//       (p) =>
//           p['title'] == widget.product.title &&
//           p['brand'] == widget.product.brand,
//     );
//     setState(() {
//       isAdded = exists;
//     });
//   }

//   // Add product
//   Future<void> addProduct() async {
//     await dbHelper.insertProduct({
//       'title': widget.product.title ?? '',
//       'brand': widget.product.brand ?? '',
//       'price': widget.product.price ?? 0,
//       'description': widget.product.description ?? '',
//       'category': widget.product.category ?? '',
//     });
//     setState(() {
//       isAdded = true;
//     });
//     ScaffoldMessenger.of(
//       context,
//     ).showSnackBar(const SnackBar(content: Text('Product added to database')));
//   }

//   // Delete product
//   Future<void> deleteProduct() async {
//     final products = await dbHelper.getProducts();
//     final existingProduct = products.firstWhere(
//       (p) =>
//           p['title'] == widget.product.title &&
//           p['brand'] == widget.product.brand,
//       orElse: () => {},
//     );
//     if (existingProduct.isNotEmpty) {
//       await dbHelper.deleteProduct(existingProduct['id']);
//       setState(() {
//         isAdded = false;
//       });
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Product removed from database')),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey.shade100,
//       appBar: AppBar(
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.white),
//           onPressed: () => Navigator.of(context).pop(),
//         ),
//         title: Text(
//           widget.product.title ?? "Product Details",
//           style: const TextStyle(color: Colors.white),
//         ),
//         backgroundColor: Colors.deepPurple,
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Image Carousel
//             if (widget.product.images != null &&
//                 widget.product.images!.isNotEmpty)
//               SizedBox(
//                 height: 250,
//                 child: PageView.builder(
//                   itemCount: widget.product.images!.length,
//                   itemBuilder: (context, index) {
//                     return ClipRRect(
//                       borderRadius: BorderRadius.circular(12),
//                       child: Image.network(
//                         widget.product.images![index],
//                         fit: BoxFit.cover,
//                         errorBuilder:
//                             (context, error, stackTrace) => Container(
//                               color: Colors.grey.shade300,
//                               child: const Icon(Icons.broken_image, size: 60),
//                             ),
//                       ),
//                     );
//                   },
//                 ),
//               )
//             else
//               Container(
//                 height: 250,
//                 decoration: BoxDecoration(
//                   color: Colors.grey.shade300,
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 child: const Center(
//                   child: Icon(Icons.image_not_supported, size: 60),
//                 ),
//               ),
//             const SizedBox(height: 16),

//             // Title & Brand
//             Text(
//               widget.product.title ?? "No Title",
//               style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 4),
//             Text(
//               widget.product.brand ?? "Unknown Brand",
//               style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
//             ),

//             const SizedBox(height: 12),

//             // Price & Rating
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   "\$${(widget.product.price ?? 0).toStringAsFixed(2)}",
//                   style: const TextStyle(
//                     fontSize: 20,
//                     color: Colors.deepPurple,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 Row(
//                   children: [
//                     const Icon(Icons.star, color: Colors.amber, size: 22),
//                     const SizedBox(width: 4),
//                     Text(
//                       "${widget.product.rating ?? 0}",
//                       style: const TextStyle(fontSize: 16),
//                     ),
//                   ],
//                 ),
//               ],
//             ),

//             const SizedBox(height: 16),

//             // Description
//             const Text(
//               "Description",
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
//             ),
//             const SizedBox(height: 8),
//             Text(
//               widget.product.description ?? "No description available.",
//               style: const TextStyle(fontSize: 15, height: 1.4),
//             ),

//             const SizedBox(height: 20),

//             // Additional Info
//             _buildInfoRow("Category", widget.product.category),
//             _buildInfoRow("Stock", widget.product.stock?.toString()),
//             _buildInfoRow("Warranty", widget.product.warrantyInformation),
//             _buildInfoRow("Shipping Info", widget.product.shippingInformation),
//             _buildInfoRow("Return Policy", widget.product.returnPolicy),

//             const SizedBox(height: 20),

//             // Reviews
//             if (widget.product.reviews != null &&
//                 widget.product.reviews!.isNotEmpty) ...[
//               const Text(
//                 "Customer Reviews",
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
//               ),
//               const SizedBox(height: 10),
//               ...widget.product.reviews!.map((review) {
//                 return Card(
//                   elevation: 2,
//                   margin: const EdgeInsets.symmetric(vertical: 6),
//                   child: ListTile(
//                     leading: const Icon(Icons.person, color: Colors.deepPurple),
//                     title: Text(review.reviewerName ?? "Anonymous"),
//                     subtitle: Text(review.comment ?? "No comment"),
//                     trailing: Row(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         const Icon(Icons.star, color: Colors.amber, size: 18),
//                         Text("${review.rating ?? 0}"),
//                       ],
//                     ),
//                   ),
//                 );
//               }),
//             ] else
//               const Text(
//                 "No reviews available.",
//                 style: TextStyle(fontSize: 14, color: Colors.grey),
//               ),
//           ],
//         ),
//       ),
//       floatingActionButton: ElevatedButton(
//         onPressed: () {
//           if (isAdded) {
//             deleteProduct();
//           } else {
//             addProduct();
//           }
//         },
//         style: ElevatedButton.styleFrom(
//           backgroundColor: isAdded ? Colors.red : Colors.green,
//           padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(30),
//           ),
//         ),

//         child: Text(
//           isAdded ? "Job Cancel" : "Job Apply",
//           style: TextStyle(color: Colors.white),
//         ),
//         // child: Icon(isAdded ? Icons.delete : Icons.add, color: Colors.white),
//       ),
//     );
//   }

//   Widget _buildInfoRow(String title, String? value) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 4),
//       child: Row(
//         children: [
//           Text("$title: ", style: const TextStyle(fontWeight: FontWeight.w600)),
//           Expanded(child: Text(value ?? "N/A")),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_application/features/home/model/product_list_response.dart';
import 'package:flutter_application/helpers/data_base_helper.dart';

class ProductDetailsScreen extends StatefulWidget {
  final Products product;

  const ProductDetailsScreen({super.key, required this.product});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  final dbHelper = DatabaseHelper();
  bool isAdded = false;

  @override
  void initState() {
    super.initState();
    checkProductInDB();
  }

  Future<void> checkProductInDB() async {
    final products = await dbHelper.getProducts();
    bool exists = products.any(
      (p) =>
          p['title'] == widget.product.title &&
          p['brand'] == widget.product.brand,
    );
    setState(() {
      isAdded = exists;
    });
  }

  Future<void> addProduct() async {
    await dbHelper.insertProduct({
      'title': widget.product.title ?? '',
      'brand': widget.product.brand ?? '',
      'price': widget.product.price ?? 0,
      'description': widget.product.description ?? '',
      'category': widget.product.category ?? '',
    });
    setState(() {
      isAdded = true;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Product added to database')),
    );
  }

  Future<void> deleteProduct() async {
    final products = await dbHelper.getProducts();
    final existingProduct = products.firstWhere(
      (p) =>
          p['title'] == widget.product.title &&
          p['brand'] == widget.product.brand,
      orElse: () => {},
    );
    if (existingProduct.isNotEmpty) {
      await dbHelper.deleteProduct(existingProduct['id']);
      setState(() {
        isAdded = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Product removed from database')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          widget.product.title ?? "Product Details",
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (widget.product.images != null &&
                widget.product.images!.isNotEmpty)
              SizedBox(
                height: 250,
                child: PageView.builder(
                  itemCount: widget.product.images!.length,
                  itemBuilder: (context, index) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        widget.product.images![index],
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                            Container(
                          color: Colors.grey.shade300,
                          child: const Icon(Icons.broken_image, size: 60),
                        ),
                      ),
                    );
                  },
                ),
              )
            else
              Container(
                height: 250,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Center(
                  child: Icon(Icons.image_not_supported, size: 60),
                ),
              ),
            const SizedBox(height: 16),
            Text(
              widget.product.title ?? "No Title",
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              widget.product.brand ?? "Unknown Brand",
              style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "\$${(widget.product.price ?? 0).toStringAsFixed(2)}",
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.amber, size: 22),
                    const SizedBox(width: 4),
                    Text(
                      "${widget.product.rating ?? 0}",
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              "Description",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            Text(
              widget.product.description ?? "No description available.",
              style: const TextStyle(fontSize: 15, height: 1.4),
            ),
            const SizedBox(height: 20),
            _buildInfoRow("Category", widget.product.category),
            _buildInfoRow("Stock", widget.product.stock?.toString()),
            _buildInfoRow("Warranty", widget.product.warrantyInformation),
            _buildInfoRow("Shipping Info", widget.product.shippingInformation),
            _buildInfoRow("Return Policy", widget.product.returnPolicy),
            const SizedBox(height: 20),
            if (widget.product.reviews != null &&
                widget.product.reviews!.isNotEmpty) ...[
              const Text(
                "Customer Reviews",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 10),
              ...widget.product.reviews!.map((review) {
                return Card(
                  elevation: 2,
                  margin: const EdgeInsets.symmetric(vertical: 6),
                  child: ListTile(
                    leading: const Icon(Icons.person, color: Colors.deepPurple),
                    title: Text(review.reviewerName ?? "Anonymous"),
                    subtitle: Text(review.comment ?? "No comment"),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.star, color: Colors.amber, size: 18),
                        Text("${review.rating ?? 0}"),
                      ],
                    ),
                  ),
                );
              }),
            ] else
              const Text(
                "No reviews available.",
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
          ],
        ),
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () {
          if (isAdded) {
            deleteProduct();
          } else {
            addProduct();
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: isAdded ? Colors.red : Colors.green,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Text(
          isAdded ? "Job Cancel" : "Job Apply",
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildInfoRow(String title, String? value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Text("$title: ", style: const TextStyle(fontWeight: FontWeight.w600)),
          Expanded(child: Text(value ?? "N/A")),
        ],
      ),
    );
  }
}
