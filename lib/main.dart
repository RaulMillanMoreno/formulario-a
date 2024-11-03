import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recuperar el valor d''un camp de text',
      theme: ThemeData(       
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),      
      home: MyCustomForm(title: 'por fin tio'),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key, required this.title});

  final String title;
  @override
  State<MyCustomForm> createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  final myController = TextEditingController();
  void _onChanged(dynamic val) => debugPrint(val.toString());

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title:Text(widget.title),
      ),
      body: Container(// en esta parte es donde se pone el texto del inicio     
        child: Column(
          children: <Widget>[
            Text(// estos son los primeros textos y es donde se ponen sus especificaciones.
            "Driving Form",
              style: TextStyle(
                color: Colors.black,
                fontSize: 55,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.normal
              ),
              textAlign: TextAlign.center,
            ),

            Text(// estos son los primeros textos y es donde se ponen sus especificaciones.
            "Form examples",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.normal
              ),
              textAlign: TextAlign.center,              
            ),
            const SizedBox(height: 20),

            Text(// estos son los primeros textos y es donde se ponen sus especificaciones.
            "Form examples ",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.normal
              ),
              textAlign: TextAlign.center,
            ),
            
            Text(// estos son los primeros textos y es donde se ponen sus especificaciones.
            "Form examples ",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.normal
              ),
              textAlign: TextAlign.center,
            ),
            
            FormBuilderRadioGroup<String>(
              initialValue: null,
              name: 'best_language',
              onChanged: _onChanged,
              validator: FormBuilderValidators.compose(
                [FormBuilderValidators.required()]),
              options: ['Dart', 'Kotlin', 'Java', 'Swift', 'Objective-C']
                  .map((lang) => FormBuilderFieldOption(
                        value: lang,
                        child: Text(lang),
                      ))
                  .toList(growable: false),
              controlAffinity: ControlAffinity.leading,
            ),




            
          ],
        )       
      
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              backgroundColor: Colors.transparent,
              context: context,
              builder: (BuildContext context) {
                return Container(
                    decoration: const BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25),
                      ),
                    ),
                    height: 200,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(myController.text),
                          ElevatedButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: const Text('Tancar BottomSheet'),
                          )
                        ],
                      ),
                    ));
              });
        },
        tooltip: 'Mostra el valor!',
        child: const Icon(Icons.text_fields),
      ),
    );
  }
  
}
