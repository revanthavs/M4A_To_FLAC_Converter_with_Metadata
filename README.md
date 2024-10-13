# M4A to FLAC Converter with Cover Artwork Embedding

This project is a simple bash script that automates the process of extracting cover artwork from `.m4a` files, converting them to `.flac` format, and embedding the extracted artwork into the `.flac` files. Additionally, the script cleans up the cover artwork files once the process is complete.

## Features
- Extracts cover artwork from `.m4a` files.
- Converts `.m4a` files to `.flac` format.
- Embeds the extracted cover artwork into the `.flac` files.
- Automatically deletes the temporary `.jpg` artwork files after the process.

## Requirements
The script uses the following tools:
- **ffmpeg**: for extracting cover artwork and converting files to `.flac`.
- **metaflac**: for embedding cover artwork into `.flac` files.

You can install these tools using [Homebrew](https://brew.sh/) on macOS:

```bash
brew install ffmpeg flac
```

## Installation
1. Clone this repository:
   ```bash
   git clone https://github.com/yourusername/m4a-to-flac-converter.git
   ```

2. Navigate to the project directory:
   ```bash
   cd m4a-to-flac-converter
   ```

3. Make the script executable:
   ```bash
   chmod +x m4a_to_flac.sh
   ```

## Usage

1. Place your `.m4a` files in the same directory as the `m4a_to_flac.sh` script.
2. Run the script to start the conversion and cover embedding process:
   ```bash
   ./m4a_to_flac.sh
   ```

### Example Files Structure:
```
.
├── 01 Song.m4a
├── 02 Song.m4a
├── m4a_to_flac.sh
```

After running the script, you will have the corresponding `.flac` files with the album artwork embedded, and the temporary `.jpg` files will be deleted.

### Output Example:
```
01 Song.flac
02 Song.flac
```

## How It Works
1. The script loops through all `.m4a` files in the directory and extracts the cover artwork as `.jpg` using `ffmpeg`.
2. It then converts each `.m4a` file to `.flac` while embedding the extracted artwork.
3. Finally, it ensures the cover art is properly embedded in the `.flac` files using `metaflac` and deletes the temporary `.jpg` files.

## Contributions
Feel free to submit issues or pull requests if you'd like to improve the script or add new features!

## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
```

### Key sections:
- **Features**: A quick overview of what the script does.
- **Requirements**: Lists the dependencies and how to install them.
- **Installation**: How to set up the project.
- **Usage**: Steps for running the script.
- **How It Works**: A brief explanation of the process.
- **Contributions**: Encouragement for others to contribute to the project.
- **License**: MIT License.
