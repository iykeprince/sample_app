import 'package:flutter/material.dart';

import '../constants.dart';
import '../models/plan.model.dart';
import 'sample_button.dart';

class PlanList extends StatelessWidget {
  const PlanList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (BuildContext context, int index) {
        // Product product = PRODUCTS[index];
        return PlanListItem(
          plan: Plan(imgUrl: '', name: '', price: 0.0),
        );
      },
    );
  }
}

class PlanListItem extends StatelessWidget {
  const PlanListItem({
    Key? key,
    required this.plan,
  }) : super(key: key);

  final Plan plan;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: kPrimaryBorderColor,
        ),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Bronze',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 16),
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network('https://via.placeholder.com/468x250'),
          ),
          const SizedBox(height: 20),
          const Text(
            'N 9000/month',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Up to 9 items',
            style: TextStyle(fontSize: 16, letterSpacing: 2),
          ),
          const SizedBox(height: 20),
          Row(
            children: const [
              Text(
                'VIEW CONTENT',
                style: TextStyle(
                  fontSize: 14,
                  color: kPrimaryLightColor,
                  letterSpacing: 4,
                ),
              ),
              SizedBox(width: 14),
              Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: kPrimaryColor,
              )
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                  child: SampleButton(
                title: 'GIFT',
                onPressed: () => print('gift'),
                buttonBgColor: kPrimaryLighterColor,
                buttonTextColor: kPrimaryColor,
              )),
              const SizedBox(width: 8),
              Expanded(
                  child: SampleButton(
                title: 'ADD TO CART',
                onPressed: () => print('add to cart'),
                buttonBgColor: kPrimaryColor,
              )),
            ],
          )
        ],
      ),
    );
  }
}
