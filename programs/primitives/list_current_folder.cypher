// @desc: List the current folder using `ls` unix command
CREATE
(start:Control {name:"Start"}),
(end:Control {name:"End"}),
(list_folder:Action {
    name:"List the current directory",
    tool:"Shell",
    prompt:"ls",
    disable_inference:"true"}),
(start)-[:NEXT]->(list_folder),
(list_folder)-[:NEXT]->(end)