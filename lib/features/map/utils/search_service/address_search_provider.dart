import 'dart:async';
import 'package:flutter/material.dart';
import 'package:inforcom/features/map/utils/search_service/address_search_service.dart';
import 'package:yandex_maps_mapkit/mapkit.dart';
import 'package:yandex_maps_mapkit/search.dart';

class AddressSearchProvider with ChangeNotifier {
  final AddressSearchService _searchService;
  final TextEditingController searchController;
  final FocusNode searchFocusNode;

  List<SuggestItem> _suggestions = [];
  bool _isLoading = false;
  String? _error;

  AddressSearchProvider()
    : _searchService = AddressSearchService(),
      searchController = TextEditingController(),
      searchFocusNode = FocusNode();

  List<SuggestItem> get suggestions => _suggestions;
  bool get isLoading => _isLoading;
  String? get error => _error;

  /// Поиск подсказок
  Future<void> searchSuggestions({
    required String query,
    required BoundingBox boundingBox,
  }) async {
    if (query.isEmpty) {
      _suggestions = [];
      _isLoading = false;
      _error = null;
      notifyListeners();
      return;
    }

    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final results = await _searchService.getSuggestions(
        query: query,
        boundingBox: boundingBox,
      );

      _suggestions = results;
      _isLoading = false;
    } catch (e) {
      _suggestions = [];
      _isLoading = false;
      _error = 'Ошибка при поиске';
    }

    notifyListeners();
  }

  /// Выбор подсказки
  Future<Point?> selectSuggestion(
    SuggestItem item, {
    required BoundingBox boundingBox,
  }) async {
    searchController.text = item.title.text;
    searchFocusNode.unfocus();
    _suggestions = [];
    notifyListeners();

    return await _searchService.searchAddress(
      query: item.title.text,
      boundingBox: boundingBox,
    );
  }

  /// Очистка поиска
  void clearSearch() {
    searchController.clear();
    _suggestions = [];
    _isLoading = false;
    _error = null;
    notifyListeners();
  }

  @override
  void dispose() {
    _searchService.dispose();
    searchController.dispose();
    searchFocusNode.dispose();
    super.dispose();
  }
}
