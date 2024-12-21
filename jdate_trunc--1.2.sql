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
    RETURNS  timestamp without time zone
AS $$
# It will return the same date_value if jdatetimext has not installed

import pip
try:
    from jdatetimext import jdatetrunc
except:
    pip.main(['install', 'jdatetimext'])

try:
    from jdatetimext import jdate_trunc
    res = jdate_trunc(variable, date_value)
except:
    res = date_value
return res
$$ LANGUAGE plpython3u;

