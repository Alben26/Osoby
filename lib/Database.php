<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
class Database {
    private static $connection;
    
    private static $configPDO = Array(
   
        PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
     
        PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES utf8"
    );
    
    public static function connect($host, $user, $password, $database) {
        
        if (!isset(self::$connection)) {     
            try {
              self::$connection = @new PDO(
                  "mysql:host=$host;dbname=$database",
                  $user,
                  $password,
                  
                  self::$configPDO
              );
            }
            catch (PDOException $e) {
              echo "<p>Chyba připojení k DB serveru</p>";
              die($e->getMessage());
            }
        }        
        return self::$connection;
    }
       
    public static function query($sql, $parameters = array()) {      
        try {
          $q = self::$connection->prepare($sql);
          
          @$q->execute($parameters);
          return $q;
        }
        catch (PDOException $e) {
           echo "<p>Chyba v dotazu SQL: $sql</p>";
           die($e->getMessage());
        }
    }
             
    public static function queryArray($sql, $parameters = array()) {       
        try {
          $q = self::$connection->prepare($sql);
          @$q->execute($parameters);
          return $q->fetchAll(PDO::FETCH_ASSOC);
        }
        catch (PDOException $e) {
           echo "<p>Chyba v dotazu SQL: $sql</p>";
           die($e->getMessage());
        }
    }
}
