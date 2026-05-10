// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

contract Animal {
    string public especie;

    constructor (string memory _especie) {
        especie = _especie;
    }

    function hacerSonido() public pure virtual returns(string memory) {
        return "aaaahhh";
    }

    function obtenerInfo() public view returns(string memory) {
        return string.concat("Soy un ", especie);
    }
}

contract Perro is Animal{
    
    constructor() Animal("Perro"){

    }

    function hacerSonido() public pure override returns(string memory) {
        return "Guau";
    }

}

contract Gato is Animal{
    
    constructor() Animal("Gato"){

    }

    function hacerSonido() public pure override returns(string memory) {
        return "Miau";
    }

    function ronronear() public pure returns(string memory){
        return "rrrrr";
    }

}

contract PetStore {
    Animal[] public animals;

    function addPerro(address _direccion) public {
        //utilizamos NEW para utilizar y deployar el contrato Perro
        //Perro p = new Perro();
        animals.push(Perro(_direccion));
    }

    function addGato() public {
        //utilizamos NEW para utilizar y deployar el contrato Perro
        Gato g = new Gato();
        animals.push(g);
    }

    function getCantidadAnimales() public view returns(uint){
        return animals.length;
    }

    function sonidoAnimal(uint indice) public view returns(string memory) {
        return animals[indice].hacerSonido();
    }

    function infoAnimal(uint indice) public view returns(string memory){
        return animals[indice].obtenerInfo();
    }
}