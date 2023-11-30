import 'dart:math';

import 'package:flutter/material.dart';

double degToRad(double deg) => deg * (pi / 180.0);

double normalize(value, min, max) => ((value - min) / (max - min));


const double kDiameter = 300;
const double kMinDegree = 0;
const double kMaxDegree = 60;