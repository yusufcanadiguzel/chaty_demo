import 'package:flutter/material.dart';

class Constants{
  static const Radius _radius = Radius.circular(10.0);

  static const BorderRadius receiverRadius = BorderRadius.only(bottomLeft: _radius, bottomRight: _radius, topRight: _radius,);
  static const BorderRadius senderRadius = BorderRadius.only(bottomLeft: _radius, bottomRight: _radius, topLeft: _radius,);
}