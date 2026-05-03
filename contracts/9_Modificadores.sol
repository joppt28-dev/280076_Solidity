// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

contract Modificadores {

    uint256 private fondos = 0;
    address private owner;

    constructor() {
        owner = msg.sender;
    }

    modifier isPropietario() {
        require(msg.sender == owner, "No eres el propietario");
        _;
    }

    modifier notCero() {
        require(fondos > 0, "No tiene fondos");
        _;
    }

    function depositarFondos (uint256 monto) public {
        fondos = fondos + monto; // fondos = += monto;
    }

    function retirarFondos(uint256 monto) public isPropietario notCero{
        //require(msg.sender == owner, "No eres el propietario");
        require(fondos >= monto, "Saldo insuficiente");
        fondos = fondos - monto; // fondos = -= monto;
    }

        
    function limpiarFondos() public isPropietario notCero{
        //require(msg.sender == owner, "No eres el propietario");
        fondos = 0;
    }

    function consultarFondos() public view returns (uint256) {
        return fondos;
    }
}