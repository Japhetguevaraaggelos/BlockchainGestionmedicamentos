// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MedicationRegistry {
    struct Medication {
        string name;
        uint256 quantity;
        string location;
        string action;
    }

    Medication[] public medications;

    // Evento para emitir cuando se registre una nueva medicina
    event MedicationRegistered(string name, uint256 quantity, string location, string action);

    // Función para registrar una nueva medicina
    function registerMedication(string memory _name, uint256 _quantity, string memory _location, string memory _action) public {
        medications.push(Medication({
            name: _name,
            quantity: _quantity,
            location: _location,
            action: _action
        }));
        emit MedicationRegistered(_name, _quantity, _location, _action);
    }

    // Función para obtener la cantidad de medicinas registradas
    function getMedicationCount() public view returns (uint256) {
        return medications.length;
    }

    // Función para obtener una medicina por su índice
    function getMedication(uint256 _index) public view returns (string memory, uint256, string memory, string memory) {
        require(_index < medications.length, "Index out of range");
        Medication memory med = medications[_index];
        return (med.name, med.quantity, med.location, med.action);
    }
}