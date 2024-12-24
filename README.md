# jdate_trunc()
This PostgreSQL is required for [odoo_jalaali](https://github.com/giladoo/odoo_jalaali) odoo module to work.
In odoo grouping data based on date and datetime is using a built-in function of PostgreSQL which is date_trunc().
Same as that function, jdate_trunc() gets an interval and a datetime timestamp. Its job is to find the first day of the 
given interval. However, jdate_trunc() is using jalaali calendar as a reference.
Examples:
`SELECT jdate_trunc();`

`# this start of the run day, ex: 2024-10-24 00:00:00`

`SELECT jdate_trunc('year', Date('2024-10-24 09:23:40'));`

`# 2024-03-20 00:00:00`

```
SELECT create_date, jdate_trunc('month', create_date)
    FROM res_users
    WHERE id = 2;
```

`# 2023-02-14 08:41:38  2023-01-21 00:00:00`

# Installation
### Prerequisites
1. You need to have installed python3.9 or later version
2. You need to have installed jdatetimext pypi package

[jdatetimext on github.com](https://github.com/giladoo/jdatetimext)

[jdatetimext on pypi.com](https://pypi.org/project/jdatetimext/)
### Install
1. Download the jdate_trunc package.

    `sudo git clone -b 15 https://github.com/giladoo/jdate_trunc.git`

2. Open the directory

    `cd jdate_trunc`

3. Install the extension

    `sudo sh install.sh`

4. Login to the postgres account

    `sudo su postgres`

5. Run create_extension:

   `sh create_extension.sh  odoo_18_2`

### Test

`SELECT jdate_trunc('year', Date('2024-10-10'));`

`# 2024-03-20 00:00:00`

### Ongoing activities:
1. install.sh needed to be fixed; 
2. create_extension.sh needed to be fixed

