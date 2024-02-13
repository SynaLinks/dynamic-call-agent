// @desc: List the given folder using `ls` unix command
CREATE
(start:Control {name:"Start"}),
(end:Control {name:"End"}),
(list_folder:Action {
    name:"List the given directory",
    tool:"Shell",
    prompt:"The unix command ls to list the given directory"}),
(start)-[:NEXT]->(list_folder),
(list_folder)-[:NEXT]->(end)