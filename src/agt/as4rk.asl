// Agent as4eo in project data_access_control

 /* THIS FILE IMPLEMENTS THE ARGUMENTATION SCHEME FROM ROLE TO KNOW [Panisson et al. 2017] */ 

/* Initial assumptions */

//reliable(Ag):- not(~reliable(Ag)[_]).
//
///* AS4RK - Argumentation scheme for Role to Know */
//defeasible_rule(conclusion(Conc),[asserts(Ag,Conc),role(Ag,Role),role_to_know(Role,Subj),about(Conc,Subj)])[as(as4rk)].
//	cq(cq1,role_to_know(Role,Subj))[as(as4rk)].
//	cq(cq2,reliable(Ag))[as(as4rk)].
//	cq(cq3,asserts(Ag,Conc))[as(as4rk)].
//	cq(cq4,role(Ag,Role))[as(as4rk)]. 
//
//	
//about(causes(smoking,cancer),cancer).
//role_to_know(doctor,cancer).
//	  	
//	  			  // JOHN
//asserts(john,causes(smoking,cancer)).
//role(john,doctor).
//				  
//				  // PIETRO
//role(pietro,doctor).
//~reliable(pietro).
//
//!start.
//
//+!start
//	: argument(conclusion(causes(smoking,cancer)), Arg)
//<-
//	.print(Arg).

differentFrom(X,Y) :- isDifferentFrom(X,Y) | isDifferentFrom(Y,X).


////differentFrom(X,Y) :- X\==Y.
//defeasible_rule(bed_is_care(B1r,C1r),[patient(P1r),is_care(P1r,C1r),hospital_Bed(B1r),occupy_one(P1r,B1r)])[as("scheme_4b9cb01f_e7b5_43e2_9905_2a1fb4972996")].
//defeasible_rule(bed_is_care(B2r,C1r),[hospital_Bed(B2r),bedroom(Br),is_in(B2r,Br),bedroom_is_care(Br,C1r)])[as("scheme_6a01065c_eae9_4628_8489_0675a786c614")].
//defeasible_rule(bedroom_is_care(Br,C1r),[hospital_Bed(B1r),bedroom(Br),is_in(B1r,Br),bed_is_care(B1r,C1r)])[as("scheme_05689fce_8296_41d6_8e8d_35c8994da699")].
//defeasible_rule(is_unsuitable_for(B2r,P2r),[patient(P2r),hospital_Bed(B2r),is_care(P2r,C2r),bed_is_care(B2r,C1r),differentFrom(C1r,C2r)])[as("scheme_3db6d640_25c6_4774_81d5_50d121a64ef8")].
//occupy_one("Patient1","101a").
//patient("Patient1").
//patient("Patient2").
//hospital_Bed("101a").
//hospital_Bed("101b").
//is_care("Patient1","Semi-Intensive-Care").
//is_care("Patient2","Minimal-Care").
//is_in("101a","101").
//is_in("101b","101").
//bedroom("101").
//hospital_Bed("101a").
//hospital_Bed("101b").
////bed_is_care("101b","Semi-Intensive-Care").
////differentFrom("Semi-Intensive-Care","Minimal-Care").
//isDifferentFrom("Intensive-Care","Minimal-Care").
//isDifferentFrom("Intensive-Care","Semi-Intensive-Care").
//isDifferentFrom("Minimal-Care","Semi-Intensive-Care").
//!start.
!fillTheBeliefBase.

+!start
// : .print("Plano 1") & argument(is_unsuitable_for("101b","Patient2"), Arg) & .print(Arg)
 : .print("Plano 1") & argument(bed_is_care("101a","Semi-Intensive-Care"), Arg) & .print(Arg)
<- 
	!print("Foi").
+!start
// : .print("Plano 2") & not argument(is_unsuitable_for("101b","Patient2"))
 : .print("Plano 2") & not argument(bed_is_care("101a","Semi-Intensive-Care"))
<- 
	.print("Não deu").
-!start[X]
<- .print(X).

+!print([]).
+!print([H|T])
<- .print(H);
	!print(T).
	

+!fillTheBeliefBase
<- 
//	
	.print("Getting info in ontology");
	getClassNames(ClassNames);
//	.print("Adding Classes to the belief base");
	!addToTheBeliefBase(ClassNames);
//	.print("Getting ObjectProperties in ontology");
	getObjectPropertyNames(ObjectPropertyNames);
//	.print("Adding ObjectProperties to the belief base");
	!addToTheBeliefBase(ObjectPropertyNames);
	getObjectPropertyAssertions(Assertions);
	!addToTheBeliefBase(Assertions);
	getClassAssertions(ClassAssertions);
	!addToTheBeliefBase(ClassAssertions);
	getSWRLRules(SWRLRules);
//	!print(SWRLRules);
	!addToTheBeliefBase(SWRLRules);
	getDifferentIndividuals(DiffIndividuals);
	!addToTheBeliefBase(DiffIndividuals);
	!start;
	.

+!addToTheBeliefBase([]).	
+!addToTheBeliefBase([H|T])
<-
	+H;
	!addToTheBeliefBase(T)
	.

{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("reasoning/abr_in_aopl_with_as_v2.asl")}