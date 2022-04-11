| Characteristic             | TCP                 | UDP                             |
| -------------------------- | ------------------- | ------------------------------- |
| `Transmission`             | Connection-oriented | Connectionless. Fire and forget |
| `Connection Establishment` |                     |                                 |
|                            |                     |                                 |

# TCP
## Three way handshake
1. client sends a packet with the `SYN` flag
	- both ends agree on a sequence of numbers to start communicating with
	- other things can be also be negotiated in this phase
		- like window size, maximum segment size, and selective acknowledgments
2. the server sends a packet with the `SYN` flag with the negotiated sequence of numbers and with the `ACK` flag to acknowledge the previous packet
	- the server also includes any changes to the TCP options in the TCP header
3. the client responds with a TCP packet  with an `ACK` flag

### Terminating the connection
- the order is reversed
	- and the flag that is used is `FIN`
	- the client says that the connection should be terminated

# HTTP
- transfer data in clear text using TCP
- uses ports
	- 80 and 8000

## Methods
- only 2 required methods
	- `HEAD` and `GET`
- difference between PUT and POST

## HTTPS
- uses TLS or SSL, ==TLS handshake==
	- 
- uses different ports than HTTP
	- 443 and 8443

# FTP
