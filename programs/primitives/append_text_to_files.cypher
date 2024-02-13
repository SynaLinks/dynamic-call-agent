// @desc: Append text into files and try again if not successful
CREATE
(start:Control {name:"Start"}),
(end:Control {name:"End"}),
(append_files:Action {
    name:"Try to append files into memory",
    tool:"AppendFiles",
    prompt:"Please, append files into memory.
Lay down each modification using the following
format where the following tokens must be replaced such that:
FILENAME is the lowercase file name including the file extension
LANG is the language of the file's content and CONTENT is the content.

FILENAME
```LANG
CONTENT
```"}),
(is_successfully_modified:Decision {
    name:"Check if the files have been successfully modified",
    question:"Are the files successfully modified?"}),
(try_again:Action {
    name:"Correct and try again", 
    tool:"AppendFiles",
    prompt:"Please, make sure the format is correct.
Lay down each modification using the following
format where the following tokens must be replaced such that:
FILENAME is the lowercase file name including the file extension
LANG is the language of the file's content and CONTENT is the content.

FILENAME
```LANG
CONTENT
```"}),
(start)-[:NEXT]->(append_files),
(append_files)-[:NEXT]->(is_successfully_modified),
(try_again)-[:NEXT]->(is_successfully_modified),
(is_successfully_modified)-[:NO]->(try_again),
(is_successfully_modified)-[:YES]->(end)