function output_data = clean(input_data)
%% Clean Data Function

% Step 1: Fill missing data
filled_data = fillmissing(input_data,"previous");

% Step 2: Managing Outliers
% Convert to Timetable
timetable_data = table2timetable(filled_data);
% Remove duplicate sample points
[~, idx] = unique(timetable_data.datetime);
timetable_data = timetable_data(idx, :);
% Detect and replace outliers
trimmed_data = filloutliers(timetable_data, "previous");

% Step 3: Smoothing
smoothed_data = smoothdata(trimmed_data);

output_data = smoothed_data;
end