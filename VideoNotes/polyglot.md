| File Type       | Beginning Signature (Hex)                | Ending Signature (Hex)        |
|-----------------|------------------------------------------|-------------------------------|
| JPEG            | `FF D8`                                  | `FF D9`                       |
| PNG             | `89 50 4E 47 0D 0A 1A 0A`                | *No specific ending*          |
| GIF             | `47 49 46 38 39 61` or `47 49 46 38 37 61` | *No specific ending*       |
| TIFF (little endian) | `49 49 2A 00`                       | *Varies*                      |
| TIFF (big endian)    | `4D 4D 00 2A`                       | *Varies*                      |
| BMP             | `42 4D`                                  | *No specific ending*          |
| PDF             | `25 50 44 46`                            | `%%EOF` (in ASCII)            |
| ZIP             | `50 4B 03 04` or `50 4B 05 06` (empty archive) or `50 4B 07 08` (spanned archive) | *No specific ending* |
| RAR             | `52 61 72 21 1A 07 00`                   | *No specific ending*          |
| 7z              | `37 7A BC AF 27 1C`                      | *No specific ending*          |
| MP3 (with ID3 tag) | `49 44 33`                            | *No specific ending*          |
| WAV             | `52 49 46 46` followed by file size and `57 41 56 45` | *No specific ending* |
| AVI             | `52 49 46 46` followed by file size and `41 56 49 20` | *No specific ending* |
| MP4             | `00 00 00 18 66 74 79 70` (varies)      | *No specific ending*          |
| MKV             | `1A 45 DF A3`                           | *No specific ending*          |
| FLV             | `46 4C 56 01`                           | *No specific ending*          |
