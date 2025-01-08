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
CREATE OR REPLACE FUNCTION jdate_trunc(variable TEXT, date_value TIMESTAMP WITHOUT TIME ZONE)
RETURNS  TIMESTAMP WITHOUT TIME ZONE
AS $$
res = None
if date_value != None:
    from jdatetimext import j_start
    try:
        res = j_start(variable, date_value)
        res = res if res else None
    except Exception as e:
        res = date_value
return res
$$ LANGUAGE plpython3u;











