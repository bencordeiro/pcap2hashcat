#!/bin/bash

# Define the input directory (where the .pcap files are located)
INPUT_DIR="/home/pi/handshakes"

# Define the output directory (create a folder with the current date)
OUTPUT_DIR="/home/pi/handshakes/$(date +%Y-%m-%d)"
mkdir -p "$OUTPUT_DIR"

# Loop through all .pcap files in the input directory
for pcap in "$INPUT_DIR"/*.pcap; do
    if [ -f "$pcap" ]; then
        # Get the base name of the pcap file without the extension
        base_name=$(basename "$pcap" .pcap)

        # Run hcxpcapngtool to convert the pcap to .hc22000 with the same base name
        echo "Processing file: $pcap"
        hcxpcapngtool "$pcap" -o "$OUTPUT_DIR/${base_name}.hc22000"

        echo "Converted: $pcap to $OUTPUT_DIR/${base_name}.hc22000"
    else
        echo "No .pcap files found in $INPUT_DIR."
    fi
done

# Combine all .hc22000 files into one final file
echo "Combining all .hc22000 files into dump.hc22000"
cat "$OUTPUT_DIR"/*.hc22000 > "$OUTPUT_DIR/dump.hc22000"

echo "All conversions completed. Combined file saved as: $OUTPUT_DIR/dump.hc22000"

