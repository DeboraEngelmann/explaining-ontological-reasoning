# Argumentation Schemes for Bed Allocation in Hospitals

This document contains the argumentation schemes extracted from the multi-agent application, including their respective templates in natural language.


<table>
  <tr>
    <td height="40">Major Premise</td>
    <td height="40">
        If a bed Y is of isolation I and is in some bedroom, this bedroom will be of isolation I too.
    </td>
  </tr>
  <tr>
    <td height="40">Minor Premise</td>
    <td height="40">Bed Y is of isolation I and is in the bedroom Z.</td>
  </tr>
   <tr>
    <td height="40">Conclusion</td>
     <td height="40">Therefore, bedroom Z is of isolation I.</td>
  </tr>
</table>

``` javascript
defeasible_rule(bedroom_is_isolation(Z,I),[hospital_Bed(Y),bedroom(Z),is_in(Y,Z),bed_is_isolation(Y,I)])[as(_)]
```

``` css
Hospital_Bed(?Y),Bedroom(?Z),is-in(?Y,?Z),bed-is-isolation(?Y,?I)->bedroom-is-isolation(?Z,?I)
```
<br>
<br>
<table>
  <tr>
    <td height="40">Major Premise</td>
    <td height="40">
   If a patient occupies a bed and is of isolation I, this bed will be of isolation I too. 
    </td>
  </tr>
  <tr>
    <td height="40">Minor Premise</td>
    <td height="40">Patient X is of isolation I and occupies bed Y.</td>
  </tr>
   <tr>
    <td height="40">Conclusion</td>
     <td height="40">Therefore, bed Y is of isolation I.</td>
  </tr>
</table>

``` javascript
defeasible_rule(bed_is_isolation(Y,I),[patient(X),is_isolation(X,I),hospital_Bed(Y),occupy_one(X,Y)])[as(_)]
```

``` css
Patient(?X),is-isolation(?X,?I),Hospital_Bed(?Y),occupy-one(?X,?Y)->bed-is-isolation(?Y,?I)
```

<br>
<br>

<table>
  <tr>
    <td height="40">Major Premise</td>
    <td height="40">
 	If a bedroom is of isolation I, all the beds from this bedroom will be of isolation I too.
    </td>
  </tr>
  <tr>
    <td height="40">Minor Premise</td>
    <td height="40">Bedroom Z is of isolation I and the bed Y is in this bedroom.</td>
  </tr>
   <tr>
    <td height="40">Conclusion</td>
     <td height="40">Therefore, bed Y is of isolation I.</td>
  </tr>
</table>

``` javascript
defeasible_rule(bed_is_isolation(Y,I),[hospital_Bed(Y),bedroom(Z),is_in(Y,Z),bedroom_is_isolation(Z,I)])[as(_)]
```

``` css
Hospital_Bed(?Y),Bedroom(?Z),is-in(?Y,?Z),bedroom-is-isolation(?Z,?I)->bed-is-isolation(?Y,?I)
```

<br>
<br>

<table>
  <tr>
    <td height="40">Major Premise</td>
    <td height="40">
 	If a patient occupies a bed, then this bed will be of the same care as the patient.
    </td>
  </tr>
  <tr>
    <td height="40">Minor Premise</td>
    <td height="40">Patient X is of care C and occupies bed Y.</td>
  </tr>
   <tr>
    <td height="40">Conclusion</td>
     <td height="40">Therefore, bed Y is of care C.</td>
  </tr>
</table>

``` javascript
defeasible_rule(bed_is_care(Y,C),[patient(X),is_care(X,C),hospital_Bed(Y),occupy_one(X,Y)])[as(_)]
```

``` css
Patient(?X),is-care(?X,?C),Hospital_Bed(?Y),occupy-one(?X,?Y)->bed-is-care(?Y,?C)
```


<br>
<br>

<table>
  <tr>
    <td height="40">Major Premise</td>
    <td height="40">
 	If a hospital bed is in some bedroom Z that is of care C, this bed will be of the same care C too.
    </td>
  </tr>
  <tr>
    <td height="40">Minor Premise</td>
    <td height="40">The bed Y is in bedroom Z and this bedroom is of care C.</td>
  </tr>
   <tr>
    <td height="40">Conclusion</td>
     <td height="40">Therefore, bed Y is of care C.</td>
  </tr>
</table>

``` javascript
defeasible_rule(bed_is_care(Y,C),[hospital_Bed(Y),bedroom(Z),is_in(Y,Z),bedroom_is_care(Z,C)])[as(_)]
```

``` css
Hospital_Bed(?Y),Bedroom(?Z),is-in(?Y,?Z),bedroom-is-care(?Z,?C)->bed-is-care(?Y,?C)
```

