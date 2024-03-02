// @desc: This is the main program
CREATE
(start:Control {name:"Start"}),
(end:Control {name:"End"}),
(fulfill_objective:Program {
    name:"Fulfill the Objective",
    program:"fulfill_objective"}),
(start)-[:NEXT]->(fulfill_objective),
(fulfill_objective)-[:NEXT]->(end)