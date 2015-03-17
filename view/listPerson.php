<html>  
    <?php include "lib/head.php" ?> 
    <body>  
        <div class="container">
            <div class="col-sm-12">
                <h1><?php echo $nadpis; ?></h1>
                <?php
                if (isset($hlaska))
                    echo "<div class=\"bg-warning\">Hláška: $hlaska</div>";
                ?>
                <table class="table table-striped table-hover">  
                    <thead>
                        <tr>
                            <th><a href="index.php?order=prijmeni+jmeno">Příjmení, Jméno</a></th>
                            <th><a href="index.php?order=rodne_cislo">Rodné číslo</a></th>
                            <!--<th><a href="index.php?order=pohlavi">Pohlaví</a></th>
                            <th><a href="index.php?order=telefon">Telefon</a></th>
                            <th><a href="index.php?order=mail">E-mail</a></th>
                            <th><a href="index.php?order=ulice">Ulice</a></th>
                            <th><a href="index.php?order=cislo">Číslo</a></th>
                            <th><a href="index.php?order=mesto_PSC">PSČ</a></th>-->
                            <th>Akce</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                        foreach ($people as $idosoba => $person):
                            ?>    
                            <tr>
                                <td><a href="index.php?action=view&id=<?= $person['idosoba'] ?>"><?= $person['prijmeni'] ?>, <?= $person['jmeno'] ?></a></td>
                                <td><?= $person['rodne_cislo'] ?></td>
                                <td><a href="index.php?action=delete&id=<?= $person['idosoba'] ?>">Smazat</a>&nbsp;
                                    <a href="index.php?action=update&id=<?= $person['idosoba'] ?>">Editovat</a>
                                </td>
                            </tr>
                            <?php
                        endforeach;
                        ?>
                    </tbody>
                </table> 
                <p><a href="index.php?action=insert">Nový záznam</a></p>
            </div>
        </div>
    </body>  
</html>  