<br>
<br>

<table>
  <tr>
    <td height="40">Major Premise</td>
    <td height="40">
 	If a bed from some bedroom is of care C, this bedroom will be of the same care C too.
    </td>
  </tr>
  <tr>
    <td height="40">Minor Premise</td>
    <td height="40">Bed Y is in bedroom Z and is of care C.</td>
  </tr>
   <tr>
    <td height="40">Conclusion</td>
     <td height="40">Therefore, bedroom Z is of care C.</td>
  </tr>
</table>

``` javascript
defeasible_rule(bedroom_is_care(Z,C),[hospital_Bed(Y),bedroom(Z),is_in(Y,Z),bed_is_care(Y,C)])[as(_)]
```

``` css
Hospital_Bed(?Y),Bedroom(?Z),is-in(?Y,?Z),bed-is-care(?Y,?C)->bedroom-is-care(?Z,?C)
```

<br>
<br>

<table>
  <tr>
    <td height="40">Major Premise</td>
    <td height="40">
       If a patient has one attendance R, this patient will be of routing R.
    </td>
  </tr>
  <tr>
    <td height="40">Minor Premise</td>
    <td height="40">Patient X has one attendance R.</td>
  </tr>
   <tr>
    <td height="40">Conclusion</td>
     <td height="40">Therefore, patient X is of routing R.</td>
  </tr>
</table>

``` javascript
defeasible_rule(is_routing(X,R),[patient(X),has_one_attendance(X,R)])[as(_)]
```

``` css
Patient(?X),has-one-attendance(?X,?R)->is-routing(?X,?R)
```

<br>
<br>

<table>
  <tr>
    <td height="40">Major Premise</td>
    <td height="40">
    If bed Y is in bedroom Z and is of routing R, this bedroom will be of routing R too.
    </td>
  </tr>
  <tr>
    <td height="40">Minor Premise</td>
    <td height="40">The bed Y is in bedroom Z and is of routing R.</td>
  </tr>
   <tr>
    <td height="40">Conclusion</td>
     <td height="40">Therefore, bedroom Z is of routing R.</td>
  </tr>
</table>

``` javascript
defeasible_rule(bedroom_is_routing(Z,R),[hospital_Bed(Y),bedroom(Z),is_in(Y,Z),bed_is_routing(Y,R)])[as(_)]
```

``` css
Hospital_Bed(?Y),Bedroom(?Z),is-in(?Y,?Z),bed-is-routing(?Y,?R)->bedroom-is-routing(?Z,?R)
```

<br>
<br>

<table>
  <tr>
    <td height="40">Major Premise</td>
    <td height="40">
 	If bed Y is in bedroom Z and this bedroom is of routing R, bed Y will be of routing R too.
    </td>
  </tr>
  <tr>
    <td height="40">Minor Premise</td>
    <td height="40">Bedroom Z is of routing R and bed Y is in this bedroom.</td>
  </tr>
   <tr>
    <td height="40">Conclusion</td>
     <td height="40">Therefore, bed Y is of routing R.</td>
  </tr>
</table>

``` javascript
defeasible_rule(bed_is_routing(Y,R),[hospital_Bed(Y),bedroom(Z),is_in(Y,Z),bedroom_is_routing(Z,R)])[as(_)]
```

``` css
Hospital_Bed(?Y),Bedroom(?Z),is-in(?Y,?Z),bedroom-is-routing(?Z,?R)->bed-is-routing(?Y,?R)
```

<br>
<br>

<table>
  <tr>
    <td height="40">Major Premise</td>
    <td height="40">
 	If a patient occupies a bed, this bed starts to be of the same patient's routing.
    </td>
  </tr>
  <tr>
    <td height="40">Minor Premise</td>
    <td height="40">Patient X is of routing R and occupies bed Y.</td>
  </tr>
   <tr>
    <td height="40">Conclusion</td>
     <td height="40">Therefore, bed Y is of routing R.</td>
  </tr>
</table>

``` javascript
defeasible_rule(bed_is_routing(Y,R),[patient(X),is_routing(X,R),hospital_Bed(Y),occupy_one(X,Y)])[as(_)]
```

``` css
Patient(?X),is-routing(?X,?R),Hospital_Bed(?Y),occupy-one(?X,?Y)->bed-is-routing(?Y,?R)
```

<br>
<br>

