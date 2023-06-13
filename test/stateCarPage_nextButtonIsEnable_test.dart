// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:CotizApp/app.dart';
import 'package:CotizApp/domain/forms/forms_bloc.dart';
import 'package:CotizApp/ui/pages/state_car.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  group('StateCarPage', () {
    test('nextButtonIsEnable should return true when version and carState are not empty', () {
      // Arrange
      final state = FormsState(version: 'Basica', carState: 'Nuevo');
      final page = StateCarPage();

      // Act
      final result = page.nextButtonIsEnable(state);

      // Assert
      expect(result, true);
    });

    test('nextButtonIsEnable should return false when version is empty', () {
      // Arrange
      final state = FormsState(version: '', carState: 'Nuevo');
      final page = StateCarPage();

      // Act
      final result = page.nextButtonIsEnable(state);

      // Assert
      expect(result, false);
    });

    test('nextButtonIsEnable should return false when carState is empty', () {
      // Arrange
      final state = FormsState(version: 'Basica', carState: '');
      final page = StateCarPage();

      // Act
      final result = page.nextButtonIsEnable(state);

      // Assert
      expect(result, false);
    });

    test('nextButtonIsEnable should return false when version and carState are empty', () {
      // Arrange
      final state = FormsState(version: '', carState: '');
      final page = StateCarPage();

      // Act
      final result = page.nextButtonIsEnable(state);

      // Assert
      expect(result, false);
    });
  });
}
