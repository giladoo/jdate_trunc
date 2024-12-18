-- File: jdate_trunc--1.0.sql

-- Ensure PL/Python is installed
DO $$ BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM pg_language WHERE lanname = 'plpython3u'
    ) THEN
        CREATE LANGUAGE plpython3u;
    END IF;
END $$;

-- Create the function
CREATE OR REPLACE FUNCTION jdate_trunc(variable text, date_value timestamp without time zone)
    RETURNS  timestamp without time zone
AS $$
import jdatetime
from datetime import datetime, timedelta
quarter_list = [1, 4, 7, 10]
date_value_d = datetime.strptime(date_value, '%Y-%m-%d %H:%M:%S')
jdate_value = jdatetime.datetime.fromgregorian(datetime=date_value_d) 
jdate_value_d = jdate_value
j_year = jdate_value.year
j_month = jdate_value.month
j_day = jdate_value.day
j_hour = jdate_value.hour
j_minute = jdate_value.minute
j_second = jdate_value.second
if variable == 'year':
    jdate_value_d = jdatetime.datetime(j_year, 1, 1, 0, 0)
elif variable == 'quarter':
    jdate_value_d = jdatetime.datetime(j_year, quarter_list[(j_month - 1) // 3], 1, 0, 0, 0)
elif variable == 'month':
    jdate_value_d = jdatetime.datetime(j_year, j_month, 1, 0, 0, 0)
elif variable == 'week':
    jdate_value_d = jdatetime.datetime(j_year, j_month, j_day, 0, 0, 0) - timedelta(days=jdate_value.weekday())
elif variable == 'day':
    jdate_value_d = jdatetime.datetime(j_year, j_month, j_day, 0, 0, 0)
elif variable == 'hour':
    jdate_value_d = jdatetime.datetime(j_year, j_month, j_day, j_hour, 0, 0)
elif variable == 'minute':
    jdate_value_d = jdatetime.datetime(j_year, j_month, j_day, j_hour, j_minute, 0)
elif variable == 'second':
    jdate_value_d = jdatetime.datetime(j_year, j_month, j_day, j_hour, j_minute, j_second)

return jdate_value_d.togregorian() 
$$ LANGUAGE plpython3u;

