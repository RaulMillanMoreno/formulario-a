import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Raúl Millán Project',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  final myController = TextEditingController();
  final String title = 'Raúl Millán projec';
  final _formKey = GlobalKey<FormBuilderState>();
  void _onChanged(dynamic val) => debugPrint(val.toString());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const FormTitle(),
              FormBuilder(
                key: _formKey, 
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[// en esta parte es donde se pone el texto del inicio
                    const SizedBox(height: 20),
                    //Titulo general del formulario
                    Text('Please provide the speed of vehicle?',
            
                      style: Theme.of(context).textTheme.labelLarge?.apply(

                        fontSizeFactor: 1.5,
                        color: Colors.black,
                      ),      
                      textAlign: TextAlign.left,
                    ),

                    //encabezado y grupo de radio buttons
                    Text('please select one option given below',
                      style: Theme.of(context).textTheme.labelLarge?.apply(

                        fontSizeFactor: 1.25,
                        color: Theme.of(context).colorScheme.secondary.withOpacity(0.5)
                      ),
                      textAlign: TextAlign.left,      
                    ),
                    
                    const SizedBox(height: 20),

                    FormBuilderRadioGroup<String>(
                      initialValue: null,
                      name: 'speed_of_vehicle',
                      onChanged: _onChanged,
                      validator: FormBuilderValidators.compose(
                          [FormBuilderValidators.required(errorText: 'Es necesario seleccionar una opción')]),
                      options: ['above 40km/h','below 40km/h','0km/h']
                        .map((lang) => FormBuilderFieldOption(
                              value: lang,
                              child: Row( // Cambiamos a Row para controlar la disposición
                                children: [
                                  Text(lang),
                                ],
                              ),
                            ))
                        .toList(growable: false),
                      controlAffinity: ControlAffinity.leading,
                      
                    ),
                    const SizedBox(height: 20),

                    // Encabezado y campo de texto.
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

                    FormBuilderTextField(
                      name: 'remarks',
                      validator: FormBuilderValidators.required(),
                      decoration: InputDecoration(
                        hintText: 'Enter your remarks', // Texto de sugerencia dentro del campo
                        filled: true, // Para llenar el fondo del campo
                        fillColor: const Color.fromARGB(255, 228, 222, 222), // Color de fondo similar al de la imagen
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0), // Bordes redondeados
                          borderSide: BorderSide(// no sale el color del borde
                            color: Colors.black, // Color del borde
                            width: 1.0, // Grosor del borde
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    //Encabezado y dropdown
                    Text('Please provide the high speed of vehicle?',
            
                      style: Theme.of(context).textTheme.labelLarge?.apply(

                        fontSizeFactor: 1.5,
                        color: Colors.black,
                      ),      
                      textAlign: TextAlign.left,
                    ),

                    Text('please select one option given below',
                        style: Theme.of(context).textTheme.labelLarge?.apply(

                          fontSizeFactor: 1.25,
                          color: Theme.of(context).colorScheme.secondary.withOpacity(0.5)
                        ),
                        textAlign: TextAlign.left,      
                      ),
                      
                    const SizedBox(height: 20),

                    FormBuilderDropdown<String>(
                      name: 'country',
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
                      items: ['High', 'Medium', 'Low']
                          .map((lang) => DropdownMenuItem(
                                value: lang,
                                child: Text(lang),
                              ))
                          .toList(),
                      onChanged: _onChanged,
                    ),
                    const SizedBox(height: 20),

                    //Encabezado y grupo de chebox
                    Text('Please provide the speed of vehicle past 1 hour?',
            
                      style: Theme.of(context).textTheme.labelLarge?.apply(
                        fontSizeFactor: 1.5,
                        color: Colors.black,
                      ),      
                      textAlign: TextAlign.left,
                    ),

                    Text('please select one option or more given below',
                        style: Theme.of(context).textTheme.labelLarge?.apply(

                          fontSizeFactor: 1.25,
                          color: Theme.of(context).colorScheme.secondary.withOpacity(0.5)
                        ),
                        textAlign: TextAlign.left,      
                      ),
                      
                    const SizedBox(height: 20),

                    FormBuilderCheckboxGroup<String>(
                      name: 'high_speed',
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      orientation: OptionsOrientation.vertical,
                      options: const [
                        FormBuilderFieldOption(value: '20km/h'),
                        FormBuilderFieldOption(value: '30km/h'),
                        FormBuilderFieldOption(value: '40km/h'),
                        FormBuilderFieldOption(value: '50km/h'),
                      ],
                      onChanged: _onChanged,
                    ),
                  ],
                ),
              )
            ],
          )        
        )        
      ),
      //boton flotante donde se muestran los datos seleccionados.
      floatingActionButton: FloatingActionButton(
        onPressed: () {       
          if (_formKey.currentState?.saveAndValidate() ?? false) {
            final formValues = _formKey.currentState!.value;
            showDialog(context: context,
              barrierDismissible: true, 
              builder: (BuildContext context){
                return AlertDialog(
                  icon: const Icon(Icons.check_circle),                
                  title: const Text('Submission Completed'),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Velocidad: ${formValues['speed_of_vehicle'] ?? 'No seleccionado'}'),
                      Text(
                        'Opción: ${formValues['remarks'] ?? 'No seleccionado'}'),
                      Text(
                        'Rango de Velocidad: ${formValues['country'] ?? 'No seleccionado'}'),
                      Text(
                        'Múltiple Velocidad: ${formValues['high_speed'] ?? 'No seleccionado'}'),
                    ],
                  ),
                  actions: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('OK'),
                    ),
                  ],
                );
              },          
            ); 
          }             
        },
        child: const Icon(Icons.upload),
      ),

    );
  }
}

class FormTitle extends StatelessWidget{ // aqui es donde se crea el texto del encabezado principal

  const FormTitle({super.key,});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text('Driving Form',
          style: Theme.of(context)
            .textTheme
            .displaySmall
            ?.copyWith(fontWeight: FontWeight.bold),            
          ),

          Text('Form example', 
            style: TextStyle(
              color: Colors.grey,
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.normal,
            ),
          )
        ],
      ),
    );
  }
}