<table>
  <tr>
    <td height="40">Major Premise</td>
    <td height="40">
     If a hospital bed is in some bedroom and is of attendance At, this bedroom will be of the attendance At too.
    </td>
  </tr>
  <tr>
    <td height="40">Minor Premise</td>
    <td height="40">Bed Y is in bedroom Z and is of attendance At.</td>
  </tr>
   <tr>
    <td height="40">Conclusion</td>
     <td height="40">Therefore, bedroom Z is of attendance At.</td>
  </tr>
</table>

``` javascript
defeasible_rule(bedroom_is_the_attendance(Z,At),[hospital_Bed(Y),bedroom(Z),is_in(Y,Z),bed_is_the_attendance(Y,At)])[as(_)]
```

``` css
Hospital_Bed(?Y),Bedroom(?Z),is-in(?Y,?Z),bed-is-the-attendance(?Y,?At)->bedroom-is-the-attendance(?Z,?At)
```

<br>
<br>

<table>
  <tr>
    <td height="40">Major Premise</td>
    <td height="40">
     If a patient occuppies a bed and is of attendance At, this bed will be of attendance At too.
    </td>
  </tr>
  <tr>
    <td height="40">Minor Premise</td>
    <td height="40">Patient X occupies bed Y and is of attendance At.</td>
  </tr>
   <tr>
    <td height="40">Conclusion</td>
     <td height="40">Therefore, bed Y is of attendance At.</td>
  </tr>
</table>

``` javascript
defeasible_rule(bed_is_the_attendance(Y,At),[patient(X),is_the_attendance(X,At),hospital_Bed(Y),occupy_one(X,Y)])[as(_)]
```

``` css
Patient(?X),is-the-attendance(?X,?At),Hospital_Bed(?Y),occupy-one(?X,?Y)->bed-is-the-attendance(?Y,?At)
```

<br>
<br>

<table>
  <tr>
    <td height="40">Major Premise</td>
    <td height="40">
 	If a bed is in some bedroom and this bedroom is of attendance At, this bed will be of attendance At too.
    </td>
  </tr>
  <tr>
    <td height="40">Minor Premise</td>
    <td height="40">Bed Y is in bedroom Z and this bedroom is of attendance At.</td>
  </tr>
   <tr>
    <td height="40">Conclusion</td>
     <td height="40">Therefore, bed Y is of attendance At.</td>
  </tr>
</table>

``` javascript
defeasible_rule(bed_is_the_attendance(Y,At),[hospital_Bed(Y),bedroom(Z),is_in(Y,Z),bedroom_is_the_attendance(Z,At)])[as(_)]
```

``` css
Hospital_Bed(?Y),Bedroom(?Z),is-in(?Y,?Z),bedroom-is-the-attendance(?Z,?At)->bed-is-the-attendance(?Y,?At)
```

<br>
<br>

<table>
  <tr>
    <td height="40">Major Premise</td>
    <td height="40">
      If a bed is in bedroom Z and is of stay P, this bedroom will be of stay P too.
    </td>
  </tr>
  <tr>
    <td height="40">Minor Premise</td>
    <td height="40">Bed Y is in bedroom Z and is of stay P.</td>
  </tr>
   <tr>
    <td height="40">Conclusion</td>
     <td height="40">Therefore, bedroom Z is of stay P.</td>
  </tr>
</table>

``` javascript 
defeasible_rule(bedroom_is_stay(Z,P),[hospital_Bed(Y),bedroom(Z),is_in(Y,Z),bed_is_stay(Y,P)])[as(_)]
```

``` css
Hospital_Bed(?Y),Bedroom(?Z),is-in(?Y,?Z),bed-is-stay(?Y,?P)->bedroom-is-stay(?Z,?P)
```

<br>
<br>

<table>
  <tr>
    <td height="40">Major Premise</td>
    <td height="40">
      If a bed is in bedroom Z and this bedroom is of stay P, this bed will be of stay P too.
    </td>
  </tr>
  <tr>
    <td height="40">Minor Premise</td>
    <td height="40">Bed Y is in bedroom Z and this bedroom is of stay P.</td>
  </tr>
   <tr>
    <td height="40">Conclusion</td>
     <td height="40">Therefore, bed Y is of stay P.</td>
  </tr>
</table>

``` javascript 
defeasible_rule(bed_is_stay(Y,P),[hospital_Bed(Y),bedroom(Z),is_in(Y,Z),bedroom_is_stay(Z,P)])[as(_)]
```

``` css
Hospital_Bed(?Y),Bedroom(?Z),is-in(?Y,?Z),bedroom-is-stay(?Z,?P)->bed-is-stay(?Y,?P)
```

<br>
<br>

