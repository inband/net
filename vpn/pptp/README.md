# pptp

[rfc2637](https://tools.ietf.org/html/rfc2637)

Point to point tunnelling protocol (pptp) uses:

 - port 1723
 - gre

The following was observed for a successful connection.


### TCP 3-way handshake
Client -> Server (1723) SYN

Client <- Server (1723) SYN ACK

Client -> Server (1723) ACK

### Control Message SCCRQ (Start Connection Control Reponse)
Client -> Server (1723) CTRL-MSG

Client <- Server (1723)  ACK

### Control Message SCCRP (Start Connection Control Reponse)
Client <- Server (1723) CTRL-MSG

Client -> Server (1723)  ACK

### Control Message OCRQ (Outgoing Call Request)
Client -> Server (1723) CTRL-MSG

Client <- Server (1723) ACK

### Control Message OCRP (Outgoing Call Response)
Client <- Server (1723) CTRL-MSG

Client -> Server (1723)  ACK

### Control Message SLI PEER_CALL_ID
Client -> Server (1723) CTRL-MSG

Client <- Server (1723) ACK


### GRE LCP
Client <- Server LCP, Conf-Request id 1

Client -> Server LCP, Conf-Request id 0

Client -> Server LCP, Conf-Ack id 1

Client <- Server LCP, Conf-Reject id 0

Client -> Server LCP, Conf-Request id 1

Client <- Server LCP, Conf-Ack id 1

Client <- Server LCP, Echo-Request id 0

### GRE CHAP
Client <- Server CHAP, Challenge id 55

### GRE LCP
Client -> Server LCP, Ident id 2

Client -> Server LCP, Ident id 3

Client -> Server LCP, Ident id 4

Client -> Server LCP, Echo-Reply id 0

### GRE CHAP
Client -> Server CHAP, Response id 55

### Control Message SLI PEER_CALL_ID
Client -> Server (1723) CTRL-MSG

Client <- Server (1723) ACK

### GRE CHAP
Client <- Server CHAP, Success id 55

### GRE CCP
Client <- Server CCP, Conf-Request id 1

Client -> Server IP6CP, Conf-Request id 5

Client -> Server CCP, Conf-Request id 6


### GRE LCP
Client <- Server LCP, Prot-Reject id 2 (IP6CP)

Client -> Server IPCP, Conf-Request id 7

Client -> Server CCP, Conf-Ack id 1

Client -> Server CCP, Conf-Nack id 6

Client <- Server IPCP, Term-Ack id 7

Client -> Server CCP, Conf-Request id 8

Client <- Server CCP, Conf-Ack id 8

Client <- Server IPCP, Conf-Request id 1

Client -> Server IPCP, Conf-Ack id 1

Client -> Server IPCP, Conf-Request id 9 **_request IP, DNS, NBNS**

Client <- Server IPCP, Conf-Reject id 9  **_reject NBNS**

Client -> Server IPCP, Conf-Request id 10 **_request IP, DNS**

Client <- Server IPCP, Conf-Nack id 10 **_nack gives out IP, DNS_**

Client -> Server IPCP, Conf-Request id 11 **_request IP, DNS that were in previous nack_**

Client <- Server IPCP, Conf-Ack id 11 **_accept**


### GRE Data flow
Client -> Server compressed PPP data

Client -> Server compressed PPP data

Client -> Server compressed PPP data

Client -> Server compressed PPP data

Client <- Server compressed PPP data

Client -> Server compressed PPP data

Client <- Server compressed PPP data



