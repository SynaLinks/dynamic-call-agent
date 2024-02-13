// @desc: This is the main program
CREATE
(start:Control {name:"Start"}),
(end:Control {name:"End"}),
(fulfill_objective:Program {
    name:"Fulfill the Objective",
    program:"fulfill_objective"}),
(ask_next_objective:Action {
    name:"Ask the next Objective", 
    tool:"AskUser",
    disable_inference:"true",
    prompt:"Do you want anything else?"}),
(is_assistance_needed:Decision {
    name:"Check if the User want something else",
    question:"Does the User need anything else?"}),
(update_objective:Action {
    name:"Update the Objective with the new User request",
    tool:"UpdateObjective",
    prompt:"Please update the Objective, be specific"}),
(start)-[:NEXT]->(fulfill_objective),
(fulfill_objective)-[:NEXT]->(ask_next_objective),
(ask_next_objective)-[:NEXT]->(is_assistance_needed),
(update_objective)-[:NEXT]->(fulfill_objective),
(is_assistance_needed)-[:YES]->(update_objective),
(is_assistance_needed)-[:NO]->(end)