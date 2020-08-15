* get cleaned data (new one)

* land area
import delimited "C:\Users\czs0066\Desktop\round 2\data\land area.csv"
drop if state=="ALASKA"
drop if state=="HAWAII"
keep year state stateansi agdistrict agdistrictcode county countyansi value 

gen id=1000*stateansi+countyansi
rename value landarea

save "C:\Users\czs0066\Desktop\round3\data\landarea.dta"

* net income
clear all
import delimited "C:\Users\czs0066\Desktop\round 2\data\net income.csv"
drop if state=="ALASKA"
drop if state=="HAWAII"
gen id=1000*stateansi+countyansi
keep year value id
rename value netincome
save "C:\Users\czs0066\Desktop\round3\data\netincome.dta", replace

* crop land 
clear all
import delimited "C:\Users\czs0066\Desktop\round 2\data\cropland.csv"
drop if state=="ALASKA"
drop if state=="HAWAII"
gen id=1000*stateansi+countyansi
keep year value id
rename value cropland
save "C:\Users\czs0066\Desktop\round3\data\cropland.dta", replace

* farmland
clear all
import delimited "C:\Users\czs0066\Desktop\round 2\data\farmland.csv"
drop if state=="ALASKA"
drop if state=="HAWAII"
gen id=1000*stateansi+countyansi
keep year value id
rename value farmland
save "C:\Users\czs0066\Desktop\round3\data\farmland.dta", replace

* woodland
clear all
import delimited "C:\Users\czs0066\Desktop\round 2\data\woodland.csv"
drop if state=="ALASKA"
drop if state=="HAWAII"
gen id=1000*stateansi+countyansi
keep year value id
rename value woodland
save "C:\Users\czs0066\Desktop\round3\data\woodland.dta", replace

* pesture land (pstld)
clear all
import delimited "C:\Users\czs0066\Desktop\round 2\data\pesture land.csv"
drop if state=="ALASKA"
drop if state=="HAWAII"
gen id=1000*stateansi+countyansi
keep year value id
rename value pstld
save "C:\Users\czs0066\Desktop\round3\data\pstld.dta", replace

* expense
clear all
import delimited "C:\Users\czs0066\Desktop\round 2\data\expense.csv"
drop if state=="ALASKA"
drop if state=="HAWAII"
gen id=1000*stateansi+countyansi
keep year value id
rename value expense
save "C:\Users\czs0066\Desktop\round3\data\expense.dta", replace

* cash rent
clear all
import delimited "C:\Users\czs0066\Desktop\round 2\data\cash rent.csv"
drop if state=="ALASKA"
drop if state=="HAWAII"
gen id=1000*stateansi+countyansi
keep year value id
rename value cashrent
save "C:\Users\czs0066\Desktop\round3\data\cashrent.dta", replace

* irrigate
clear all
import delimited "C:\Users\czs0066\Desktop\round 2\data\irrigate.csv"
drop if state=="ALASKA"
drop if state=="HAWAII"
gen id=1000*stateansi+countyansi
keep year value id
rename value irrigate
save "C:\Users\czs0066\Desktop\round3\data\irrigate.dta", replace

* ag land value
clear all
import delimited "C:\Users\czs0066\Desktop\round 2\data\ag land value.csv"
drop if state=="ALASKA"
drop if state=="HAWAII"
gen id=1000*stateansi+countyansi
keep year value id
rename value ldvalue
save "C:\Users\czs0066\Desktop\round3\data\ldvalue.dta", replace

* crop value
clear all
import delimited "C:\Users\czs0066\Desktop\round 2\data\crop value.csv"
drop if state=="ALASKA"
drop if state=="HAWAII"
gen id=1000*stateansi+countyansi
keep year value id
rename value cropvalue
save "C:\Users\czs0066\Desktop\round3\data\cropvalue.dta", replace

* labor expense
clear all
import delimited "C:\Users\czs0066\Desktop\round 2\data\labor expense.csv"
drop if state=="ALASKA"
drop if state=="HAWAII"
gen id=1000*stateansi+countyansi
keep year value id
rename value lbexpense
save "C:\Users\czs0066\Desktop\round3\data\labor expense.dta", replace

* fertilizer
clear all
import delimited "C:\Users\czs0066\Desktop\round3\data\fertilizer.csv"
drop if state=="ALASKA"
drop if state=="HAWAII"
gen id=1000*stateansi+countyansi
keep year value id
rename value fertilizer
save "C:\Users\czs0066\Desktop\round3\data\fertilizer.dta", replace


* chemical use
clear all
import delimited "C:\Users\czs0066\Desktop\round3\data\chemical.csv"
drop if state=="ALASKA"
drop if state=="HAWAII"
gen id=1000*stateansi+countyansi
keep year value id
rename value chemical
save "C:\Users\czs0066\Desktop\round3\data\chemical.dta", replace


* merge together
use "C:\Users\czs0066\Desktop\round3\data\landarea.dta", clear
sort year id
merge m:n year id using "C:\Users\czs0066\Desktop\round3\data\netincome.dta"
drop _merge
save "C:\Users\czs0066\Desktop\round3\data\newdata.dta"

use "C:\Users\czs0066\Desktop\round3\data\newdata.dta", clear
sort year id
merge m:n year id using "C:\Users\czs0066\Desktop\round3\data\cropland.dta"
drop _merge
save "C:\Users\czs0066\Desktop\round3\data\newdata.dta", replace

