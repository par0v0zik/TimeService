TimeService is WEB service, providing functionality to get current date and time for various timesones, and based on time.jsontest.com service.

Here is the list of possible URIs:

- api/time
returns current date and time for Moscow timezone

- api/time/[timezone] 
returns current date and time for specified timezone, or error in case of invalid timezone declaration

- api/time/timezones 
returns the list of avaliable timezones

- api/time/timezones/[letter] 
returns the list of avaliable timezones, filtered by first letter