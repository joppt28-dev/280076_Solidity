// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

contract CompMapping {
    uint256 secuencial = 100;
    
    //-------------ARREGLO DE EMPLEADOS--------------
    //Struct
    struct Empleado {
        string nombre;
        uint edad;      //uint == uint256
    }

    //MAPPING: clave - valor
    mapping (uint => Empleado) private empleados;

    function addEmpleado(uint id, string memory _nombre, uint _edad) public {
        empleados[id] = Empleado(_nombre, _edad);
    }

    function addEmpleadoSecuencial(string memory _nombre, uint _edad) public {
        empleados[secuencial] = Empleado(_nombre, _edad);
        secuencial = secuencial + 1;
    }

    function getEmpleados (uint i) public view returns (string memory, uint) {
        Empleado memory e = empleados[i];
        return (e.nombre, e.edad);
    }

    //-------------ARREGLO DE CUENTAS--------------
    struct Cuentas {
        address cuenta;
        uint saldo;
    }

    //SET

    //GET
}