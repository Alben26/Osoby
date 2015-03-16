<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

include_once("model/Osoba.php");

class Model {

    private $listOfRecords;

    public function getPersonList($order) {
        $sql = "SELECT * FROM osoba ORDER BY $order";
        $this->listOfRecords = Database::queryArray($sql);
        if (!sizeof($this->listOfRecords)) {
            throw new Exception("Tabulka neobsahuje záznam");
        }
        return $this->listOfRecords;
    }

    public function getPerson($id) {
        $sql = "SELECT * FROM film WHERE idfilmy=?";
        $people = Database::queryArray($sql, array($id));
        return $people[0];
    }

    public function deletePerson($id) {
        $sql = "DELETE FROM osoba WHERE idosoba=?";
        return Database::query($sql, array($id));
    }

    public function insertPerson($data) {
        $sql = "INSERT INTO osoba SET prijmeni=:prijmeni, jmeno=:jmeno, rodne_cislo=:rodne_cislo,"
                . "pohlavi=:pohlavi, ulice=:ulice, cislo=:cislo, telefon=:telefon, mail=:mail, mesto_psc:mesto_psc";
        return Database::query($sql, $data);
    }
    
    public function updatePerson($data) {
        $sql = "UPDATE osoba SET prijmeni=:prijmeni, jmeno=:jmeno, rodne_cislo=:rodne_cislo,"
                . "pohlavi=:pohlavi, ulice=:ulice, cislo=:cislo, telefon=:telefon, mail=:mail, mesto_psc:mesto_psc";
        return Database::query($sql, $data);
    }
}
