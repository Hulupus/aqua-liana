function avg = calculate_average(table, param, startDate, endDate)
    % Extrahieren Sie die Zeilen zwischen den angegebenen Zeitpunkten
    time_range = table(table.datetime >= startDate & table.datetime <= endDate, :);
    time_range(end, 1)
    time_range(1, 1)
    % Berechnen Sie den Durchschnitt der Werte in diesem Zeitraum
    avg = mean(time_range.(param));
end
