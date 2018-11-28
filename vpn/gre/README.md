# GRE and PPP

### GRE - Generic Routing Encapsultaion [rfc1701](https://tools.ietf.org/html/rfc1701)

See [rfc2637](https://tools.ietf.org/html/rfc2637#section-4.1) for PPTP's Enhanced GRE header.

GRE Header encapsulates a Payload Packet.  GRE is encapsulated within Delivery Header.

IP Delivery Header | GRE | Payload

GRE Header is 4-Bytes but can have up to 16 additional "optional" Bytes.

Optional headers include:

 - Checksum (2-Bytes)
 - Key Payload Length (2-Bytes)
 - Key Call ID (2-Bytes)
 - Sequence Number (4-Bytes)
 - Acknowledgement Number (4-Bytes)

Flags bits in the 4-Byte GRE Header determine whether an optional flag is included.

The following packets are 58-Bytes:
 - 20-Bytes IP Delivery Header
 - 16-Bytes GRE (4-Bytes GRE, 12-Bytes Flags [key present, sequence# present, ack present] )
 - 2-Bytes missing ???
 - LCP 20-Bytes (includes 2-Bytes PPP)



```
10:44:04.249451 IP (tos 0x0, ttl 123, id 19446, offset 0, flags [none], proto GRE (47), length 58)
    41.0.0.5 > 42.0.3.3: GREv1, Flags [key present, sequence# present, ack present], call 17792, seq 2, ack 1, length 38
        LCP, Conf-Request (0x01), id 1, length 20
        encoded length 18 (=Option(s) length 14)
          MRU Option (0x01), length 4: 1400
          Magic-Num Option (0x05), length 6: 0x6f292de5
          PFC Option (0x07), length 2
          ACFC Option (0x08), length 2
10:44:04.251736 IP (tos 0x0, ttl 64, id 22475, offset 0, flags [DF], proto GRE (47), length 58)
    42.0.3.3 > 41.0.0.5: GREv1, Flags [key present, sequence# present, ack present], call 58490, seq 2, ack 2, length 38
        LCP, Conf-Ack (0x02), id 1, length 20
        encoded length 18 (=Option(s) length 14)
          MRU Option (0x01), length 4: 1400
          Magic-Num Option (0x05), length 6: 0x6f292de5
          PFC Option (0x07), length 2
          ACFC Option (0x08), length 2
```



The following packet is 63-Bytes:
 - 20-Bytes IP Delivery Header
 - 12-Bytes GRE (4-Bytes GRE, 8-Bytes Flags [key present, sequence# present] )
 - LCP 31-Bytes (includes 2-Bytes PPP)

```
10:44:04.286357 IP (tos 0x0, ttl 123, id 19448, offset 0, flags [none], proto GRE (47), length 63)
    41.0.0.5 > 42.0.3.3: GREv1, Flags [key present, sequence# present], call 17792, seq 4, length 43
        LCP, Ident (0x0c), id 3, length 31
        encoded length 29 (=Option(s) length 25)
          Magic-Num 0x6f292de5
          Message
            PRODESK-2[|LCP]
```

### Point-to-Point Protocol [rfc1661](https://tools.ietf.org/html/rfc1661)
