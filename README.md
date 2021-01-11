# Ruby/Rails Developer Test - Call Centre API

## Overview

This project contains a small Ruby on Rails application to respond with call centre opening times for a particular day, and 
availability of support 'slots'.


## API Details

The API currently has one endpoint, `status` which accepts a date as a parameter and returns a structure confirming the 
date and indicating the first and last slots on that day, and the intervals between the slots.

### Example

##### Request:  
      /status/2020-08-25
    
##### Response:  
    {
        "date": "2020-08-25",
        "slots": {
          "first": "09:00",
          "last": "17:30"
        },
        "interval": "00:30"
    }

---

## Task

Add another endpoint which will allow clients to request a slot.  The payload should specify the date and the desired 
time (it is up to you to design exact format of the payload).  The response should give the date and time of a 
next available slot after the specified time, bearing in mind the working hours of the call centre and the interval
between each slot.  Again it is up to you to design the format of the response, so that it contains all the information 
and is easily machine readable.

### Examples:

* Requested time 10:45 on a Tuesday, the response should specify 11:00 on Tuesday
* Requested time is 17:45 on a Tuesday, the response should specify 09:00 on Wednesday 


### Additional tasks:

* Change the interval of each slot to 45 minutes.
* Discuss how you would implement a facility to record booked slots, and allow the client to delete slots 
that it had previously reserved.
