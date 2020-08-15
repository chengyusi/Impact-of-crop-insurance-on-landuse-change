
*extimation 


import excel "C:\Users\czs0066\Desktop\round 2\data\all4.xls", sheet("Sheet1") firstrow clear
destring _all, replace
drop if State=="AK"
drop if State=="HI"
summarize

gen irgs=irrigatedacer/landarea
gen uirgs=(farmlandacer-irrigatedacer)/landarea

gen crps=cropland/landarea
gen wuds=woodland/landarea
gen psts=pastureland/landarea

gen aexp=expense/farmlandacer/1000
gen asub=sub/cropland
gen acrpv=cropvalue/cropland/1000
gen antic=netincome/farmlandacer/1000
gen acashrent=cashrent/farmlandacer/1000
gen albexp=laborexpense/farmlandacer
gen landv=landvalueperacer/1000

xi i.Year


* gen county id
encode State, gen(stateid)
encode County, gen(countyid)
gen id=10000*stateid+countyid


* take log of dollar
gen laexp=log(aexp)
gen lasub=log(asub)
gen lacrpv=log(acrpv)
gen lantic=log(antic)
gen lacashrent=log(acashrent)
gen lalbexp=log(albexp)
gen llandv=log(landv)




drop if irgs>1
drop if uirgs>1
drop if uirgs<0
drop if crps>1
drop if wuds>1
drop if psts>1

*check correlation
pwcorr landvalueperacer acashrent antic acrpv asub aexp, sig

*check correlation (fail)
pwcorr irgs farmlandacer, sig
pwcorr asub farmlandacer, sig
pwcorr uirgs farmlandacer, sig
pwcorr crps cropland, sig
pwcorr wuds cropland, sig
pwcorr psts cropland, sig


*regression
*merginal effects without dummy

fracreg logit irgs llandv lacashrent lantic lacrpv lasub laexp i.Year, vce(cluster stateid)
margins, dyex(_all)


fracreg logit uirgs llandv lacashrent lantic lacrpv lasub laexp i.Year, vce(cluster stateid)
est store c2
margins, dyex(_all)


fracreg logit crps llandv lacashrent lantic lacrpv lasub laexp i.Year, vce(cluster stateid)
est store c3
margins, dyex(_all)


fracreg logit wuds llandv lacashrent lantic lacrpv lasub laexp i.Year, vce(cluster stateid)
est store c4
margins, dyex(_all)


fracreg logit psts llandv lacashrent lantic lacrpv lasub laexp i.Year, vce(cluster stateid)
est store c5
margins, dyex(_all)


esttab c1 c2 c3 c4 c5 using test.rtf, se replace










