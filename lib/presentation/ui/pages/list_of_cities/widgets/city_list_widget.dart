import 'package:flutter/material.dart';

import '../../../../../domain/domain.dart';
import 'search_field_widget.dart';

class CityListWidget extends StatelessWidget {
  final List<CityEntity> cities;
  final void Function(String) onChanged;
  final void Function() onPressed;
  final void Function(String) onSelectCity;

  const CityListWidget({
    super.key,
    required this.cities,
    required this.onChanged,
    required this.onPressed,
    required this.onSelectCity,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SearchFieldWidget(
          onChanged: onChanged,
          onPressed: onPressed,
        ),
        const SizedBox(height: 10),
        if (cities.isNotEmpty)
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: cities.length,
              itemBuilder: (context, index) {
                final city = cities[index];

                return ListTile(
                  onTap: () {
                    onSelectCity(city.id);
                  },
                  title: Text(city.name),
                  subtitle: city.state.isNotEmpty
                      ? Text('${city.state} - ${city.country}')
                      : null,
                  trailing: Image.network(
                    'https://openweathermap.org/images/flags/${city.country.toLowerCase()}.png',
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(Icons.not_accessible);
                    },
                  ),
                );
              },
            ),
          ),
      ],
    );
  }
}
