import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:inforcom/core/resources/app_colors.dart';
import 'package:inforcom/core/resources/app_icons.dart';
import 'package:inforcom/core/resources/app_text_styles.dart';
import 'package:inforcom/core/widgets/text_form/app_text_form.dart';
import 'package:provider/provider.dart';
import 'package:yandex_maps_mapkit/search.dart';
import 'package:yandex_maps_mapkit/mapkit.dart' hide Icon, TextStyle;
import '../../utils/search_service/address_search_provider.dart';

class AddressSearchWidget extends StatelessWidget {
  final ValueChanged<Point>? onAddressSelected;

  AddressSearchWidget({super.key, this.onAddressSelected});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AddressSearchProvider(),
      child: Consumer<AddressSearchProvider>(
        builder: (context, provider, child) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildSearchField(context, provider),
              _buildSuggestionsList(context, provider),
            ],
          );
        },
      ),
    );
  }

  Widget _buildSearchField(
    BuildContext context,
    AddressSearchProvider provider,
  ) {
    return AppTextForm(
      labelText: 'Поиск адреса',
      showSearchIcon: true,
      controller: provider.searchController,
      focusNode: provider.searchFocusNode,
      onChanged: (value) => _onSearchChanged(context, provider, value),
    );
  }

  Widget _buildSuggestionsList(
    BuildContext context,
    AddressSearchProvider provider,
  ) {
    if (provider.isLoading) {
      return const Padding(
        padding: EdgeInsets.all(8.0),
        child: CircularProgressIndicator(),
      );
    }

    if (provider.suggestions.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 54),
          child: Column(
            children: [
              SvgPicture.asset(
                width: 54,
                AppIcons.search,
                colorFilter: ColorFilter.mode(
                  AppColors.accent2.withAlpha(180),
                  BlendMode.srcIn,
                ),
              ),
              Text(
                'Начните вводить адрес...',
                style: AppTextStyles.body1.copyWith(
                  color: AppColors.primaryText.withAlpha(180),
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(top: 16),
        decoration: BoxDecoration(color: AppColors.primary),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: 300),
          child: ListView.separated(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            itemCount: provider.suggestions.length,
            separatorBuilder: (context, index) =>
                const Divider(color: AppColors.lightGray),
            itemBuilder: (context, index) {
              final suggestion = provider.suggestions[index];
              return _buildSuggestionItem(context, provider, suggestion);
            },
          ),
        ),
      ),
    );
  }

  Widget _buildSuggestionItem(
    BuildContext context,
    AddressSearchProvider provider,
    SuggestItem suggestion,
  ) {
    final title = suggestion.title.text;
    final subtitle = suggestion.subtitle?.text;
    final distance = suggestion.distance?.value;

    return InkWell(
      onTap: () => _onSuggestionSelected(context, provider, suggestion),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 10, 12, 4),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: SvgPicture.asset(
                AppIcons.location,
                colorFilter: ColorFilter.mode(
                  AppColors.accent2,
                  BlendMode.srcIn,
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTextStyles.body2.copyWith(
                      color: AppColors.primaryText,
                    ),
                  ),
                  if (subtitle != null) ...[
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: AppTextStyles.body3.copyWith(
                        color: AppColors.secondaryText,
                      ),
                    ),
                  ],
                ],
              ),
            ),
            if (distance != null)
              Text(
                '${(distance / 1000).toStringAsFixed(1)} км',
                style: AppTextStyles.body3.copyWith(
                  color: AppColors.secondaryText,
                ),
              ),
          ],
        ),
      ),
    );
  }

  final BoundingBox _sngRegion = BoundingBox(
    Point(latitude: 35.0, longitude: 19.0),
    Point(latitude: 82.0, longitude: 190.0),
  );

  void _onSearchChanged(
    BuildContext context,
    AddressSearchProvider provider,
    String query,
  ) {
    provider.searchSuggestions(query: query, boundingBox: _sngRegion);
  }

  void _onSuggestionSelected(
    BuildContext context,
    AddressSearchProvider provider,
    SuggestItem suggestion,
  ) async {
    final point = await provider.selectSuggestion(
      suggestion,
      boundingBox: _sngRegion,
    );

    if (point != null && onAddressSelected != null) {
      onAddressSelected!(point);
      Navigator.pop(context); // Закрываем поисковый sheet
    }
  }
}