<table>
  <tr>
    <td height="40">Major Premise</td>
    <td height="40">
    If a patient occupies a bed, this bed will be of the same patient's stay.
    </td>
  </tr>
  <tr>
    <td height="40">Minor Premise</td>
    <td height="40">Patient X occupies bed Y and is of stay P.</td>
  </tr>
   <tr>
    <td height="40">Conclusion</td>
     <td height="40">Therefore, bed Y is of stay P.</td>
  </tr>
</table>

``` javascript
defeasible_rule(bed_is_stay(Y,P),[patient(X),is_stay(X,P),hospital_Bed(Y),occupy_one(X,Y)])[as(_)]
```

``` css
Patient(?X),is-stay(?X,?P),Hospital_Bed(?Y),occupy-one(?X,?Y)->bed-is-stay(?Y,?P)
```

<br>
<br>

<table>
  <tr>
    <td height="40">Major Premise</td>
    <td height="40">
 	If some patient has an age less than 12 years old, this patient is of the child age group.
    </td>
  </tr>
  <tr>
    <td height="40">Minor Premise</td>
    <td height="40">Patient X is A years old and A is less than 12.</td>
  </tr>
   <tr>
    <td height="40">Conclusion</td>
     <td height="40">Therefore, patient X is of the child age group.</td>
  </tr>
</table>

``` javascript
defeasible_rule(is_of_the_age_group(X,child),[patient(X),is_years_old(X,A),lessThan(A,12)])[as(_)]
```

``` css
Patient(?X),is-years-old(?X,?A),lessThan(?A,12)->is-of-the-age-group(?X,Child)
```

<br>
<br>

<table>
  <tr>
    <td height="40">Major Premise</td>
    <td height="40">
 	If some patient has an age greater than 11 and less than 18 years old, this patient is of the teenager age group.
    </td>
  </tr>
  <tr>
    <td height="40">Minor Premise</td>
    <td height="40">Patient X is A years old and A is greater than 11 and less than 18.</td>
  </tr>
   <tr>
    <td height="40">Conclusion</td>
     <td height="40">Therefore, patient X is of the teenager age group.</td>
  </tr>
</table>

``` javascript
defeasible_rule(is_of_the_age_group(X,teenager),[patient(X),is_years_old(X,A),greaterThan(A,11),lessThan(A,18)])[as(_)]
```

``` css
Patient(?X),is-years-old(?X,?A),greaterThan(?A,11),lessThan(?A,18)->is-of-the-age-group(?X,Teenager)
```

<br>
<br>

<table>
  <tr>
    <td height="40">Major Premise</td>
    <td height="40">
 	If some patient has an age greater than 17 years old, this patient is of the adult age group.
    </td>
  </tr>
  <tr>
    <td height="40">Minor Premise</td>
    <td height="40">Patient X is A years old and A is greater than 17.</td>
  </tr>
   <tr>
    <td height="40">Conclusion</td>
     <td height="40">Therefore, patient X is of the adult age group.</td>
  </tr>
</table>

``` javascript
defeasible_rule(is_of_the_age_group(X,adult),[patient(X),is_years_old(X,A),greaterThan(A,17)])[as(_)]
```

``` css
Patient(?X),is-years-old(?X,?A),greaterThan(?A,17)->is-of-the-age-group(?X,Adult)
```

<br>
<br>

<table>
  <tr>
    <td height="40">Major Premise</td>
    <td height="40">
      If a patient of some age group occupies a bed, this bed starts to be of the same age group.
    </td>
  </tr>
  <tr>
    <td height="40">Minor Premise</td>
    <td height="40">Patient X occupies bed Y and is of the Ag age group.</td>
  </tr>
   <tr>
    <td height="40">Conclusion</td>
     <td height="40">Therefore, bed Y is of the Ag age group.</td>
  </tr>
</table>

``` javascript
defeasible_rule(bed_is_of_the_age_group(Y,Ag),[patient(X),is_of_the_age_group(X,Ag),hospital_Bed(Y),occupy_one(X,Y)])[as(_)]
```

``` css
Patient(?X),is-of-the-age-group(?X,?Ag),Hospital_Bed(?Y),occupy-one(?X,?Y)->bed-is-of-the-age-group(?Y,?Ag)
```

<br>
<br>

<table>
  <tr>
    <td height="40">Major Premise</td>
    <td height="40">
 	If a bed is in bedroom R and is of the Ag age group, this bedroom will be of the same age group.
    </td>
  </tr>
  <tr>
    <td height="40">Minor Premise</td>
    <td height="40">Bed Y is in bedroom Z and is of the Ag age group.</td>
  </tr>
   <tr>
    <td height="40">Conclusion</td>
     <td height="40">Therefore, bedroom Z is of the Ag age group.</td>
  </tr>
</table>

