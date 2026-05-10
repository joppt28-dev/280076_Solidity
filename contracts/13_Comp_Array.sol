// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

contract CompArray {
    
    //-------------ARREGLO DE NUMEROS--------------
    uint256[] public numeros;

    function agregarNumero(uint256 _num) public {
        numeros.push(_num);
    }

    //botar el array entero
    function obtenerNumeros() public view returns(uint256[] memory){
        return numeros;
    }

    function getTamanioArray () public view returns(uint256) {
        return numeros.length;
    }

    //function numero(uint256 indice) public view returns(uint256) --> Crea al compilar el arreglo numeros
    
    //-------------ARREGLO DE ALUMNOS--------------
    //Struct
    struct Alumno {
        string nombre;
        uint edad;      //uint == uint256
    }
    
    Alumno[] private alumnos;

    //para el arreglo de alumnos
    function agregarAlumno(string memory _nombre, uint _edad) public {
        alumnos.push(Alumno(_nombre, _edad));
    }

    function getAlumno(uint256 i) public view returns(string memory, uint){
        //version 1
        Alumno memory a = alumnos[i];
        return (a.nombre, a.edad);
        //version 2
        //return (alumnos[i].nombre, alumnos[i].edad);
    }

    //botar el array entero de alumnos
    function obtenerAlumnos() public view returns(Alumno[] memory){
        return alumnos;
    }

}