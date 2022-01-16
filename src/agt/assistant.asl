// Agent assistant in project explaining-ontological-reasoning

/* Initial beliefs and rules */

/* Initial goals */

!start.

/* Plans */

+!start 
	: true 
<- 
	.print("Agent assistant enabled.");
	.wait(1000);
	.print("====================================================");
	.print("Your bed allocation plan has flaws. Bed 101b is unsuitable for Patient2.");
	.send(operator,assert,is_unsuitable_for("101b","Patient2"));
	.

//Colocar o código para tradução aqui
+!translateToNaturalLanguage(Explanation,NLExplanation)
<-
	NLExplanation=Explanation.

+!printList([]).
+!printList([H|T])
<-
	.print(H);
	!printList(T);
	.

+!kqml_received(ontology_specialist,assert,Pred[~Pred],MsgId)
	<-	.print("No, it isn't.");
		.send(operator,assert,~Pred).
			
+!kqml_received(ontology_specialist,assert,Pred[Explanation],MsgId)
	<-	!translateToNaturalLanguage(Explanation,NLExplanation);
		.print("Because: ");
		!printList(NLExplanation);
		.send(operator,assert,Pred[NLExplanation]).
	
+!kqml_received(Sender,question,is_unsuitable_for(Bed,Patient),MsgId)
	<-	.send(ontology_specialist,question,is_unsuitable_for(Bed,Patient)).
	
+!kqml_received(Sender,question,is_suitable_for(Bed,Patient),MsgId)
	<-	.send(ontology_specialist,question,is_suitable_for(Bed,Patient)).

+!kqml_received(Sender,accept,Pred,MsgId)
	<-	.print("Dialog closed in acceptance: ", Pred);
		.print("====================================================");.
	
{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }

// uncomment the include below to have an agent compliant with its organisation
//{ include("$moiseJar/asl/org-obedient.asl") }
