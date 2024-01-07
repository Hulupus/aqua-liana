function mark_weekends(dates, data)
%MARK_WEEKENDS: Gives all Weekends a colored background

first_date = dates(1,1);
day_range = days_between(first_date, dates(end,1));
t_now = first_date;
t_next = dateshift(t_now, 'start', 'day', 'next');

while day_range >= days_between(first_date, t_next)
    if (isSaturday(t_now))
        draw_rectangle(t_now, dateshift(t_next, 'start', 'day', 'next'), min(data), max(data), [1, 0.894, 0.882])
    end
    t_now = t_next;
    t_next = dateshift(t_next, 'start', 'day', 'next');
end
end

% Alternative: Color only Lines
% watchedDates = timerange(t_now, dateshift(t_next, 'start', 'day', 'next'), "closed");
% watchedDatesData = romeo_data(watchedDates,:);
% plot(timetable2table(watchedDatesData), "datetime", "temperature");
% hold on;

%% Util Functions

function boolean = isSaturday(date)

boolean = weekday(date) == 7;

end