import 'package:flutter/material.dart';

import 'models/currency.model.dart';
import 'models/plan.model.dart';

const Color kPrimaryColor = Color(0xff8daa6a);
const Color kPrimaryLightColor = Color(0xffcde0a9);
const Color kPrimaryLighterColor = Color(0xffcee89e);
const Color kPrimaryDarkColor = Color(0xff252b25);
const Color kPrimaryBorderColor = Color(0xffd2eaa6);
const Color kLightColor = Color(0xffefeee4);
const Color kWhiteColor = Color(0xffffffff);

List<Currency> CURRENCIES = [
  Currency(name: 'Nigeria Naira', code: 'NGN'),
  Currency(name: 'United State Dollar', code: 'USD')
];

List<Plan> PLANS = [];
