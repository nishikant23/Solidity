// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract Demo {
    //// Refrence Data types
    /// 1. STRING Data Type
   string public myStr;
   function updateStr(string memory _newStr) public {
    myStr = _newStr;
   }
   function printstr() public view returns(string memory) {
    return myStr;
   }

    /// 2.1 ARRAYS -- FIXED ARRAY

    uint[4] public fixArr;

   function fixArrLen() public view returns(uint) {
    return fixArr.length;
   }
   function updateFixArr(uint _index, uint _value) public {
    fixArr[_index] = _value;
   }
   function getFixArr() public view returns(uint[4] memory){ //imp to use 'memory' since fixArr stored data in memory 
     //to acces its values specify retruning-thing is from memory
    return fixArr;
   }

   /// 2.2 ARRAYS - DYNAMIC ARRAY
   uint[] public dynamicArr;

   function dynamicArrayLen() public view returns(uint) {
    return dynamicArr.length;
   }
   function updateDynArr(uint _value) public {
    dynamicArr.push(_value);
   }
   function removeFrommDynArr() public {
    require(dynamicArr.length>0, "Dynamic Array is Empty");
    dynamicArr.pop();
   }
   function getDynArr() public view returns(uint[] memory){ //imp to use 'memory' since fixArr stored data in memory 
     //to acces its values specify retruning-thing is from memory
    return dynamicArr;
   }

   /// 3. STRUCT
   struct Student {
    string name;
    uint age;
    uint rollno;
   }
   Student public stud1;
   function updateStudDetails() public returns(Student memory) {
    stud1.name = "Vijay";
    stud1.age = 21;
    stud1.rollno = 205;
    return stud1;
   }
   function getStudName() public view returns(string memory) {
    return stud1.name;
   }

   /// making Struct array
   Student[5] students;
   function getStudLen() public view returns(uint) {
    return students.length;
   }  
   function updateStudents(uint _index, string memory _name, uint _age, uint _rollno) public {
    require(_index>0 && _index<5, "Index Out of Bounds");
    students[_index] = Student({
      name: _name,
      age: _age,
      rollno: _rollno
    });
   }
   function getStudent(uint _index) public view returns(Student memory) {
    return students[_index];
   }

   /// 4. MAPPINGS Data Type

   mapping(string => uint) employSalary;
   

   function updateMapping(string memory _empName, uint _salary) public {
    employSalary[_empName] = _salary;
   }

   function getEmpSalary(string memory _empName) public view returns(uint) {
     return employSalary[_empName];
    }

    ///4.2 Mapping of address DT => Struct
    struct Employee {
      string name;
      string position;
      uint salary;
      bool leftOrg; 
    }
    mapping(address=> Employee) empDetails;
    // address wadiSir = 0x8a88fb666360ca9a4692f6b373565f69a9dbeb6bf2811e4701c1d5f74470ddeb
    // address sanketAntre = 0xd87419ed671a88b7c58c9c3e8d03d00e4a6574f27b0d5d68133e7849687a556a
    // address nishikantDounekar = 0x357c597f94176492d12ba077db66645ff3144fc559809934a188a444a91111b2


    function updateStructMap(
        address  _address, 
        string memory _name, 
        string memory _position, 
        uint _salary, 
        bool _leftOrg) 
      public {
      
        empDetails[_address] = Employee({
          name: _name,
          position: _position,
          salary: _salary,
          leftOrg: _leftOrg
        });
    }

    function getEmpData(address  _empAddress) public view returns(string memory, string memory, uint, bool) {
     Employee memory empVar =  empDetails[_empAddress];
     return (
        empVar.name, 
        empVar.position, 
        empVar.salary, 
        empVar.leftOrg
        );
    }

    /// 4.3 Nested mapping
    struct InnerData{
      string ask;
      bool chk;
    }

    mapping(uint=> mapping(uint=> InnerData)) public nestedMap;

    function updNestedMap(uint _outerKey, uint _innerKey, string memory _ask, bool _chk) public {
      nestedMap[_outerKey][_innerKey] = InnerData({
        ask : _ask,
        chk : _chk
      });
    }

    function getNestedMapData(uint _outerKey, uint _innerKey) public view returns(string memory, bool) {
      InnerData memory currData = nestedMap[_outerKey][_innerKey];

      return(
        currData.ask,
        currData.chk
      );
    }
}

