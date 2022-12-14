import 'package:flutter/material.dart';
import 'package:sample_app/app_size.dart';

import '../constants.dart';
import '../models/currency.model.dart';
import '../widgets/currency_switcher.dart';
import '../widgets/plan_list.dart';

class PlanView extends StatefulWidget {
  const PlanView({Key? key}) : super(key: key);

  @override
  State<PlanView> createState() => _PlanViewState();
}

class _PlanViewState extends State<PlanView> {
  Currency? _selectedCurrency;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSize.s8),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Row(
            children: [
              const Text(
                'Plans',
                style: TextStyle(
                  fontSize: AppSize.s24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Expanded(child: Container()),
              InkWell(
                onTap: () {},
                child: const Icon(
                  Icons.shopping_cart,
                  color: kPrimaryColor,
                  size: AppSize.s24,
                ),
              )
            ],
          ),
          const SizedBox(height: AppSize.s36),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CurrencySwitcher(
                currencies: CURRENCIES,
                onCurrencySelected: _onCurrencySelected,
              ),
            ],
          ),
          const SizedBox(height: AppSize.s20),
          const Expanded(
            child: PlanList(),
          ),
        ],
      ),
    );
  }

  void _onCurrencySelected(Currency? currency) {
    setState(() {
      _selectedCurrency = currency;
    });
  }
}