``` javascript
defeasible_rule(bedroom_is_of_the_age_group(Z,Ag),[hospital_Bed(Y),bedroom(Z),is_in(Y,Z),bed_is_of_the_age_group(Y,Ag)])[as(_)]
```

``` css
Hospital_Bed(?Y),Bedroom(?Z),is-in(?Y,?Z),bed-is-of-the-age-group(?Y,?Ag)->bedroom-is-of-the-age-group(?Z,?Ag)
```

<br>
<br>

<table>
  <tr>
    <td height="40">Major Premise</td>
    <td height="40">
 	If the bedroom is of the Ag age group, all the beds from this bedroom will be of Ag age group too.
    </td>
  </tr>
  <tr>
    <td height="40">Minor Premise</td>
    <td height="40">Bed Y is in bedroom Z and bedroom Z is of the Ag age group.</td>
  </tr>
   <tr>
    <td height="40">Conclusion</td>
     <td height="40">Therefore, bed Y is of the Ag age group.</td>
  </tr>
</table>

``` javascript
defeasible_rule(bed_is_of_the_age_group(Y,Ag),[hospital_Bed(Y),bedroom(Z),is_in(Y,Z),bedroom_is_of_the_age_group(Z,Ag)])[as(_)]
```

``` css
Hospital_Bed(?Y),Bedroom(?Z),is-in(?Y,?Z),bedroom-is-of-the-age-group(?Z,?Ag)->bed-is-of-the-age-group(?Y,?Ag)
```

<br>
<br>

<table>
  <tr>
    <td height="40">Major Premise</td>
    <td height="40">
 	If a patient X is a man, then your gender is male.
    </td>
  </tr>
  <tr>
    <td height="40">Minor Premise</td>
    <td height="40">Patient X is a man.</td>
  </tr>
   <tr>
    <td height="40">Conclusion</td>
     <td height="40">Therefore, patient X is of the male gender.</td>
  </tr>
</table>

``` javascript
defeasible_rule(is_of_the_gender(X,male),[patient(X),man(X)])[as(_)]
```

``` css
Patient(?X),Man(?X)->is-of-the-gender(?X,Male)
```

<br>
<br>

<table>
  <tr>
    <td height="40">Major Premise</td>
    <td height="40">
    If a patient is a woman, then your gender is female.
    </td>
  </tr>
  <tr>
    <td height="40">Minor Premise</td>
    <td height="40">Patient X is a woman.</td>
  </tr>
   <tr>
    <td height="40">Conclusion</td>
     <td height="40">Therefore, patient X is of the female gender.</td>
  </tr>
</table>

``` javascript
defeasible_rule(is_of_the_gender(X,female),[patient(X),woman(X)])[as(_)]
```

``` css
Patient(?X),Woman(?X)->is-of-the-gender(?X,Female)
```

<br>
<br>

<table>
  <tr>
    <td height="40">Major Premise</td>
    <td height="40">
     If a patient of G gender occupies a bed, this bed starts to be of the G gender too.
    </td>
  </tr>
  <tr>
    <td height="40">Minor Premise</td>
    <td height="40">Patient X occupies bed Y and is of the G gender.</td>
  </tr>
   <tr>
    <td height="40">Conclusion</td>
     <td height="40">Therefore, bed Y is of the G gender.</td>
  </tr>
</table>

``` javascript
defeasible_rule(bed_is_of_the_gender(Y,G),[patient(X),is_of_the_gender(X,G),hospital_Bed(Y),occupy_one(X,Y)])[as(_)]
```

``` css
Patient(?X),is-of-the-gender(?X,?G),Hospital_Bed(?Y),occupy-one(?X,?Y)->bed-is-of-the-gender(?Y,?G)
```

<br>
<br>

<table>
  <tr>
    <td height="40">Major Premise</td>
    <td height="40">
       All the beds will be of the same gender as their bedroom.
    </td>
  </tr>
  <tr>
    <td height="40">Minor Premise</td>
    <td height="40">The bed Y is in bedroom Z and bedroom Z is of the G gender.</td>
  </tr>
   <tr>
    <td height="40">Conclusion</td>
     <td height="40">Therefore, bed Y is of the G gender.</td>
  </tr>
</table>

``` javascript
defeasible_rule(bed_is_of_the_gender(Y,G),[hospital_Bed(Y),bedroom(Z),is_in(Y,Z),bedroom_is_of_the_gender(Z,G)])[as(_)]
```

``` css
Hospital_Bed(?Y),Bedroom(?Z),is-in(?Y,?Z),bedroom-is-of-the-gender(?Z,?G)->bed-is-of-the-gender(?Y,?G)
```

<br>
<br>

