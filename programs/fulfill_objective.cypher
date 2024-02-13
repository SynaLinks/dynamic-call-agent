// @desc: Fulfill the objective
CREATE
(start:Control {name:"Start"}),
(end:Control {name:"End"}),
(program_search:Action {
    name:"Search for existing programs", 
    tool:"ProgramSearch",
    prompt:"Describe in ONE short sentence what needs to be done.

Ensure to use the following examples format to answer:
- Search the answer to the given question on internet
- Tell the answer to the User
- Nagivate into the given folder using `cd`
- Try to create the given folder

Ensure to use the above format."}),
(call_program:Program {
    name:"Review the available programs from the search and select the most suitable one to fulfill the objective.",
    program:"call_program"}),
(is_objective_complete:Decision {
    name:"Determine if the objective has been successfully fulfilled. If not, loop back to search for alternative programs.",
    question:"Is the Objective complete?"}),
(start)-[:NEXT]->(program_search),
(program_search)-[:NEXT]->(call_program),
(call_program)-[:NEXT]->(is_objective_complete),
(is_objective_complete)-[:NO]->(program_search),
(is_objective_complete)-[:YES]->(end)