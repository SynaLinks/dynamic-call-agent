// @desc: Fulfill the objective
CREATE
(start:Control {name:"Start"}),
(end:Control {name:"End"}),
(call_existing_program:Program {
    name:"Call an existing program to fulfill the objective",
    program:"call_existing_program"
}),
(is_objective_complete:Decision {
    name:"Determine if the objective has been successfully fulfilled. If not, loop back to search for alternative programs.",
    question:"Is the Objective complete?"}),
(start)-[:NEXT]->(call_existing_program),
(call_existing_program)-[:NEXT]->(is_objective_complete),
(is_objective_complete)-[:NO]->(call_existing_program),
(is_objective_complete)-[:YES]->(end)