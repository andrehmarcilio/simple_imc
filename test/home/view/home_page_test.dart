import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nutricionistaapp/home/views/home_view.dart';
import 'package:nutricionistaapp/home/views/resultado_view.dart';

void main() {
  testWidgets('deve calcular IMC', (tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: MyHomePage(title: 'Nutri App'),
    ));
    final limparButton = find.text('LIMPAR');
    expect(limparButton, findsOneWidget);

    final calcularButton = find.text('CALCULAR IMC');
    expect(calcularButton, findsOneWidget);

    final nomeTextField = find.byWidgetPredicate((widget) {
      return findTextField(widget, 'Nome');
    });
    expect(nomeTextField, findsOneWidget);

    final pesoTextField = find.byWidgetPredicate((widget) {
      return findTextField(widget, 'Peso');
    });
    expect(pesoTextField, findsOneWidget);

    final alturaTextField = find.byWidgetPredicate((widget) {
      return findTextField(widget, 'Altura');
    });
    expect(alturaTextField, findsOneWidget);


    await tester.enterText(nomeTextField, 'André');
    await tester.enterText(pesoTextField, '80.0');
    await tester.enterText(alturaTextField, '1.81');
    await tester.tap(limparButton);
    await tester.pump();

    final nomeController = find.text('André');
    final pesoController = find.text('80.0');
    final alturaController = find.text('1.81');
    expect(nomeController, findsNothing);
    expect(pesoController, findsNothing);
    expect(alturaController, findsNothing);

    await tester.enterText(nomeTextField, 'André');
    await tester.enterText(pesoTextField, '80.0');
    await tester.enterText(alturaTextField, '1.81');
    await tester.tap(calcularButton);
    await tester.pumpAndSettle();

    final resultadoPage = find.byType(ResultadoPage);
    expect(resultadoPage, findsOneWidget);
    expect(nomeController, findsOneWidget);
    expect(pesoController, findsOneWidget);
    expect(alturaController, findsOneWidget);

    final textFieldsInativos = find.byWidgetPredicate((widget) {
      return findTextFieldInativos(widget);
    });

     expect(textFieldsInativos, findsNWidgets(5));

      final textFieldsAtivos = find.byWidgetPredicate((widget) {
      return findTextFieldAtivos(widget);
    });

     expect(textFieldsAtivos, findsNothing);

     final imcValueController = find.text('24.42');
    expect(imcValueController, findsOneWidget);


     final backButton = find.byType(BackButton);
     expect(backButton, findsOneWidget);

     await tester.tap(backButton);
     await tester.pumpAndSettle();

     final homePage = find.byType(MyHomePage);
     expect(homePage, findsOneWidget);

  });


}


bool findTextField(Widget widget, String labelText) {
  if(widget is TextField) {
    if (widget.decoration!.labelText == labelText) {
      return true;
    }
  }
  return false;
}

bool findTextFieldInativos(Widget widget) {
  if(widget is TextField) {
    if (widget.enabled == false) {
      return true;
    }
  }
  return false;
}

bool findTextFieldAtivos(Widget widget) {
  if(widget is TextField) {
    if (widget.enabled == true || widget.enabled == null) {
      return true;
    }
  }
  return false;
}
