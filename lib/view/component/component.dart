import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../theme.dart';

class GlassCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white.withOpacity(0.6),),
        color: Colors.white.withOpacity(0.5),
        borderRadius: BorderRadius.circular(24),
        boxShadow: boxShadow
      ),
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset('assets/img/chipcard.svg', color: pallets['primary'],),
              SvgPicture.asset('assets/img/mastercard.svg', color: pallets['primary']),
            ],
          ),
          Text('Rp1.000.000',
            style: TextStyle(
              color: pallets['primary'],
              fontSize: 32, 
              fontWeight: FontWeight.w700
            ),
          )
        ],
      ),
    );
  }
}