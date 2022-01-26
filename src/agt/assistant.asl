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


//+!translateToNaturalLanguage(Explanation,[],NLExplanation)
//<-
//	NLExplanation=Explanation.
+!translateToNaturalLanguage([],Temp,NLExplanation)
<- 
	NLExplanation=Temp.
+!translateToNaturalLanguage([Rule|List],Temp,NLExplanation)
<-
	!translate(Rule, RuleTranslated);
	.concat([RuleTranslated],Temp,NewTemp);
	!translateToNaturalLanguage(List,NewTemp,NLExplanation).

/* ***** translate plans ********** */	
+!translate
(
	defeasible_rule(bed_is_care(B1r,C1r),[patient(P1r),is_care(P1r,C1r),hospital_Bed(B1r),occupy_one(P1r,B1r)])[as(_)],X0
)
<- 
	.concat("Patient ",P1r," is of care ",C1r," and occupies bed ",B1r,". So bed ",B1r," is of care ",C1r,".",X0).

+!translate
(
	defeasible_rule(bed_is_care(B2r,C1r),[hospital_Bed(B2r),bedroom(Br),is_in(B2r,Br),bedroom_is_care(Br,C1r)])[as(_)],X1
)
<-
	.concat("Bed ",B2r," is in bedroom ",Br," and bedroom ",Br," is of care ",C1r,". So bed ",B2r," is of care ",C1r,".", X1).

+!translate
(
	defeasible_rule(bedroom_is_care(Br,C1r),[hospital_Bed(B1r),bedroom(Br),is_in(B1r,Br),bed_is_care(B1r,C1r)])[as(_)],X2
)
<-
	.concat("Bed ",B1r," is in bedroom ",Br," and is of care ",C1r,". So bedroom ",Br," is of care ",C1r,".", X2).

+!translate
(
	defeasible_rule(is_unsuitable_for(B2r,P2r),[patient(P2r),hospital_Bed(B2r),is_care(P2r,C2r),bed_is_care(B2r,C1r),differentFrom(C1r,C2r)])[as(_)],X3
)
<- 
	.concat("Patient ",P2r," is of care ",C2r," and bed ",B2r," is of care ",C1r," that is different from Minimal-Care. So bed ",B2r," is unsuitable for patient ",P2r,".",X3).
	
/* ************************ */

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
	<-	!translateToNaturalLanguage(Explanation,[],NLExplanation);
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
