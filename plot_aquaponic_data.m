%% Plot Aquaponik Data
% Author: Hulupus
% Last Changed: 2024-01-06

% Clear variables and figures
clear, clf;

% Collect newest data
% pyrunfile('data-saver.py');

% Load in datatables
table_romeo = readtable("./data/romeo_data.csv", "VariableNamingRule","preserve");
table_golf = readtable("./data/golf_data.csv", "VariableNamingRule","preserve");
table_papa = readtable("./data/papa_data.csv", "VariableNamingRule","preserve");

table_flip_romeo = readtable("./data/fliped_ph_romeo.csv", "VariableNamingRule","preserve");

% data-fragments
table_golf1 = readtable("data\Datensplitter\golf_data1.csv", "VariableNamingRule","preserve");
table_golf2 = readtable("data\Datensplitter\golf_data2.csv", "VariableNamingRule","preserve");
table_golf3= readtable("data\Datensplitter\golf_data3.csv", "VariableNamingRule","preserve");

%% Clean data

romeo_data = clean(table_romeo);
romeo_flip_data = clean(table_flip_romeo);
golf_data = clean(table_golf);
papa_data = clean(table_papa);

%% Pick Data and Dates
% Change Values here to choose what you want to plot

dataset = table_golf;           % Choose between romeo_data or table_golf
param = "co2content";           % Choose Parameter (temperature, pH, electric conductivity) or (temperatur, co2content)

dates = dataset.datetime;
main_data = dataset.(param);

secondary_data = table_papa;    % If you chose table_golf, you can add table_papa here


firstDate = romeo_data.datetime(1,1);
lastDate = romeo_data.datetime(end, 1);
num = days_between(firstDate, lastDate);

%% Plot Color Weekends And Holidays

mark_weekends(dates, main_data)

draw_rectangle(datetime(2023, 12, 21), lastDate, min(main_data), max(main_data), [0.882, 1, 0.953])

%%


x = dateshift(firstDate, 'start', 'day') + days(0:num+1);
yyaxis right
xlabel('Zeit [Tage]')

%% Plot data
% 
ylabel('pOH')
plot(romeo_flip_data, "datetime", "pH", "Color", "#f0c066", "LineWidth", 1.5, "LineStyle", "-")
hold on;

plot([x; x], repmat(ylim', 1, numel(x)), 'r', "LineStyle",":", "LineWidth", 0.8, "Marker","none")
hold on;

yyaxis left
ylabel('CO2-Gehalt [ppm]')

% Temp
plot(table_golf1, "datetime", param, "Color", "#6c99bb", "LineWidth", 1.5, "LineStyle", "-")
hold on;
plot(table_golf2, "datetime", param, "Color", "#6c99bb", "LineWidth", 1.5, "LineStyle", "-")
hold on;
plot(table_golf3, "datetime", param, "Color", "#6c99bb", "LineWidth", 1.5, "LineStyle", "-")
hold on;
%

if (istable(secondary_data))
    plot(secondary_data, "datetime", param, "Color", "#99c066", "LineWidth", 1.5, "LineStyle", "-")
    hold on;
end

%% Plot datalines
% 
% firstDate = dates(1,1);
% lastDate = dates(end, 1);
% num = days_between(firstDate, lastDate);
% 
% x = dateshift(firstDate, 'start', 'day') + days(0:num+1);
% plot([x; x], repmat(ylim', 1, numel(x)), 'r', "LineStyle",":", "LineWidth", 0.8)
% 
% %% Plot Color Weekends And Holidays
% 
% mark_weekends(dates, main_data)
% 
% draw_rectangle(datetime(2023, 12, 21), lastDate, min(main_data), max(main_data), [0.882, 1, 0.953])

%% Unused Code

% Redundant

% Romeo
% plot(romeo_data, "datetime", "temperature", "Color", "#6c99bb", "LineWidth", 1.5)
% plot(romeo_data, "datetime", "pH", "Color", "#b05279", "LineWidth", 1.5)
% plot(romeo_data, "datetime", "electric conductivity", "Color", "#6c99bb", "LineWidth", 1.5)
% hold on;

% Lufticus
% plot(gold_data, "datetime", "temperature", "Color", "#b05279", "LineWidth", 1.5)
% hold on;
% plot(papa_data, "datetime", "temperature", "Color", "#b05279", "LineWidth", 1.5)
% hold on;
% plot(gold_data, "datetime", "co2content", "Color", "#6c99bb", "LineWidth", 1.5)
% hold on;
% plot(papa_data, "datetime", "co2content", "Color", "#f0c066", "LineWidth", 1.5)
% hold on;



% Romeo
% plot(table_romeo, "datetime", "temperature", "Color", "#6c99bb", "LineWidth", 1.5)
% plot(table_romeo, "datetime", "pH", "Color", "#b05279", "LineWidth", 1.5)
% plot(table_romeo, "datetime", "electric conductivity", "Color", "#6c99bb", "LineWidth", 1.5)
% hold on;

% Lufticus
% plot(table_golf, "datetime", "temperature", "Color", "#b05279", "LineWidth", 1.5)
% hold on;
% plot(table_papa, "datetime", "temperature", "Color", "#b05279", "LineWidth", 1.5)
% hold on;
% plot(table_golf, "datetime", "co2content", "Color", "#6c99bb", "LineWidth", 1.5)
% hold on;
% plot(table_papa, "datetime", "co2content", "Color", "#f0c066", "LineWidth", 1.5)
% hold on;


% Not Working Correctly

% %% XCorrelation
% % xcorr seems not to be right to corr
% 
% % Normalize
% [Crg, lagrg] = xcorr(table_romeo.temperature, table_golf.co2content);
% Crg = Crg/max(Crg);
% 
% [Mrg,Irg] = max(Crg);
% trg = lagrg(Irg);
% 
% subplot(3,1,1)
% plot(lagrg,Crg,[trg trg],[-0.5 1],'r:')
% 
% 
% %% Correlation test
% y = table_romeo.temperature - mean(table_romeo.temperature);
% y = y / max(abs(y));
% 
% plot(y)
% hold on;
% 
% y1 = table_golf.temperature - mean(table_golf.temperature);
% y1 = y1 / max(abs(y1));
% 
% plot(y1)
% 
% %y = y/max(abs(y));