<table>
  <tr>
    <td height="40">Major Premise</td>
    <td height="40">
    If a bed is in bedroom Z and is of G gender, bedroom Z will be of G gender too.
    </td>
  </tr>
  <tr>
    <td height="40">Minor Premise</td>
    <td height="40">Bed Y is of G gender and is in bedroom Z.</td>
  </tr>
   <tr>
    <td height="40">Conclusion</td>
     <td height="40">Therefore, bedroom Z is of G gender.</td>
  </tr>
</table>

``` javascript
defeasible_rule(bedroom_is_of_the_gender(Z,G),[hospital_Bed(Y),bedroom(Z),is_in(Y,Z),bed_is_of_the_gender(Y,G)])[as(_)]
```

``` css
Hospital_Bed(?Y),Bedroom(?Z),is-in(?Y,?Z),bed-is-of-the-gender(?Y,?G)->bedroom-is-of-the-gender(?Z,?G)
```

<br>
<br>

<table>
  <tr>
    <td height="40">Major Premise</td>
    <td height="40">
    If a bed is in bedroom Z and is of speciality S, this bedroom will be of speciality S too.
    </td>
  </tr>
  <tr>
    <td height="40">Minor Premise</td>
    <td height="40">Bed Y is of speciality S and is in bedroom Z.</td>
  </tr>
   <tr>
    <td height="40">Conclusion</td>
     <td height="40">Therefore, bedroom Z is of speciality S.</td>
  </tr>
</table>

``` javascript
defeasible_rule(bedroom_is_speciality(Z,S),[hospital_Bed(Y),bedroom(Z),is_in(Y,Z),bed_is_speciality(Y,S)])[as(_)]
```

``` css
Hospital_Bed(?Y),Bedroom(?Z),is-in(?Y,?Z),bed-is-speciality(?Y,?S)->bedroom-is-speciality(?Z,?S)
```

<br>
<br>

<table>
  <tr>
    <td height="40">Major Premise</td>
    <td height="40">
   If the bedroom Z is of speciality S, all the beds from this bedroom will be of speciality S too.
    </td>
  </tr>
  <tr>
    <td height="40">Minor Premise</td>
    <td height="40">Bedroom Z is of S speciality and bed Y is in bedroom Z.</td>
  </tr>
   <tr>
    <td height="40">Conclusion</td>
     <td height="40">Therefore, bed Y is of speciality S.</td>
  </tr>
</table>

``` javascript
defeasible_rule(bed_is_speciality(Y,S),[hospital_Bed(Y),bedroom(Z),is_in(Y,Z),bedroom_is_speciality(Z,S)])[as(_)]
```

``` css
Hospital_Bed(?Y),Bedroom(?Z),is-in(?Y,?Z),bedroom-is-speciality(?Z,?S)->bed-is-speciality(?Y,?S)
```

<br>
<br>

<table>
  <tr>
    <td height="40">Major Premise</td>
    <td height="40">
 	If a patient occupies a bed and is of speciality S, this bed will be of speciality S too.
    </td>
  </tr>
  <tr>
    <td height="40">Minor Premise</td>
    <td height="40">Patient X occupies bed Y and is of speciality S.</td>
  </tr>
   <tr>
    <td height="40">Conclusion</td>
     <td height="40">Therefore, bed Y is of speciality S.</td>
  </tr>
</table>

``` javascript
defeasible_rule(bed_is_speciality(Y,S),[patient(X),is_speciality(X,S),hospital_Bed(Y),occupy_one(X,Y)])[as(_)]
```

``` css
Patient(?X),is-speciality(?X,?S),Hospital_Bed(?Y),occupy-one(?X,?Y)->bed-is-speciality(?Y,?S)
```

<br>
<br>

<table>
  <tr>
    <td height="40">Major Premise</td>
    <td height="40">
       If a bed is of the same gender, age group, speciality, and care of some patient, this bed will be suitable for this patient.
    </td>
  </tr>
  <tr>
    <td height="40">Minor Premise</td>
    <td height="40">Bed Y has the same gender, age group, speciality, and care of patient X.</td>
  </tr>
   <tr>
    <td height="40">Conclusion</td>
     <td height="40">Therefore, bed Y is suitable for patient X.</td>
  </tr>
</table>

``` javascript
defeasible_rule(is_suitable_for(Y,X),
    [patient(X),hospital_Bed(Y),is_of_the_gender(X,G),bed_is_of_the_gender(Y,G),is_of_the_age_group(X,Ag),
    bed_is_of_the_age_group(Y,Ag),is_speciality(X,S),bed_is_speciality(Y,S),is_care(X,C),bed_is_care(Y,C)])[as(_)]
```

