# jdate_trunc

# Installation
### Prerequisites
1. You need to have installed python3.9 or later version
2. You need to have installed jdatetimext pypi package

### Install
1. Download the jdate_trunc package.
- `sudo git clone -b 15 https://github.com/giladoo/jdate_trunc.git`
2. Open the directory
3. `cd jdate_trunc`
4. Install the extension
5. `sudo sh install.sh`
6. Login to the postgres account
    `sudo su postgres`
7. Run create_extension:
   `sh create_extension.sh  odoo_18_2`

### Test

`SELECT jdate_trunc('year', Date('2024-10-10'));`
SELECT jdate_trunc('year', Date('2024-10-10'))
### Ongoing activities:
1. install.sh needed to be fixed; 
2. create_extension.sh needed to be fixed

