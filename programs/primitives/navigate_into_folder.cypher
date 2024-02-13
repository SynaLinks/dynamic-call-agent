// @desc: Nagivate into the given folder using `cd`, create one if non-existing using `mkdir`
CREATE
(start:Control {name:"Start"}),
(end:Control {name:"End"}),
(change_directory:Action {
    name:"Try to change the current working directory",
    tool:"Shell",
    prompt:"The unix cd command to navigate into the directory"}),
(is_successfully_changed:Decision {
    name:"Check if the current directory have been changed successfully",
    question:"The working directory is successfully changed?"}),
(create_folder:Action {
    name:"Create the non-existing folder",
    tool:"Shell",
    prompt:"The unix mkdir command to create the folder"}),
(start)-[:NEXT]->(change_directory),
(change_directory)-[:NEXT]->(is_successfully_changed),
(create_folder)-[:NEXT]->(change_directory),
(is_successfully_changed)-[:NO]->(create_folder),
(is_successfully_changed)-[:YES]->(end)
