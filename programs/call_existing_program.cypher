// @desc: Try to call an existing program
CREATE
(start:Control {name:"Start"}),
(end:Control {name:"End"}),
(program_search:Action {
    name:"Search for existing routine to fulfill the objective and list the top-5 most relevant", 
    tool:"ProgramSearch",
    prompt:"Describe in ONE short sentence the action to take to fullfil the objective.
Don't repeat the purpose of your action but use the Objective to describe that needs to be done

Ensure to use the following examples format to answer:
- Search the answer to the given question on internet
- Tell the answer to the User
- Nagivate into the given folder
- Try to create the given folder

Ensure to use the above format."}),
(call_program:Action {
    name:"Pick the most appropriate routine from the above ProgramSearch", 
    tool:"CallProgram",
    prompt:"Please, only use the above routine name and remove any parameter or file extension (the `.cypher`).
Avoid explaining your choice and make sure you picked the exact name from the above ProgramSearch."}),
(is_successfully_called:Decision {
    name:"Check if the routine have been successfuly called",
    question:"You are an expert in analysing traces.
Does the routine have been successfuly called?"}),
(explain_failure:Action {
    name:"Notify what when wrong",
    tool:"Speak",
    prompt:"Notify what went wrong in a short and concise manner."}),
(start)-[:NEXT]->(program_search),
(program_search)-[:NEXT]->(call_program),
(call_program)-[:NEXT]->(is_successfully_called),
(is_successfully_called)-[:NO]->(explain_failure),
(is_successfully_called)-[:YES]->(end)
(explain_failure)-[:NEXT]->(end),
