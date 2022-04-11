# Vise smisla ima njih dodavati po use caseovima i objasnjavati taj use case as i go

# The playbook
[Host discovery strategies](https://nmap.org/book/host-discovery-strategies.html)
# Options 
- basic usage `nmap [switches] [host]`
	- `-p` tells you the port ranges; format `-p 31000-32000`
		- scan all of the ports `-p-`
		- scan most frequent ports `--top-ports=10`
		- or with `-F`
			- will scan top 100 ports
	- `-sS` stands for **stealthy**
		- just sends the `SYN` package and never establishes a TCP handshake
	- `-sT` full TCP connection (full 3 way handshake)
		- IDS can detect this
	- `-A` additional information about the host
		- uses `traceroute`, version and OS detection 
	- `T[0-4]` defines how fast it scans
		- default is `T3`
	- disable port scan
		- `-sn`
		- nmap automatically sends `ICMP Echo Requests`
			- you can force them with the flag `-PE` and ensure they are sent with the `--packet-trace` option
			- can be **disabled with `-Pn`**
			- disable DNS resolution
	- work with list of hosts
		- `-iL filename`
	- output to all formats
		- `-oA <name>`
			- creates new file named `name` and stores output in `.xml` format 
	- increase verbosity and other information
		- `--reason` specifies that we will be provided a reason **why a host is up**
		- **ARP** solely determines if the host is alive or not
			- will receive `arp-response`
		- you can forcibly **turn off ARP** with `--disable-arp-ping`

# Flags
- probably a good a idea to turn off ICMP echo request, DNS resolution and ARP `-Pn -n --disable-arp-ping`
	- `S` sync flag
	- `R` RST flag
	- `A` ACK flag

# Version discovery
- `-sV` flag

# Filtered port
- in some way unreachable
	- blocked by the firewall
		- `ICMP` reply with `type 3` and `error code 3`
	- dropped packets by the firewall
		- our client will sent **two TCP** packets with one taking **more time** both with the **SYN flag**
# Misc
- find out operating system using TTL
	- linux 64
	- win 128
	- https://w7cloud.com/nmap-commands/