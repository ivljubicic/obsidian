# Available options
![[tcpdump_options.png]]
- D
	- display available interfaces available for capturing
- i (interface)
	- choose and interface to capture from
- n[n]
	- dont resolve host names
	- the other **n** is optional
		- dont resolve well known ports
- e
	- include **ethernet** headers
	- include source MAC adress od the host
- X[X]
	- interpret anything that is in clear text
	- using XX is the same as using Xe
- v[v]
	- include additional data, like ttl, offset
- l
	- line readable output
	- for sending to other files
- w/r
	- writing and reading to a file
# Flags
- \[.] se interpretira kao SYN FLAG