// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

contract Primitivos {

    bool public pausado;

    bytes32 public saludo = hex"486F6C61";

    bytes32 public clave;

    function pausar(bool _opcion) public {
        pausado = _opcion;
    }

    function sumar(uint256 primerValor, uint256 segundoValor) public view returns (uint256) {
        require(pausado == false, "El contrato esta pausado");
        return primerValor + segundoValor;
    }

    function saludarHex() public view returns (bytes32) {
        return saludo;
    }

    function generarClave(string memory texto) public {
        clave = keccak256(abi.encodePacked(texto));
    }

}