use "C:\Users\czs0066\Desktop\round3\data\newdata.dta", clear
sort year id
merge m:n year id using "C:\Users\czs0066\Desktop\round3\data\farmland.dta"
drop _merge
save "C:\Users\czs0066\Desktop\round3\data\newdata.dta", replace

use "C:\Users\czs0066\Desktop\round3\data\newdata.dta", clear
sort year id
merge m:n year id using "C:\Users\czs0066\Desktop\round3\data\woodland.dta"
drop _merge
save "C:\Users\czs0066\Desktop\round3\data\newdata.dta", replace

use "C:\Users\czs0066\Desktop\round3\data\newdata.dta", clear
sort year id
merge m:n year id using "C:\Users\czs0066\Desktop\round3\data\pstld.dta"
drop _merge
save "C:\Users\czs0066\Desktop\round3\data\newdata.dta", replace

use "C:\Users\czs0066\Desktop\round3\data\newdata.dta", clear
sort year id
merge m:n year id using "C:\Users\czs0066\Desktop\round3\data\expense.dta"
drop _merge
save "C:\Users\czs0066\Desktop\round3\data\newdata.dta", replace

use "C:\Users\czs0066\Desktop\round3\data\newdata.dta", clear
sort year id
merge m:n year id using "C:\Users\czs0066\Desktop\round3\data\cashrent.dta"
drop _merge
save "C:\Users\czs0066\Desktop\round3\data\newdata.dta", replace

use "C:\Users\czs0066\Desktop\round3\data\newdata.dta", clear
sort year id
merge m:n year id using "C:\Users\czs0066\Desktop\round3\data\irrigate.dta"
drop _merge
save "C:\Users\czs0066\Desktop\round3\data\newdata.dta", replace

use "C:\Users\czs0066\Desktop\round3\data\newdata.dta", clear
sort year id
merge m:n year id using "C:\Users\czs0066\Desktop\round3\data\ldvalue.dta"
drop _merge
save "C:\Users\czs0066\Desktop\round3\data\newdata.dta", replace

use "C:\Users\czs0066\Desktop\round3\data\newdata.dta", clear
sort year id
merge m:n year id using "C:\Users\czs0066\Desktop\round3\data\cropvalue.dta"
drop _merge
save "C:\Users\czs0066\Desktop\round3\data\newdata.dta", replace

use "C:\Users\czs0066\Desktop\round3\data\newdata.dta", clear
sort year id
merge m:n year id using "C:\Users\czs0066\Desktop\round3\data\labor expense.dta"
drop _merge
save "C:\Users\czs0066\Desktop\round3\data\newdata.dta", replace

use "C:\Users\czs0066\Desktop\round3\data\newdata.dta", clear
sort year id
merge m:n year id using "C:\Users\czs0066\Desktop\round3\data\fertilizer.dta"
drop _merge
save "C:\Users\czs0066\Desktop\round3\data\newdata.dta", replace

use "C:\Users\czs0066\Desktop\round3\data\newdata.dta", clear
sort year id
merge m:n year id using "C:\Users\czs0066\Desktop\round3\data\chemical.dta"
drop _merge
save "C:\Users\czs0066\Desktop\round3\data\newdata.dta", replace




* about subsity
clear all
use "C:\Users\czs0066\Desktop\round 2\data\subsidies\02.dta"
drop if v3=="AK"|v3=="HI"
gen id=1000*v2+v4
rename v1 year
rename subs2 sub
keep year id sub ttpre
save "C:\Users\czs0066\Desktop\round3\data\sub02.dta", replace

clear all
use "C:\Users\czs0066\Desktop\round 2\data\subsidies\07.dta"
drop if v3=="AK"|v3=="HI"
gen id=1000*v2+v4
rename v1 year
rename subs2 sub2
rename ttpre ttpre2
keep year id sub2 ttpre2
save "C:\Users\czs0066\Desktop\round3\data\sub07.dta", replace

clear all
use "C:\Users\czs0066\Desktop\round 2\data\subsidies\12.dta"
drop if v3=="AK"|v3=="HI"
gen id=1000*v2+v4
rename v1 year
rename subs2 sub3
rename ttpre ttpre3
keep year id sub3 ttpre3
save "C:\Users\czs0066\Desktop\round3\data\sub12.dta", replace

* merge subsidy

use "C:\Users\czs0066\Desktop\round3\data\newdata.dta", clear
sort year id
merge m:n year id using "C:\Users\czs0066\Desktop\round3\data\sub02.dta"
drop _merge
save "C:\Users\czs0066\Desktop\round3\data\newdata.dta", replace

use "C:\Users\czs0066\Desktop\round3\data\newdata.dta", clear
sort year id
merge m:n year id using "C:\Users\czs0066\Desktop\round3\data\sub07.dta"
drop _merge
save "C:\Users\czs0066\Desktop\round3\data\newdata.dta", replace

use "C:\Users\czs0066\Desktop\round3\data\newdata.dta", clear
sort year id
merge m:n year id using "C:\Users\czs0066\Desktop\round3\data\sub12.dta"
drop _merge
save "C:\Users\czs0066\Desktop\round3\data\newdata.dta", replace

replace sub=sub2 if year==2007
replace sub=sub3 if year==2012

replace ttpre=ttpre2 if year==2007
replace ttpre=ttpre3 if year==2012 

drop sub2 sub3 ttpre2 ttpre3
destring countyansi-chemical, replace force ignor(",")

save "C:\Users\czs0066\Desktop\round3\data\newdata.dta", replace

* Oh yeah~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~





