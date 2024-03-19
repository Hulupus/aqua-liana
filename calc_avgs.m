%% Calc Avgs

% Clear variables and figures
clear;

% Collect newest data
% pyrunfile('data-saver.py');

% Load in datatables
table_romeo = readtable("./data/romeo_data.csv", "VariableNamingRule","preserve");
table_golf = readtable("./data/golf_data.csv", "VariableNamingRule","preserve");
table_papa = readtable("./data/papa_data.csv", "VariableNamingRule","preserve");

romeo_data = clean(table_romeo);
golf_data = clean(table_golf);
papa_data = clean(table_papa);

dataset = romeo_data;
param = "electric conductivity";

start_date = datetime(2023, 11, 24);
end_date = datetime(2024, 12, 13);

avg = calculate_average(dataset, param, start_date, end_date);
avg
