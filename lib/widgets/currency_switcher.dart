import 'package:flutter/material.dart';
import 'package:sample_app/app_size.dart';

import '../constants.dart';
import '../models/currency.model.dart';

class CurrencySwitcher extends StatefulWidget {
  const CurrencySwitcher({
    Key? key,
    required this.currencies,
    required this.onCurrencySelected,
  }) : super(key: key);

  final List<Currency> currencies;
  final Function(Currency?) onCurrencySelected;

  @override
  State<CurrencySwitcher> createState() => _CurrencySwitcherState();
}

class _CurrencySwitcherState extends State<CurrencySwitcher> {
  Currency? _selectedCurrency = CURRENCIES[0];

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppSize.s12),
      child: Container(
        decoration: const BoxDecoration(
          color: kPrimaryLightColor,
        ),
        child: Row(
          children: widget.currencies.map((currency) {
            bool isCurrencySelected = currency.code == _selectedCurrency?.code;
            return GestureDetector(
              onTap: () {
                setState(() {
                  _selectedCurrency = currency;
                });
                widget.onCurrencySelected(_selectedCurrency);
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppSize.s16, vertical: AppSize.s16),
                decoration: BoxDecoration(
                  color:
                      isCurrencySelected ? kPrimaryColor : kPrimaryLightColor,
                ),
                child: Text(
                  currency.code,
                  style: TextStyle(
                    fontSize: AppSize.s18,
                    color: isCurrencySelected ? Colors.white : Colors.black,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
