// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

contract Eventos {

    uint256 private cantidad = 10;

    event cambioValorCantidad(address invocador, uint256 nuevoValor, uint256 valorAnterior);

    function cambiarCantidad(uint256 _cantidad) public {
        uint256 valorAnterior = cantidad;
        cantidad = _cantidad;
        emit cambioValorCantidad(msg.sender, valorAnterior, _cantidad);

    }

    function obtenerCantidad() public view returns (uint256) {
        return cantidad;
    }


}