``` css
Patient(?X),Hospital_Bed(?Y),is-of-the-gender(?X,?G),bed-is-of-the-gender(?Y,?G),is-of-the-age-group(?X,?Ag),bed-is-of-the-age-group(?Y,?Ag),is-speciality(?X,?S),bed-is-speciality(?Y,?S),is-care(?X,?C),bed-is-care(?Y,?C)->is-suitable-for(?Y,?X)
```

<br>
<br>

<table>
  <tr>
    <td height="40">Major Premise</td>
    <td height="40">
 	If a bed is of some gender different from the patient's gender, this bed will be unsuitable for this patient.
    </td>
  </tr>
  <tr>
    <td height="40">Minor Premise</td>
    <td height="40">Patient X is of the Gp gender and bed Y is of the Gb gender, Gp gender is different from Gb.</td>
  </tr>
   <tr>
    <td height="40">Conclusion</td>
     <td height="40">Therefore, bed Y is unsuitable for patient X.</td>
  </tr>
</table>

``` javascript
    defeasible_rule(is_unsuitable_for(Y,X),[patient(X),hospital_Bed(Y),is_of_the_gender(X,Gp),bed_is_of_the_gender(Y,Gb),differentFrom(Gp,Gb)])[as(_)]
```

``` css
Patient(?X),Hospital_Bed(?Y),is-of-the-gender(?X,?Gp),bed-is-of-the-gender(?Y,?Gb),DifferentFrom(?Gp,?Gb)->is-unsuitable-for(?Y,?X)
```

<br>
<br>


<table>
  <tr>
    <td height="40">Major Premise</td>
    <td height="40">
 	If a bed is of some care different from the patient's care, this bed will be unsuitable for this patient.
    </td>
  </tr>
  <tr>
    <td height="40">Minor Premise</td>
    <td height="40">Patient X is of care Cp and bed Y is of care Cb, care Cp is different from Cb.</td>
  </tr>
   <tr>
    <td height="40">Conclusion</td>
     <td height="40">Therefore, bed Y is unsuitable for patient X.</td>
  </tr>
</table>

``` javascript
defeasible_rule(is_unsuitable_for(Y,X),[patient(X),hospital_Bed(Y),is_care(X,Cp),bed_is_care(Y,Cb),differentFrom(Cp,Cb)])[as(_)]
```

``` css
Patient(?X),Hospital_Bed(?Y),is-care(?X,?Cp),bed-is-care(?Y,?Cb),DifferentFrom(?Cp,?Cb)->is-unsuitable-for(?Y,?X)
```

<br>
<br>

<table>
  <tr>
    <td height="40">Major Premise</td>
    <td height="40">
 	If a bed is of some speciality different from the patient's speciality, this bed will be unsuitable for this patient.
    </td>
  </tr>
  <tr>
    <td height="40">Minor Premise</td>
    <td height="40">Patient X is of speciality Sp and bed Y is of speciality Sb, speciality Sp is different from Sb.</td>
  </tr>
   <tr>
    <td height="40">Conclusion</td>
     <td height="40">Therefore, bed Y is unsuitable for patient X.</td>
  </tr>
</table>

``` javascript
defeasible_rule(is_unsuitable_for(Y,X),[patient(X),hospital_Bed(Y),is_speciality(X,Sp),bed_is_speciality(Y,Sb),differentFrom(Sp,Sb)])[as(_)]
```

``` css
Patient(?X),Hospital_Bed(?Y),is-speciality(?X,?Sp),bed-is-speciality(?Y,?Sb),DifferentFrom(?Sp,?Sb)->is-unsuitable-for(?Y,?X)
```

<br>
<br>
 
<table>
  <tr>
    <td height="40">Major Premise</td>
    <td height="40">
 	If a bed is of some age group different from the patient's age group, this bed will be unsuitable for this patient.
    </td>
  </tr>
  <tr>
    <td height="40">Minor Premise</td>
    <td height="40">Patient X is of the Ap age group and bed Y is of the Ab age group, age group Ap is different from Ab.</td>
  </tr>
   <tr>
    <td height="40">Conclusion</td>
     <td height="40">Therefore, bed Y is unsuitable for patient X.</td>
  </tr>
</table>

``` javascript
defeasible_rule(is_unsuitable_for(Y,X),
    [patient(X),hospital_Bed(Y),is_of_the_age_group(X,Ap),bed_is_of_the_age_group(Y,Ab),differentFrom(Ap,Ab)])[as(_)]
```

``` css
Patient(?X),Hospital_Bed(?Y),is-of-the-age-group(?X,?Ap),bed-is-of-the-age-group(?Y,?Ab),DifferentFrom(?Ap,?Ab)->is-unsuitable-for(?Y,?X)
```

