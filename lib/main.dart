
/* Họ Tên: Võ Nguyễn Thanh Sang 
  MSSV : 0306201573
  Lớp CĐ TH 20PMD
 */

import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
void main()  => runApp(Bai07_Caculator());


class Bai07_Caculator extends StatelessWidget {
  const Bai07_Caculator({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Máy tính bỏ túi đơn giản ',
      home: Scaffold(appBar: AppBar(
        title: const Text('Máy tính bỏ túi đơn giản'),
      ),
      backgroundColor: Colors.white,
      body:  Bai07_CaculatorHome(),
      //bổ sung 
      ),
    );
  }
}
class Bai07_CaculatorHome extends StatefulWidget 
{
  const Bai07_CaculatorHome({super.key});

  @override
  State<StatefulWidget> createState() {
   return Bai07_CaHomeState();
  }

}

class Bai07_CaHomeState extends State<Bai07_CaculatorHome> {
  //Bổ sung 2
  late String _input ;
   late String _output ;
   late String _error;
  @override
void initState() {
super.initState();
_input = '';
_output = '0';
}
 
  @override
  Widget build(BuildContext context) {
    // Bổ sung 3
    void calculate() {
//thay thế các phép x thành *, % thành /100
String strInput = _input.replaceAll('x', '*');
strInput = strInput.replaceAll('%', '/100');
//parse chuỗi nhập sang biểu thức tính toán
Parser p = Parser();
Expression exp = p.parse(strInput);
//tạo model để tính toán biểu thức
ContextModel conmod = ContextModel();
double value = exp.evaluate(EvaluationType.REAL, conmod);
_output = value.toString();




}
    List<String> lskey = ['C','DEL','%','/','7','8','9','x','4','5','6','--','1','2','3','+','Ans','0','.','=',];
    List<String> lsSpe = ['+','-','x','/','%','.'];
    
    bool _CheckFunctionKey(index) {
            switch (index) {
            case 0://phím C
            case 1: //phím DEL
            case 2: //phím %
            case 3: //phím /
            case 7: //phím x
            case 11: //phím +
            case 15: //phím -
            case 19: //phím =
             return true;
            }
            return false;
            }
            void _keyTap(int index)
            {
               
              if(_input.isEmpty && lsSpe.contains(lskey[index])) return;
              if(_input.isNotEmpty)
              {
                if(lsSpe.contains(_input.substring(_input.length-1) ) && lsSpe.contains(lskey[index]))  return;
                
              }
              
              setState(() {
                
              });
              switch (index) {
            case 0: //Phím C, xóa các text
            {
                _input = '';
                _output = '0';
            }
            break;
            case 1: //Phím DEL, xóa ô nhập ký tự cuối
            {
                if (_input.length > 0) {
                _input = _input.substring(0, _input.length - 1);
            }
            }
            break;
            case 11: //phím -, do nhãn hiển thị --
            { 
              if(_input.isEmpty)
              {
                 _input += '-';
              }
              if(_input.substring(_input.length-1) == "-") return;
              if(_input!="-")
              {
                _input += '-';
                 
              }
              
              
            }
            break;
            case 16: //Phím Ans, lấy kết quả đưa vào biểu thức tính
            {
                 _input = _output;
            }
            break;
            case 19: //Phím =, tính toán giá trị biểu thức
            {
              if( lsSpe.contains(_input.substring(_input.length-1))  )
              {
                 _output = "Lỗi Biểu Thức";
              }
              else 
                  calculate();
            }
            break;
            default: //các phím số, +, x, /, .
            { 
                      

                        _input += lskey[index];
                    
                   

            }
            break;
            }
            }
      Widget buildKey(int index)
            {
              return OutlinedButton(onPressed: () => _keyTap(index) , child: Text(
                lskey[index],style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: _CheckFunctionKey(index)?Colors.blue.shade900 : Colors.black54,
                    
                ),
                
              ),style: OutlinedButton.styleFrom(
                shape: const CircleBorder(),
                backgroundColor: lskey[index] == "=" ? Colors.orange.shade100 : Colors.grey.shade300,
              ),

              );
            }
    Widget _TextSection = Container(
      decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 1.0,
              color: Colors.yellow 
            )
          )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                alignment: Alignment.centerRight,
                child: Text(
                  _input, style: TextStyle(
                    fontSize: 20,color: Colors.blue
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20),
                alignment: Alignment.centerRight,
                child: Text(
                  _output,
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.blue
                  ),
                  ),
              ),
               
              
            ],
          ),
    );
    Widget _KeySection = Container(
      padding: EdgeInsets.only(
        left: 20,
        right: 20
      ),
      child: GridView.builder(
        itemCount: 20,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 15,
          mainAxisSpacing: 5,
        ),
        itemBuilder:((context,index)
        {return Container(
          padding: const EdgeInsets.all(20),
          child: Container(
                          padding: const EdgeInsets.all(10),
                          child: buildKey(index),
                      ),
        );
        }),
      ),
    );
    
    return Column(
              children: [
              _TextSection,
              Expanded(child: _KeySection),
              ],
              
);

  }

}

 






