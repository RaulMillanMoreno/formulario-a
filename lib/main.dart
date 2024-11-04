import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recuperar el valor d\'un camp de text',
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
  final _formKey = GlobalKey<FormBuilderState>();
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
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(

        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: FormBuilder(
            key: _formKey, 
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[// en esta parte es donde se pone el texto del inicio
                
                Center(
                  child: Text(
                     "Driving Form",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 55,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.normal,
                    ),
                  ),

                ),
                
                Text(
                  "Driving Form",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 55,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.normal,
                  ),
                  textAlign: TextAlign.center,
                ),
                
                
                Text(
                  "Form examples",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.normal,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                Text( // estos son los primeros textos y es donde se ponen sus especificaciones.
                  "Form examples ",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.normal,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  "Form examples ",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.normal,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),

                FormBuilderRadioGroup<String>(
                  initialValue: null,
                  name: 'best_language',
                  onChanged: _onChanged,
                  validator: FormBuilderValidators.compose(
                      [FormBuilderValidators.required()]),
                  options: ['Dart','Kotlin','Java','Swift','Objective-C']
                      .map((lang) => FormBuilderFieldOption(
                            value: lang,
                            child: Row( // Cambiamos a Row para controlar la disposición
                              children: [
                                Text(lang),
                              ],
                            ),
                          ))
                      .toList(growable: false),
                  controlAffinity: ControlAffinity.leading, // Cambia a trailing si prefieres que el texto esté a la derecha
                ),
                const SizedBox(height: 20),

                Text(
                  "Enter remarks",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.normal,
                  ),
                  textAlign: TextAlign.left,
                ),

                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Enter your remarks', // Texto de sugerencia dentro del campo
                    filled: true, // Para llenar el fondo del campo
                    fillColor: const Color.fromARGB(255, 228, 222, 222), // Color de fondo similar al de la imagen
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0), // Bordes redondeados
                      borderSide: BorderSide(// no sale el color del borde
                        color: Colors.red, // Color del borde
                        width: 1.0, // Grosor del borde
                      ),
                    ),
                  ),
                ),

                Text(
                  "Enter remarks",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.normal,
                  ),
                  textAlign: TextAlign.left,
                ),

                Text(
                  "Enter remarks",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.normal,
                  ),
                  textAlign: TextAlign.left,
                ),

                  
                const SizedBox(height: 20),

                // Campo de texto adicional
                FormBuilderTextField(
                  name: 'remarks',
                  decoration: InputDecoration(
                    hintText: 'Enter your remarks',
                    filled: true,
                    fillColor: const Color.fromARGB(255, 228, 222, 222),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: const BorderSide(color: Colors.red),
                    ),
                  ),
                ),

                // ComboBox
                FormBuilderDropdown<String>(
                  name: 'option_s',
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    filled: true,
                    fillColor: Colors.transparent,
                  ),
                  hint: const Text('Select option'),
                  validator: FormBuilderValidators.compose(
                    [FormBuilderValidators.required()],
                  ),
                  items: ['Dart', 'Kotlin', 'Java', 'Swift', 'Objective-C']
                      .map((lang) => DropdownMenuItem(
                            value: lang,
                            child: Text(lang),
                          ))
                      .toList(),
                  onChanged: _onChanged,
                ),

                Text(
                  "Enter remarks",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.normal,
                  ),
                  textAlign: TextAlign.left,
                ),

                Text(
                  "Enter remarks",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.normal,
                  ),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          )
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