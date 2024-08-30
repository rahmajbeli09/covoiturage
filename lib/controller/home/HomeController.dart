import 'package:covo/data/model/covModel.dart';
import 'package:covo/core/services/repository/covRepository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/model/usermodel.dart';
import '../../core/services/repository/userRepository.dart';

class HomeController extends GetxController {
  var showSearchField = false.obs;
  var searchResults = <UserModel>[].obs;
  var allTrajets = <CovModel>[].obs;
  var filteredTrajets = <CovModel>[].obs;
  var isFiltered = false.obs;
  var showDepartFilter = false.obs;
  final searchController = TextEditingController();
  final departFilterController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    _fetchAllTrajets();
  }

  void toggleSearchField() {
    showSearchField.value = !showSearchField.value;
  }

  void searchUsers(String query) async {
    if (query.isNotEmpty) {
      searchResults.value = await UserRepository.instance.searchUsersByName(query);
    } else {
      searchResults.clear();
    }
  }

  Future<void> _fetchAllTrajets() async {
    try {
      List<CovModel> trajets = await CovRepository().getAllTrajets();
      print('Trajets récupérés: $trajets');
      allTrajets.value = trajets;
      _applyFilter();
    } catch (e) {
      print('Erreur lors de la récupération des trajets: $e');
    }
  }

  Future<void> refreshTrajets() async {
    await _fetchAllTrajets();
  }

  void toggleFilter() {
    isFiltered.value = !isFiltered.value;
    _applyFilter();
  }

  void applyFilterOption(String value) {
    if (value == 'prix') {
      filteredTrajets.value = List.from(allTrajets)..sort((a, b) => a.prix.compareTo(b.prix));
      showDepartFilter.value = false;
    } else if (value == 'depart') {
      showDepartFilter.value = true;
    }
  }

  void applyDepartFilter(String depart) {
    if (depart.isNotEmpty) {
      filteredTrajets.value = allTrajets.where((trajet) => trajet.depart.toLowerCase().contains(depart.toLowerCase())).toList();
    } else {
      _applyFilter();
    }
  }

  void _applyFilter() {
    if (isFiltered.value) {
      filteredTrajets.value = allTrajets.where((trajet) => trajet.dispo).toList();
    } else {
      filteredTrajets.value = allTrajets;
    }
  }
}
