function day_range = days_between(date1, date2)
d = between(date1, date2, 'days');
day_range = caldays(d);
end