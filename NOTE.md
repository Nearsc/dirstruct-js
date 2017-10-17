# Development Notes

## Version 0.0

### Known issues
#### dirstruct.js
- The character `&` in file or directory name is shown as `&amp;` rather than `&`.
- The way of justifying the visible area is not so reasonable and the file or directory name is always shown as one line. If a file has a long name, it will become inconvenient to change the visible area, or even unable to be back to parent directories.

#### dirstruct.sh
- The program will make mistakes when file or directory name includes character `&`.
