-- File: jdate_trunc--1.0.sql

-- Ensure PL/Python is installed
DO $$ BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM pg_language WHERE lanname = 'plpython3u'
    ) THEN
        CREATE LANGUAGE plpython3u;
    END IF;
END $$;

-- Create jdate_trunc function
CREATE OR REPLACE FUNCTION jdate_trunc(variable text, date_value timestamp without time zone)
  RETURNS timestamp without time zone
AS $$
	import datetime
	from jdatetimext import j_start
    # '2024-10-26 23:00:14.623396' -> '2024-10-26 23:00:14'
	if type(date_value) == str:
		s_date_value = date_value.split('.', 1)[0]
    else:
		s_date_value = date_value
	try:
		res = j_start(variable, s_date_value)
	except Exception as e:
		res = e
	return res

$$ LANGUAGE plpython3u;
