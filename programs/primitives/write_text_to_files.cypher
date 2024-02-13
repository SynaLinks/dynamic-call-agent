// @desc: Write text into files and try again if not successful
CREATE
(start:Control {name:"Start"}),
(end:Control {name:"End"}),
(write_files:Action {
    name:"Write files into memory",
    tool:"WriteFiles",
    prompt:"Please, write the files into memory.
Lay down each file using the following
format where the following tokens must be replaced such that:
FILENAME is the lowercase file name including the file extension
LANG is the language of the file's content and CONTENT is the content.

FILENAME
```LANG
CONTENT
```"}),
(is_successfully_written:Decision {
    name:"Check if the files have been successfully written",
    question:"Are the files successfully written?"}),
(try_again:Action {
    name:"Correct and try again", 
    tool:"WriteFiles",
    prompt:"Please, make sure the format is correct.
Lay down each file using the following
format where the following tokens must be replaced such that:
FILENAME is the lowercase file name including the file extension
LANG is the language of the file's content and CONTENT is the content.

FILENAME
```LANG
CONTENT
```"}),
(start)-[:NEXT]->(write_files),
(write_files)-[:NEXT]->(is_successfully_written),
(try_again)-[:NEXT]->(is_successfully_written),
(is_successfully_written)-[:NO]->(try_again),
(is_successfully_written)-[:YES]->(end)