# Docker compose for climatedata.ca portal

## Prerequisites
* Install docker-ce and docker-compose


## Steps to run
1. Clone climatedata-wp-theme repository in the current folder:
  
`git clone git@github.com:CanadianClimateDataPortal/climatedata-wp-theme.git`

or

`git clone https://github.com/CanadianClimateDataPortal/climatedata-wp-theme.git`

2. Run `./compose-wrapper.sh up -d`
3. **(Optional)** Add the following entry to your hosts file (/etc/hosts under Linux/macOS, 
  c:\windows\system32\drivers\etc under Windows). Make sure you replace the ip address with the appropriate one to 
  reach your Docker VM/instance. Note that this step is only required if the IP is not 127.0.0.1:

`1.2.3.4  dev-en.climatedata.ca dev-fr.climatedata.ca`

4. Browse to https://dev-en.climatedata.ca to reach your development instance, and
   https://dev-en.climatedata.ca/wp-admin to access WordPress administration.
   Username: **dev**, password: **climatedata**

Note: Since the theme files are not included within the docker image, you can develop directly from your git clone and
hit refresh in your browser to see the changes immediately

## Update docker image

Just run `./compose-wrapper.sh pull; ./compose-wrapper.sh up -d`

## Database cleanup

The database content of your development environment will persist even after pulling a more recent version 
of the docker images. If you want to delete your database volume to update the content, run:
`./compose-wrapper.sh down -v; ./compose-wrapper.sh up -d`

## Display PHP errors and warnings

You can enable or disable the PHP errors and warnings reporting using the following command: `set-log-reporting.sh <on|off>`

## Outbound SMTP

To be able to use an anonymous outbound SMTP server to test form submissions, create a file named override.yaml with the following content (where 1.2.3.4 is the IP address of the SMTP server):

```
version: "3.9"

services:
  portal:
    extra_hosts:
      - mail:1.2.3.4
```

To change the destination e-mail of the form submission, copy climatedata-wp-theme/climate-data-ca/default\_config.php to local_config.php and update its settings.
