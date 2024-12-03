import 'package:flutter/material.dart';

// ignore_for_file: prefer_const_constructors
// ignore_for_file:prefer_const_literals_to_create_immutables
// ignore_for_file:prefer_final_fields
// ignore_for_file:must_be_immutable
// ignore_for_file:camel_case_types

class grading extends StatefulWidget {
  const grading({super.key});

  @override
  State<grading> createState() => _gradingState();
}

class _gradingState extends State<grading> {
  TextEditingController _midtermController=TextEditingController();
  TextEditingController _finalController=TextEditingController();
  TextEditingController _projectController=TextEditingController();
  TextEditingController _participationController=TextEditingController();
   double finalGrade=0.0;
  String letterGrade='';
  String errorMessage='';

  void calculateGrade(){
    double midterm=double.tryParse(_midtermController.text)??-1;
    double finalG=double.tryParse(_finalController.text)??-1;
    double project=double.tryParse(_projectController.text)??-1;
    double participation=double.tryParse(_participationController.text)??-1;

    
    if (midterm<0||finalG<0||project<0||participation<0
        ||_midtermController.text.isEmpty||_finalController.text.isEmpty||
        _projectController.text.isEmpty||_participationController.text.isEmpty) {
      setState(() {
        errorMessage='Please enter valid numbers';
      });
      return;

    }
    setState(() {
      errorMessage='';
    finalGrade=midterm*0.3+finalG*0.35+project*0.3+participation*0.05 ;  
    if(finalGrade>100){
      finalGrade=100;
    }
    if (finalGrade>=90) {
      letterGrade='A';
    }
    else if(finalGrade>=80){
      letterGrade='B';
    }
    else if(finalGrade>=70){
      letterGrade='C';
    }
    else if(finalGrade>=60){
      letterGrade='D';
    }
    else if(finalGrade<60){
      letterGrade='F';
    }
    
    });
    

  }
 @override
  void dispose() {
    
    _midtermController.dispose();
    _finalController.dispose();
    _projectController.dispose();
    _participationController.dispose();

    super.dispose(); 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text( 'Grading',style: 
        TextStyle(fontSize: 28, fontWeight: FontWeight.bold),),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 5, 9, 138),
        foregroundColor: Colors.green,
      ),
      body: Center(child: Column(children: [
            SizedBox(height: 20),
            Text('Enter your grades',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GradeInput(controller: _midtermController,label: 'Midterm (30%)',hint: 'Grade', ),
                GradeInput(controller:_finalController,label: 'Final (35%)',hint: 'Grade', ),
                GradeInput(controller: _projectController,label: 'Project (30%)',hint: 'Grade', ),
                GradeInput(controller: _participationController,label: 'Participation (5%)',hint: 'Grade', ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(onPressed: calculateGrade, child: Icon(Icons.calculate, size: 50),),
            if(errorMessage.isNotEmpty)
            Text(errorMessage,style: TextStyle(color: Colors.red),textAlign: TextAlign.center,),
            SizedBox(height: 10),
            Text('Final Grade:${finalGrade.toStringAsFixed(1)} ',
            style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
            SizedBox(height: 10),
            Text('Letter Grade:$letterGrade', style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold))
          ],
        ),
      ),
    );
  }
}

class GradeInput extends StatelessWidget {
   String label;
   String hint;
   TextEditingController controller;

   GradeInput({required this.controller , required this.label, required this.hint, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5),
        SizedBox(
          height: 60, width: 100,child: TextField(
            controller: controller,
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              hintText: hint,
    
            ),
          ),
        ),
      ],
    );
  }
}
