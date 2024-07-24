import 'package:flutter/Material.dart';
import 'package:sycamore_project/components/patients_search_list_view.dart';

import '../core/helper_methods.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onTap: () {
        navigateTo(page: PatientsSearchListView(),withHistory: true);
      },
      decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          labelStyle: const TextStyle(color: Colors.black),
          hintText: 'search here ...',
          prefixIcon: IconButton(
            icon: const Icon(Icons.search, color: Colors.black, size: 25),
            onPressed: () {
              // Perform the search here
            },
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.all(
              Radius.circular(25),
            ),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.all(
              Radius.circular(25),
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.all(
              Radius.circular(25),
            ),
          ),
          prefixIconColor: Colors.black),
    );
  }
}