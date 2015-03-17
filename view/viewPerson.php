<html>  
    <?php include "lib/head.php" ?> 
    <body>
        <div class="container">
            <div class="col-sm-12">
                <h1><?php echo $nadpis; ?></h1>
                <h2><?= $person['prijmeni'] ?> <?= $person['jmeno'] ?></h2>
                <p>Rodné číslo: <?= $person['rodne_cislo'] ?></p>
                <p>Pohlaví: <?= $person['pohlavi'] ?></p>
                <p>Bydliště: <?= $person['mesto_psc'] ?> <?= $person['ulice'] ?> <?= $person['cislo'] ?></p>
                <p>Telefon: <?= $person['telefon'] ?></p>
                <p>E-mail: <?= $person['mail'] ?></p>
                <p><a href="index.php">Zpět na seznam</a></p>
            </div>
        </div>
    </body>  
</html>  