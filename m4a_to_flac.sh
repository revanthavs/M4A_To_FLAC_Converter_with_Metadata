#!/bin/bash

# Step 1: Extract cover artwork from all .m4a files
echo "Step 1: Extracting cover artwork from .m4a files..."
for m4a_file in *.m4a; do
    # Extract the base name (without extension)
    base_name="${m4a_file%.m4a}"
    
    # Extract cover artwork using ffmpeg
    ffmpeg -i "$m4a_file" -an -vcodec copy "${base_name}.jpg"
    
    echo "Cover artwork extracted for: $m4a_file"
done

# Step 2: Convert .m4a files to .flac and embed artwork during conversion
echo "Step 2: Converting .m4a to .flac with cover artwork..."
for m4a_file in *.m4a; do
    # Extract the base name (without extension)
    base_name="${m4a_file%.m4a}"
    
    # Convert .m4a to .flac and add cover art
    ffmpeg -i "$m4a_file" -i "${base_name}.jpg" -map 0:a -map 1 -c:a flac -metadata:s:v title="Album cover" -metadata:s:v comment="Cover (front)" "${base_name}.flac"
    
    echo "Conversion to FLAC complete with cover art for: $m4a_file"
done

# Step 3: Ensure FLAC files have correct cover art using metaflac
echo "Step 3: Adding cover artwork to .flac files using metaflac..."
for flac_file in *.flac; do
    # Extract the base name (without extension)
    base_name="${flac_file%.flac}"

    # Check if the corresponding .jpg file exists
    jpg_file="${base_name}.jpg"
    if [ -f "$jpg_file" ]; then
        echo "Adding cover art for: $flac_file"
        
        # Add cover art to the FLAC file using metaflac
        metaflac --import-picture-from="$jpg_file" "$flac_file"

        echo "Cover art added successfully for $flac_file"
    else
        echo "No cover art found for: $flac_file"
    fi
done

# Step 4: Delete all .jpg files after embedding them
echo "Step 4: Deleting all .jpg files..."
rm *.jpg

echo "Process complete! All .flac files have cover artwork, and .jpg files have been deleted."

