// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract Demo {
    //this is the place to write a code here
    int public counter=15; // State var = costly-gas, Since, writeOnBkc, space/slot occupied wch stays frevr in bkc-mmry
    //all vars wriiten outside and inside sc is state var
    //Var delcratn & initialsn in solidity

    //local vars are always inside function
    // function localVar() public pure {
    //     int val = 120; //local var = 0-cost ReadOnBkc, not retuned hnc, pure
    //     //tempry use Stack or Heap mmry till function runs & not prmnt spc used.
    // }


    function writeStateVar() public {
        //writing the state var
        counter = 20; //updating counter to new value
    }

    function readStateVar() public view returns(int) {//returns=says actual-returning var's-Datatype
        return counter; //returns counter value
        //state var we only Reading, hence  'view'
    }

    function readAndWrite() public returns(int) {
        counter = 25; //Writing st-var
        return counter; //Reading st-var
        //if write & read both happened in funct Priority=Write then dont use 'view' 
    }

    function returnLocalVar() public pure returns(bool) {
        //st-var = priority, to read st-var use 'view' 
        //avoid 'pure' if reading both Local & state vars
        //pure = bcos i m not using any st-var in function
        bool value = true;
        return value;
    }
    function readStateAndLocalVar() public view returns(bool) {
        int localVar = counter;
        bool value = localVar > 0;
        return value;
    }
}

//contract acc: 0xd9145CCE52D386f254917e481eB44e9943F39138