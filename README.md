# pcap-to-hc22000 Converter Script

This script is designed to help convert `.pcap` files to `.hc22000` files using the `hcxpcapngtool` utility. While this functionality probably already exists in some form, I created this script specifically for my use case.

## Features
- Converts all `.pcap` files in a given directory to `.hc22000` files.
- Organizes converted files into a new folder based on the current date.
- Combines all `.hc22000` files into a single file for easy usage with `hashcat`.

## Requirements
- `hcxpcapngtool`: This tool must be installed on your system. You can get it from the [official HCX GitHub page](https://github.com/ZerBea/hcxtools).
- Linux-based system or WSL for Windows

## Installation & Usage

```bash
git clone https://github.com/bencordeiro/pcap2hashcat.git
cd pcap2hashcat
echo edit directories accordingly
sleep 3
nano convert2hc.sh
chmod +x convert2hc.sh
./convert2hc.sh
