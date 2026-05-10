// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

/*Ejercicio: Mensajes básicos con Solidity 
Implementar un contrato que permita al propietario del contrato enviar mensajes a otro usuario. Cada mensaje debe guardar: 
La dirección del remitente (from) //la misma 
La dirección del destinatario (to) 
El contenido del mensaje (contenido) 
La fecha y hora en que fue enviado (timestamp) //block.timestamp 

Cada vez que se envíe un mensaje: 
Debe guardarse en una estructura (struct) 
Debe emitirse un evento para dejar registro público en la blockchain*/

contract Mensajes {

    address public owner;

    struct Mensaje {
        address from;
        address to;
        string contenido;
        uint256 timestamp;
    }

    Mensaje[] public historial;

    event NuevoMensaje(address indexed from, address indexed to, string contenido, uint256 timestamp);

    constructor(){

        owner = msg.sender;

    }

    function enviarMensaje(address _to, string memory _contenido) public {

        require(msg.sender == owner, "Solo el propietario puede enviar mensajes");

        Mensaje memory mensajeParaGuardar = Mensaje({
            from: owner,
            to: _to,
            contenido: _contenido,
            timestamp: block.timestamp
        });

        historial.push(mensajeParaGuardar);

        emit NuevoMensaje(msg.sender, _to, _contenido, block.timestamp);
    }

}