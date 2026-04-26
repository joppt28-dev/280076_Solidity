// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

import "@openzeppelin/contracts@4.9.3/utils/Counters.sol";

contract Intro {
    
    uint256 private cantidad; // variable de estado
    string public nombre = "UPAO"; // al ser una variable de estado pública se genera al deployar un acceso directo para ver su valor
    
    constructor(uint256 _valorCantidad) { // Constructor, solo se ejecuta cuando se deploya
        cantidad = _valorCantidad;
    }

    function cambiarCantidad(uint256 _cantidad) public { // set
        cantidad = _cantidad;
    }

    function obtenerCantidad() public view returns (uint256) { // get
        return cantidad;
    }

}
