// Agent ontology_specialist in project explaining_ontological_reasoning

/* Initial goals */

!start.

/* Plans */


+!kqml_received(Sender,question,Pred,MsgId)
	<-	
		!isRelated(Pred,IsRelated);
		!getAnswer(Pred,IsRelated,Explanation);
		.send(Sender,assert,Pred[Explanation]).


+!getAnswer(Pred,IsRelated,Answer)
	: IsRelated == false
<-
	Answer= ~Pred;
	.
+!getAnswer(Pred,IsRelated,Answer)
	: IsRelated == true
<-
	!getExplanation(Pred, Explanation);
	Answer = Explanation;
	.

+!start 
	: true 
<- 
	!fillTheBeliefBase;
//	.print("Agent ontology_specialist enabled.")
	.
	
//+!getExplanation(Pred, Explanation)
//	: .print("Aqui-> ", Pred) & argument(Pred,Arg)
//<-	
//	.print("************************** ");
//	.print(Arg);
//	Explanation=Arg;
//	.
+!getExplanation(Pred, Explanation)
	: Pred =..[Header,Content,X] & objectProperty(OpString,Header)
<-
//	.print("Get the reasoner's explanation for ", Pred);
	getExplanation(OpString,Pred,Axioms);
	!addToBB(Axioms);

	!instantiateArgumentScheme(Pred,Axioms,Explanation);
	.

+!instantiateArgumentScheme(Pred,explanationTerms("empy"),Explanation)
<-
	Explanation = "Empty explanation.".
+!instantiateArgumentScheme(Pred,explanationTerms(rules(RulesList),assertions(AssertionsList),classInfo(ClassInfoList)),Explanation)
<-
	.concat([Pred],AssertionsList,Assertions);
//	.print("Instantiate argument schemes");
	!instantiateArgumentScheme(RulesList,Assertions,Explanation);
	.
+!instantiateArgumentScheme(RulesList,AssertionsList,Explanation)
<-
	jia.unifyRule(RulesList,AssertionsList,Explanation);
	.

+!addToBB(explanationTerms("empy"))
<-
	.print("Empty explanation.").
+!addToBB(explanationTerms(rules(RulesList),assertions(AssertionsList),classInfo(ClassInfoList)))
<-
	!addToBB(RulesList);
	!addToBB(AssertionsList);
	!addToBB(ClassInfoList);
	.
+!addToBB([]).
+!addToBB([H|T])
<-
	+H;
	!addToBB(T);
	.
	

+!print(_,[])
<-
	.print("End of list");	
	.
+!print(Type,[H|T])
<-
	.print(Type," : ", H);
	!print(Type, T);
	.
	
+!fillTheBeliefBase
<- 
//	.print("Getting classes in ontology");
	getClassNames(ClassNames);
//	.print("Adding Classes to the belief base");
	!addToTheBeliefBase(ClassNames);
//	.print("Getting ObjectProperties in ontology");
	getObjectPropertyNames(ObjectPropertyNames);
//	.print("Adding ObjectProperties to the belief base");
	!addToTheBeliefBase(ObjectPropertyNames);
	getObjectPropertyAssertions(Assertions);
	!addToTheBeliefBase(Assertions);
	.

+!addToTheBeliefBase([]).	
+!addToTheBeliefBase([H|T])
<-
	+H;
	!addToTheBeliefBase(T)
	.

+!isRelated(Pred,IsRelated)
	:  Pred =..[Header,Content,X] & objectProperty(OpString,Header)
<-
	.nth(0,Content,Domain);
	.nth(1,Content,Range);
	isRelated(Domain,OpString,Range,IsRelated);
//	.print(Pred, " = ", IsRelated);
	.

+!isRelated(Domain, Property, Range, IsRelated)
 	: objectProperty(PropertyName,Property)
<-
	isRelated(Domain, PropertyName, Range, IsRelated);
	.print("Domain: ", Domain, " PropertyName: ", PropertyName, " Range: ", Range, " IsRelated: ", IsRelated);
	.
	
+!addInstance(InstanceName, Concept)
	: concept(ClassName,Concept)
<- 
	.print("Adding a new ", ClassName, " named ", InstanceName);
	addInstance(InstanceName, ClassName);
	!getInstances(Concept, Instances);
	!print("Instances", Instances);
	.

+!isInstanceOf(InstanceName, Concept, Result)
	: concept(ClassName,Concept)
<- 
	.print("Checking if ", InstanceName, " is an instance of ", ClassName);
	isInstanceOf(InstanceName, ClassName, Result);
	.print("The result is ", Result);
	!getInstances(Concept, Instances);
	!print("Instances", Instances);
	.

+!getInstances(Concept, Instances)
	: concept(ClassName,Concept)
<-
	.print("Getting instances of ", ClassName);
	getInstances(ClassName, Instances);
	.
	
+!getObjectPropertyValues(Domain, Property, Range)
 	: objectProperty(PropertyName,Property)
<-
	getObjectPropertyValues(Domain, PropertyName, Range);
	.print("Domain: ", Domain, " PropertyName: ", PropertyName, " Range: ", Range);
	.
	
{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }
//{ include("reasoning/abr_in_aopl_with_as_v2.asl")}

// uncomment the include below to have an agent compliant with its organisation
//{ include("$moiseJar/asl/org-obedient.asl") }
