import 'package:flutter/material.dart';
import 'product.dart';

class ProductSearchBar extends StatefulWidget {
  final List<Product> products;
  final Function(List<Product>) onSearchResults;

  const ProductSearchBar({
    super.key,
    required this.products,
    required this.onSearchResults,
  });

  @override
  // ignore: library_private_types_in_public_api
  _ProductSearchBarState createState() => _ProductSearchBarState();
}

class _ProductSearchBarState extends State<ProductSearchBar> {
  final TextEditingController _searchController = TextEditingController();

  void _filterProducts(String query) {
    final results = widget.products.where((product) {
      return product.name.toLowerCase().contains(query.toLowerCase());
    }).toList();

    widget.onSearchResults(results);
  }

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      _filterProducts(_searchController.text);
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _searchController,
      decoration: InputDecoration(
        hintText: 'Uyni qidiring...',
        prefixIcon: const Icon(Icons.search, color: Colors.grey),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        filled: true,

        contentPadding: const EdgeInsets.symmetric(vertical: 10),
      ),
    );
  }
}
