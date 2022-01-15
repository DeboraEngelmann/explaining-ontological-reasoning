// Agent operator in project explaining-ontological-reasoning

/* Plans */

+!start : true <- .print("hello world.").



+!kqml_received(Sender,assert,bed_allocation_plan(flaws),MsgId)
	<-	.print("Don't confirm the allocation.");
		.send(Sender,assert,confirm_allocation(false)).

	
+!kqml_received(Sender,assert,confirm_allocation(false),MsgId)
	<-	.print("Why do you think the 101b bed isn't Intensive care?");
		.send(Sender,question,confirm_allocation(false)).
		

{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }

// uncomment the include below to have an agent compliant with its organisation
//{ include("$moiseJar/asl/org-obedient.asl") }
