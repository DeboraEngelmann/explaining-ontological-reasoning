// Agent assistant in project explaining-ontological-reasoning

/* Initial beliefs and rules */

/* Initial goals */

!start.

/* Plans */

+!start 
	: true 
<- 
	.print("Your bed allocation plan has flaws. There was an error when allocating the following patients: Patient3 in bed 101b - Because bed 111b is not of Intensive Care, as is the case with the patient.");
	.send(operator,assert,bed_allocation_plan(flaws));
	.print("Should I confirm the allocation anyway, or would you prefer me to suggest an optimised allocation?");
	.send(operator,assert,bed_allocation_plan(flaws));
	.
	
	
	
+!kqml_received(Sender,assert,confirm_allocation(false),MsgId)
	<-	.print("Ok, I'm canceling as requested.");
		.send(Sender,assert,confirm_allocation(false)).

{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }

// uncomment the include below to have an agent compliant with its organisation
//{ include("$moiseJar/asl/org-obedient.asl") }
