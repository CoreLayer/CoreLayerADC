# Stringmaps
## Overview
Stringmaps are key-value stores in Citrix ADC, which can be used in policy expressions.
All functionality in the framework is configured through a set of stringmaps; each with their own composite key and value fields.

Fields within the key or value are separated using a semi-colon (;), field name and value are separated by an equal sign (=).

## PSM_ENDPOINT
### Usage
The Endpoint stringmap is used to configure the listen policies on content-switching virtual servers of type HTTP/SSL/TCP/SSL_TCP/UDP or load-balancing virtual server of type SSLBRIDGE.
Note that a load-balancing virtual server of type SSLBRIDGE will always have precedence over a content-switching virtual server of type SSL on the same combination of IP address and port.

The key is used to determine which virtual server will handle the current request by checking the combination of the destination IP address and the destination port of the request.

The value is used to determine if the virtual server is currently enabled and to check if a tenant has been configured and enabled for the endpoint.

### Key Fields
|Key|Value|
|-|-|
|vip|todo|
|port|todo|
|protocol|todo|

### Value Fields
|Key|Value|
|-|-|
|tenantid|todo|
|vsname|todo|
|state|todo|
