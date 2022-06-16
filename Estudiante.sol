// SPDX-License-Identifier: MIT
pragma solidity ^0.8.12;

contract Estudiante{

    string private _nombre;
    string private _apellido;
    string private _curso;
    address private _docente;
    mapping(string => uint8) private _notas_materias;
    string[] private _materias;
    string[] private _materias2;
    uint8 private contador;

    constructor(string memory nombre_, string memory apellido_, string memory curso_){
        _nombre = nombre_;
        _apellido = apellido_;
        _curso = curso_;
        _docente = msg.sender;
    }

    function apellido() public view returns (string memory){
        return _apellido;
    }

    function nombre_completo() public view returns (string memory){ 
        return string.concat(_nombre, " ", _apellido);
    }

    function curso() public view returns (string memory){
        return _curso;
    }

    function set_nota_materia(uint8 nota, string memory materia) public{
        require(msg.sender == _docente, "Ingrese con una cuenta valida");
        _notas_materias[materia] = nota;
        bool isInArr = false;
        uint i;
        for (i = 0; i < _materias.length; i++){
            if (_notas_materias[_materias[i]] > 0){
                isInArr = true;
                break;
            }
        }

        if (isInArr){
            _materias.push() = materia;
        }
        contador++;
    }

    function nota_materia(string memory materia) public view returns(uint8){
        return _notas_materias[materia];
    }

    function aprobo(string memory materia) public view returns(bool){
        if (_notas_materias[materia] > 59){
            return true;
        }
        return false;
    }

    function promedio() public view returns (uint){
        uint _promedio = 0;
        for (uint i = 0; i < _materias.length; i++){
            _promedio += _notas_materias[_materias[i]];
        }

        return _promedio / _materias.length;
    }

    /*Opcional:
    A) 
    B)
    C)
    */ 
}