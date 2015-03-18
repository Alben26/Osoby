<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>  
    <?php include "lib/head.php" ?> 
    <body>  
        <div class="container">
            <div class="col-sm-12">
                <h1><?php echo $nadpis; ?></h1>
                <?php
                if (isset($hlaska)) {
                    echo "<div class=\"bg-warning\">Hláška: $hlaska</div>";
                }
                ?>
                <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="post" accept-charset="UTF-8" class="form-horizontal">
                    <?php if (!empty($person['idosoba'])): ?>
                        <input type="hidden" name="idosoba" value="<?= $person['idosoba'] ?>">
                    <?php endif; ?>
                    <div class="form-group">    
                        <label for="prijmeni" class="control-label col-sm-2">Příjmení:</label>
                        <div class="col-sm-3">
                            <input type="text" class="form-control" name="prijmeni" id="prijmeni" value="<?= $person['prijmeni'] ?>" 
                                   placeholder="Příjmení" autofocus required>
                        </div>
                    </div>
                    <div class="form-group"> 
                        <label for="jmeno" class="control-label col-sm-2">Jméno:</label>
                        <div class="col-sm-3">
                            <input type="text" class="form-control" name="jmeno" id="prijmeni" value="<?= $person['jmeno'] ?>" 
                                   placeholder="Křestní jméno" autofocus required>
                        </div>
                    </div>
                    <div class="form-group">    
                        <label for="rc" class="control-label col-sm-2">Rodné číslo:</label>
                        <div class="col-sm-3">
                            <input type="text" class="form-control" name="rc" id="rc" value="<?= $person['rodne_cislo'] ?>" 
                                   placeholder="123456/7890" autofocus required>
                        </div>
                    </div>
                    <div class="form-group">    
                        <label class="control-label col-sm-2">Pohlaví:</label>
                        <div class="col-sm-3">
                            <label class="radio-inline">
                                <input type="radio" name="format" id="muz" value="Muž" <?php if ($person['pohlavi'] == "Muž") echo " checked"; ?>>
                                Muž
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="format" id="zena" value="Žena" <?php if ($person['pohlavi'] == "Žena") echo " checked"; ?>>
                                Žena
                            </label>
                        </div><!-- /.col-lg-6 -->
                    </div>
                    <div class="form-group">    
                        <label for="tel" class="control-label col-sm-2">Telefon:</label>
                        <div class="col-sm-3">
                            <input type="text" class="form-control" name="tel" id="tel" value="<?= $person['telefon'] ?>" 
                                   placeholder="123 456 789" autofocus required>
                        </div>
                    </div>
                    <div class="form-group">    
                        <label for="mail" class="control-label col-sm-2">E-mail:</label>
                        <div class="col-sm-3">
                            <input type="text" class="form-control" name="mail" id="mail" value="<?= $person['mail'] ?>" 
                                   placeholder="example@example.com" autofocus>
                        </div>
                    </div>
                    <div class="form-group">    
                        <label for="ulice" class="control-label col-sm-2">Ulice:</label>
                        <div class="col-sm-3">
                            <input type="text" class="form-control" name="ulice" id="ulice" value="<?= $person['ulice'] ?>" 
                                   placeholder="Název ulice" autofocus required>
                        </div>
                    </div>
                    <div class="form-group">    
                        <label for="cislo" class="control-label col-sm-2">Číslo domu:</label>
                        <div class="col-sm-3">
                            <input type="number" class="form-control" name="cislo" id="cislo" min="1" max="999" value="<?= $person['cislo'] ?>" 
                                   placeholder="Číslo domu" autofocus required>
                        </div>
                    </div>
                    <div class="form-group">    
                        <label for="psc" class="control-label col-sm-2">PSČ:</label>
                        <div class="col-sm-3">
                            <input type="text" class="form-control" name="psc" id="psc" value="<?= $person['mesto_psc'] ?>" 
                                   placeholder="000 00" autofocus required>
                        </div>
                    </div>
                    <input type="hidden" name="action" value="<?= $action ?>">
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-3">
                            <button type="submit" class="btn btn-default" formvalidate>Submit</button>  
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </body>  
</html>  
