// @desc: Try to call a existing program
CREATE
(start:Control {name:"Start"}),
(end:Control {name:"End"}),
(call_program:Action {
    name:"Call an existing program to fullfil the Objective", 
    tool:"CallProgram",
    prompt:"Please call the more appropriate program to fullfil the Objective.
Please, only use the program name and remove any parameter or file extension (the `.cypher`).
Remember to always try to call an existing program."}),
(is_successfully_called:Decision {
    name:"Check if the program have been successfuly called",
    question:"The program have been successfuly called?"}),
(try_again:Action {
    name:"Correct the program name and try again",
    tool:"CallProgram",
    prompt:"Please correct the program name.
Please, only use the program name and remove any parameter or file extension (the `.cypher`).
Remember to always try to call an existing program."}),
(start)-[:NEXT]->(call_program),
(call_program)-[:NEXT]->(is_successfully_called),
(try_again)-[:NEXT]->(is_successfully_called),
(is_successfully_called)-[:NO]->(try_again),
(is_successfully_called)-[:YES]->(end)