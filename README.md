# F9K1015-v1

This repo contains the last published firmware (Firmware 1.00.08) for the Belkin N300 Wi-Fi Range Extender (F9K1015 v1).

The source all belongs to Belkin. This is only provided for educational and research purposes.

# `binwalk` exctraction log:

`binwalk -eM F9K1015_WW_1.00.08.bin`

```
Scan Time:     2017-04-04 00:02:56
Target File:   /home/user/belkin/F9K1015_WW_1.00.08.bin
MD5 Checksum:  9bc811a6a092dea03217e0169cd92a28
Signatures:    374

DECIMAL       HEXADECIMAL     DESCRIPTION
--------------------------------------------------------------------------------
10264         0x2818          LZMA compressed data, properties: 0x5D, dictionary size: 8388608 bytes, uncompressed size: 2979024 bytes
1179648       0x120000        Squashfs filesystem, little endian, version 4.0, compression:lzma, size: 1107633 bytes, 389 inodes, blocksize: 131072 bytes, created: 1902-06-11 16:21:20


Scan Time:     2017-04-04 00:02:57
Target File:   /home/user/belkin/_F9K1015_WW_1.00.08.bin.extracted/2818
MD5 Checksum:  9a5f725f02b162011d080375e2cb0de0
Signatures:    374

DECIMAL       HEXADECIMAL     DESCRIPTION
--------------------------------------------------------------------------------
2461728       0x259020        Linux kernel version "2.6.30.9 (root@localhost.localdomain) (gcc version 4.4.5-1.5.5p2 (GCC) ) #67 Wed Feb 11 11:41:26 CST 2015"
2604819       0x27BF13        Neighborly text, "neighbor %.2x%.2x.%.2x:%.2x:%.2x:%.2x:%.2x:%.2x lost on port %d(%s)(%s)"
```


# Using `binwalk` to identify the CPU architecture of a file using the capstone disassembler:

`binwalk -Y F9K1015_WW_1.00.08.bin`

```
DECIMAL       HEXADECIMAL     DESCRIPTION
--------------------------------------------------------------------------------
0             0x0             MIPS executable code, 32/64-bit, big endian, at least 1250 valid instructions
```
