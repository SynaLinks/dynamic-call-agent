// @desc: Cleanup the program trace from the working memory
CREATE
(start:Control {name:"Start"}),
(end:Control {name:"End"}),
(clear_trace:Action {
    name:"Clear the trace to start over",
    tool:"ClearTrace",
    prompt:"",
    disable_inference:"true"}),
(start)-[:NEXT]->(clear_trace),
(clear_trace)-[:NEXT]->(end)