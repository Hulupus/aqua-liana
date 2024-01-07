function draw_rectangle(date1, date2, min, max, color)
x_region = [date1, date2, date2, date1];
y_region = [min, min, max, max];

h = patch(x_region, y_region, color, 'LineStyle','none');
hold on;

uistack(h, 'bottom');
end