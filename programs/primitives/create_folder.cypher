// @desc: Try to create the given folder, notify the user if not successful
CREATE
(start:Control {name:"Start"}),
(end:Control {name:"End"}),
(create_folder:Action {
    name:"Try to create the folder",
    tool:"Shell",
    prompt:"The unix mkdir command to create the folder"}),
(is_successfully_created:Decision {
    name:"Check if the folder have been created", 
    question:"Have the folder been successfully created?"}),
(tell_user:Action {
    name:"Tell the User why I failed",
    tool:"Speak",
    prompt:"Please tell the User the reason why you coudn't create the folder"}),
(start)-[:NEXT]->(create_folder),
(create_folder)-[:NEXT]->(is_successfully_created),
(is_successfully_created)-[:YES]->(end),
(is_successfully_created)-[:NO]->(tell_user),
(tell_user)-[:NEXT]->(end)