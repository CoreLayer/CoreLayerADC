# CoreLayer for HTTP/SSL
## Introduction

Content-Switching policies are one of the first set of policies to be evaluate. Although responder is preceding content-switching, the actual decision on which target load-balancing virtual server will be used, is taken before the responder policies are evaluated.

This allows CoreLayer to implement some logic ahead of the actual content-switching actions through responder.

When the content-switching policies have run, the responder policies are evaluated. This set of policies is run through the policy label RSPL\_CL01\_00\_HTTP\_REQ, and provides with the following features:
- Debugging the request/response through the different modules of CoreLayer
- IPv4/IPv6 whitelisting and blacklisting
- Maintenance messages/actions
- Unexpected service downtime messages/actions
- Redirects
- Firewall-like drop/rest actions

Finally, on the request and response paths, a set of rewrite policies are triggered through the rewrite policiy labels RWPL\_CL01\_00\_HTTP\_REQ and RWPL\_CL01\_00\_HTTP\_RES.

All these policies are controlled through a set of stringmaps and pattern sets, which allow an administrator to control the behavior through settings instead of having to define policies time and again.

## Content-Switching

To activate CoreLayer, an administrator must create a new content-switching policy for each and every content-switching virtual server. Citrix ADC (NetScaler) does not allow for a content-switching policy to be reused across different content-switching virtual servers if it is not defined with a content-switching action.

In the case of CoreLayer, the content-switching policy needs to trigger the content-switching policy label CSPL\_CL01\_00\_HTTP\_REQ. To allow for correct processing, a default load-balancing virtual server must be bound to the content-switching virtual server as well

When installing CoreLayer, some demo object are created to serve as an example:

```
# HTTP
add cs policy CSP_CL01_00_DEMO_HTTP -rule q{true}

 add cs vserver CS_CL01_00_DEMO_HTTP HTTP 169.254.254.1 80
bind cs vserver CS_CL01_00_DEMO_HTTP -lbvserver VS_CL01_00_DEFAULT_HTTP
bind cs vserver CS_CL01_00_DEMO_HTTP -policyName CSP_CL01_00_DEMO_HTTP -priority 101 -invoke policylabel CSPL_CL01_00_HTTP_REQ
bind cs vserver CS_CL01_00_DEMO_HTTP -policyName RSP_CL01_00_HTTP_REQ -priority 101 -gotoPriorityExpression NEXT -type REQUEST -invoke policylabel RSPL_CL01_00_HTTP_REQ


# SSL
add cs policy CSP_CL01_00_DEMO_SSL -rule q{true}

 add cs vserver CS_CL01_00_DEMO_SSL SSL 169.254.254.1 443
bind cs vserver CS_CL01_00_DEMO_SSL -lbvserver VS_CL01_00_DEFAULT_HTTP
bind cs vserver CS_CL01_00_DEMO_SSL -policyName CSP_CL01_00_DEMO_SSL -priority 101 -invoke policylabel CSPL_CL01_00_HTTP_REQ
bind cs vserver CS_CL01_00_DEMO_SSL -policyName RSP_CL01_00_HTTP_REQ -priority 101 -gotoPriorityExpression NEXT -type REQUEST -invoke policylabel RSPL_CL01_00_HTTP_REQ
```

### CSPL\_CL01\_00\_HTTP\_REQ

![CSPL_CL01_00_HTTP_REQ](./svg/CL01_00_HTTP/CSPL_CL01_00_HTTP_REQ.svg "CSPL_CL01_00_HTTP_REQ")

#### CSP\_CL01\_00\_HTTP\_NOT\_CONFIGURED
##### Conditions
- The content-switching virtual server is configured in SM\_CL01\_00\_CS

AND

- The content-switching virtual server group to which the virtual server belongs, is configured in SM\_CL01\_00\_CSGROUP

##### Action
- Execute CSA\_CL01\_00\_HTTP\_NOT\_CONFIGURED

#### CSP\_CL01\_00\_HTTP\_GO\_IPV4
##### Conditions
- Client has an IPv4 address

##### Action
- Invoke content-switching policy label CSPL\_CL01\_00\_HTTP\_IPV4

#### CSP\_CL01\_00\_HTTP\_GO\_IPV6
##### Conditions
- Client has an IPv6 address

##### Action
- Invoke content-switching policy label CSPL\_CL01\_00\_HTTP\_IPV4

#### CSP\_CL01\_00\_HTTP\_GO\_ZONE\_ANY
##### Conditions
- None

##### Action
- Invoke content-switching policy label CSPL\_CL01\_00\_HTTP\_ANY

### CSPL\_CL01\_00\_HTTP\_IPV4 / CSPL\_CL01\_00\_HTTP\_IPV6
#### Overview
##### IPv4
![CSPL\_CL01\_00\_HTTP\_IPV4](./svg/CL01_00_HTTP/CSPL_CL01_00_HTTP_IPV4.svg "CSPL_CL01_00_HTTP_IPV4")
##### IPv6
![CSPL\_CL01\_00\_HTTP\_IPV6](./svg/CL01_00_HTTP/CSPL_CL01_00_HTTP_IPV6.svg "CSPL_CL01_00_HTTP_IPV6")

#### CSP\_CL01\_00\_HTTP\_IPV4\_GO\_CHECK\_ZONE\_FIX
##### Conditions
- The zone FIX has been enabled in the configuration for the content-switching virtual server

OR

- The zone FIX has been enabled in the configuration for the content-switching group to which the content-switching virtual server belongs

##### Action
- Invoke the content-switching policy label CSPL_CL01_00_HTTP_IPV4_CHECK_ZONE_FIX / CSPL_CL01_00_HTTP_IPV6_CHECK_ZONE_FIX