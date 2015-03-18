<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

include_once("model/Model.php");

class Controller {

    public $model;

    public function __construct() {
        $this->model = new Model();
    }

    public function invoke() {
        $action = isset($_REQUEST['action']) ? $_REQUEST['action'] : "list";
        $id = isset($_REQUEST['id']) ? $_REQUEST['id'] : "0";
        $order = isset($_GET['order']) ? $_REQUEST['order'] : "idosoba";
        $nadpis = "Seznam osob";
        
        if ($action == "list") {
            $people = $this->model->getPersonList($order);
            include "view/listPerson.php";
        }

        if ($action == "view") {
            $nadpis = "Osobní údaje";
            $person = $this->model->getPerson($id);
            include "view/viewPerson.php";
        }

        if ($action == "delete") {
            if ($q = $this->model->deletePerson($id)) {
                $hlaska = "Osoba byla vymazána.";
            } else {
                $hlaska = "Osobu se nepodarilo smazat.";
            }
            $people = $this->model->getPersonList($order);
            include "view/listPerson.php";
        }

        if ($action == "insert") {
            if (!$_POST) {
                $nadpis = "Přidání osoby";
                $person = array(
                    "prijmeni" => "",
                    "jmeno" => "",
                    "rodne_cislo" => "",
                    "pohlavi" => "",
                    "telefon" => "",
                    "mail" => "",
                    "ulice" => "",
                    "cislo" => "",
                    "mesto_psc" => ""
                );
                include 'view/formPerson.php';
            } else {
                $person = array(
                    "prijmeni" => $_POST["prijmeni"],
                    "jmeno" => $_POST["jmeno"],
                    "rodne_cislo" => $_POST["rodne_cislo"],
                    "pohlavi" => $_POST["pohlavi"],
                    "telefon" => $_POST["telefon"],
                    "mail" => $_POST["mail"],
                    "ulice" => $_POST["ulice"],
                    "cislo" => $_POST["cislo"],
                    "mesto_psc" => $_POST["mesto_psc"]
                );
                if($q = $this->model->insertPerson($person)){
                    $hlaska = "Záznam byl uspěšně přidán.";
                }else{
                    $hlaska = "Chyba: Záznam se nepodařilo přidat.";
                }
                $people = $this->model->getPersonList($order);
                include 'view/listPerson.php';
            }
        }
        if($action == "update"){
            
        }
    }

}


