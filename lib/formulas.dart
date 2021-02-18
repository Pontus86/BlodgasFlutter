import 'package:flutter/material.dart';
import 'dart:math';

class _formulas {

  double calculatePHCO3 (double pco2, double ph){
    double phco3 = 0.23 * pco2 * pow(10, (ph - 6.1));
    return phco3;
  }

  double calculateAnionGap (double na, double phco3, double cl){
    double anionGap = na - (phco3 + cl);
    return anionGap;
  }

  double calculateBE (double pco2, double ph){
    double BE = 0.02786 * (pco2) * pow(10, (ph-6.1)) + 13.77 * ph - 124.58;
    return BE;
  }

}

