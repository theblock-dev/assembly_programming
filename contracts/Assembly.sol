// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Assembly {

  constructor() {
  }

  function someOP(uint _data) external pure returns(uint ret){
    assembly{
      switch _data
      case 1 {
        ret:= 10
      }

      case 2 {
        ret := 20
      }

      default {
        ret := 100
      }
    }     
  }

  function forLoop(uint[] memory _data) external pure returns(uint sum){
    assembly{
      let length := mload(_data)
      let data := add(_data, 0x20)

      for 
        { let end := add(data, mul(0x20, length)) }
        lt(data, end) 
        {data := add(data, 0x20)}
      {
        sum := add(sum, mload(data))
      }        
    }
  }

  function isContract(address _add) external view returns(bool) {
    uint codeLength;
    assembly{
      codeLength := extcodesize(_add)
    }
    return (codeLength == 0 ? false : true);
  }

}