<br>
<br>

<table>
  <tr>
    <td height="40">Major Premise</td>
    <td height="40">
 	If some bedroom is of puerperal Q, all the beds in this bedroom will be of puerperal Q.
    </td>
  </tr>
  <tr>
    <td height="40">Minor Premise</td>
    <td height="40">The bedroom Z is of puerperal Q and the bed Y is in bedroom Z.</td>
  </tr>
   <tr>
    <td height="40">Conclusion</td>
     <td height="40">Therefore, bed Y is of puerperal Q.</td>
  </tr>
</table>

``` javascript
defeasible_rule(bed_is_puerperal(Y,Q),[hospital_Bed(Y),bedroom(Z),is_in(Y,Z),bedroom_is_puerperal(Z,Q)])[as(_)]
```

``` css
Hospital_Bed(?Y),Bedroom(?Z),is-in(?Y,?Z),bedroom-is-puerperal(?Z,?Q)->bed-is-puerperal(?Y,?Q)
```

<br>
<br>

<table>
  <tr>
    <td height="40">Major Premise</td>
    <td height="40">
    If a patient occupies a bed and is of puerperal Q, this bed will be of puerperal Q too.
    </td>
  </tr>
  <tr>
    <td height="40">Minor Premise</td>
    <td height="40">Patient X occupies bed Y and is of puerperal Q.</td>
  </tr>
   <tr>
    <td height="40">Conclusion</td>
     <td height="40">Therefore, bed Y is of puerperal Q.</td>
  </tr>
</table>

``` javascript
defeasible_rule(bed_is_puerperal(Y,Q),[patient(X),is_puerperal(X,Q),hospital_Bed(Y),occupy_one(X,Y)])[as(_)]
```

``` css
Patient(?X),is-puerperal(?X,?Q),Hospital_Bed(?Y),occupy-one(?X,?Y)->bed-is-puerperal(?Y,?Q)
```

<br>
<br>

<table>
  <tr>
    <td height="40">Major Premise</td>
    <td height="40">
      If a bed is in bedroom Z and is of puerperal Q, bedroom Z is of puerperial Q too.
   </td>
  </tr>
  <tr>
    <td height="40">Minor Premise</td>
    <td height="40">Bed Y is in bedroom Z and bed Y is of puerperial Q.</td>
  </tr>
   <tr>
    <td height="40">Conclusion</td>
     <td height="40">Therefore, bedroom Z is of puerperial Q.</td>
  </tr>
</table>

``` javascript
defeasible_rule(bedroom_is_puerperal(Z,Q),[hospital_Bed(Y),bedroom(Z),is_in(Y,Z),bed_is_puerperal(Y,Q)])[as(_)]
```

``` css
Hospital_Bed(?Y),Bedroom(?Z),is-in(?Y,?Z),bed-is-puerperal(?Y,?Q)->bedroom-is-puerperal(?Z,?Q)
```

<br>
<br>

<table>
  <tr>
    <td height="40">Major Premise</td>
    <td height="40">
 	 If a patient occupies a bed and is discharged, this bed will be vacated by this patient.
    </td>
  </tr>
  <tr>
    <td height="40">Minor Premise</td>
    <td height="40">Patient X occupies bed Y and was discharged.</td>
  </tr>
   <tr>
    <td height="40">Conclusion</td>
     <td height="40">Therefore, patient X has vacated bed Y.</td>
  </tr>
</table>

``` javascript
defeasible_rule(vacates_one(X,Y),[patient(X),is_discharged_from(X,D),occupy_one(X,Y)])[as(_)]
```

``` css
Patient(?X),is-discharged-from(?X,?D),occupy-one(?X,?Y)->vacates-one(?X,?Y),is-vacated-by(?Y,?X)
```

<br>
<br>

<table>
  <tr>
    <td height="40">Major Premise</td>
    <td height="40">
 	If a patient is classified as urgent, this patient needs assistance like hospitalisation.
    </td>
  </tr>
  <tr>
    <td height="40">Minor Premise</td>
    <td height="40">Patient X is classified as urgent.</td>
  </tr>
   <tr>
    <td height="40">Conclusion</td>
     <td height="40">Therefore, patient X needs assistance like hospitalisation.</td>
  </tr>
</table>

``` javascript
defeasible_rule(needs_assistance_like(X,hospitalisation),[patient(X),is_classified_as(X,urgent)])[as(_)]
```

``` css
Patient(?X),is-classified-as(?X,Urgent)->needs-assistance-like(?X,Hospitalisation)
```
