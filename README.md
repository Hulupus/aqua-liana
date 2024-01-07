# Projekt Aqua Liana

Matlab Code zur Erstellung und Anpassung von Diagrammen aus Messdaten einer Aquaponik-Anlage in einem Schulklassenraum.

### Hauptdokument: plot_aquaponic_data.m

### Reine Daten: (Ordner: **data**)
- romeo.csv (Wasserdaten)
- golf.csv (Luftdaten)
- papa.csv (Luftdaten)

### Erstellte Diagramme:

#### Wasserdatendiagramme:
- pH - Zeit Normal Plot.png
- Wassertemperatur - Zeit Normal Plot.png
- Leitfähigkeit - Zeit Normal Plot.png

#### Luftdatendiagramme:
- Graphen\Raumtemperatur - Zeit Normal Plot.png
- RaumCO2Gehalt - Zeit Normal Plot.png

##### Legende:
- Blau: Primärer Datensatz
- Gelb: Sekundärer Datensatz
- Rote Linien: Tagesabschnitte
- Rote Flächen: Wochenenden
- Grüne Flächen: Ferien

### Genutzte, eigene Funktionen:
- clean.m (Säubern der Daten anhand [der Matlab Dokumentation](matlab_docs_cleaning))
- days_between.m (Berechnen der Tage zwischen zwei Daten)
- draw_rectangle.m (Zeichne ein farbiges Rechteck im angegebenen Bereich)
- mark_weekends.m (Markiere alle Wochenenden im angegebenen Datensatz)

[matlab_docs_cleaning]: (https://de.mathworks.com/discovery/data-cleaning.html#why-it-matters)
