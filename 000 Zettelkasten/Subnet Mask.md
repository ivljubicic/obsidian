# Subnet Mask
- tells which bits are the ==network part== and which are the ==host part== 
- example 255.255.255.0
	- this tell you that ==only the last octet changes in a sub network==
	- every IP that has the same first 3 octet belongs to the same network
		- analog for a different subnet mask

## CIDR
- replaces the subnet mask with a number
- the number tells how many bits belong to the network address
- ==example==
	- a subnet mask of 255.255.255.0 would be the same as writing /24
	- final IP
		- 192.168.10.39/24