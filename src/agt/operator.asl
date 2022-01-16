// Agent operator in project explaining-ontological-reasoning

!start.
/* Plans */

+!start : true <- .print("Agent operator enabled.").




+!kqml_received(Sender,assert,is_unsuitable_for("103a","Patient2")[Explanation],MsgId)
	<-	.print("Ok.");
		.send(Sender,accept,is_unsuitable_for("103a","Patient2")).
	
+!kqml_received(Sender,assert,is_unsuitable_for("101b","Patient2")[Explanation],MsgId)
	<-	.print("And how about bed 103a? Is it suitable?");
		.send(Sender,question,is_suitable_for("103a","Patient2")).

+!kqml_received(Sender,assert,is_unsuitable_for(Bed,Patient),MsgId)
	<-	.print("Why do you think the ",Bed," bed is unsuitable for ",Patient,"?");
		.send(Sender,question,is_unsuitable_for(Bed,Patient)).
		
+!kqml_received(Sender,assert,~is_suitable_for(Bed,Patient),MsgId)
	<-	.print("Why not?");
		.send(Sender,question,is_unsuitable_for("103a","Patient2")).

{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }

// uncomment the include below to have an agent compliant with its organisation
//{ include("$moiseJar/asl/org-obedient.asl") }
