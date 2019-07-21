%let pgm=utl-create-a-single-table-with-frequencies-for-an-array-of-categorical-variables;

SAS fORUM:
Create a single table with frequencies for an array of categorical variables;

"Is there a way to find the frequency of all of the responses of several categorical
variables and output this data in a new data set?"

    Two Soltions

     a. SQl array solution

         1 no need to normalize
         2 Single SQL solution

     b.  1 and 2 are done while reading in the data

         1. Informat to convert codes to descriptions
         2. Normalize (make long and skinny)

         3. Sort for freq)
         4. proc freq

github
https://tinyurl.com/yxskcec3
https://github.com/rogerjdeangelis/utl-create-a-single-table-with-frequencies-for-an-array-of-categorical-variables

SAS Forum
https://tinyurl.com/y34hwotc
https://communities.sas.com/t5/New-SAS-User/Outputting-a-Data-Set-Using-Proc-Freq-That-Gives-Frequency-of/m-p/574820

macros
https://tinyurl.com/y9nfugth
https://github.com/rogerjdeangelis/utl-macros-used-in-many-of-rogerjdeangelis-repositories
*_                   _
(_)_ __  _ __  _   _| |_
| | '_ \| '_ \| | | | __|
| | | | | |_) | |_| | |_
|_|_| |_| .__/ \__,_|\__|
        |_|
;
\*******************;
* SOLUTION A INPUT *;
********************;

* used with solution a;
data havSql;
input id A1Q1 A2Q1 RFQ1 SE1Q1 SE2Q1 SE3Q1 SE4Q1 I1Q1 I2Q1 I3Q1;
cards4;
1 2 1 1 3 3 4 2 5 3 2
2 1 1 1 1 1 1 1 1 1 1
3 2 3 4 5 1 2 3 4 5 1
4 1 2 3 4 5 5 4 3 2 1
5 1 1 1 1 1 1 1 1 1 1
;;;;
run;quit

* format for SQL;
proc format;
  value lvl2des
1="No, strongly disagree     "
2="No, somewhat disagree     "
3="Neither agree nor disagree"
4="Yes, somewhat agree       "
5="Yes, strongly agree       "
;run;quit;


********************;
* SOLUTION B INPUT *;
********************;

* used with solution b;
* format used with datastep normailzation;
proc format;
  invalue $lvl2des
1="No, strongly disagree     "
2="No, somewhat disagree     "
3="Neither agree nor disagree"
4="Yes, somewhat agree       "
5="Yes, strongly agree       "
;run;quit;

* used with solution b;
data have;
informat A1Q1 A2Q1 RFQ1 SE1Q1 SE2Q1 SE3Q1 SE4Q1 I1Q1 I2Q1 I3Q1 $lvl2des.;
input id A1Q1 A2Q1 RFQ1 SE1Q1 SE2Q1 SE3Q1 SE4Q1 I1Q1 I2Q1 I3Q1 $lvl2des.;
array vars[10] A1Q1 A2Q1 RFQ1 SE1Q1 SE2Q1 SE3Q1 SE4Q1 I1Q1 I2Q1 I3Q1;
do i=1 to dim(vars);
   var=vname(vars[i]);
   val=vars[i];
   output;
   keep var val;
end;
cards4;
1 2 1 1 3 3 4 2 5 3 2
2 1 1 1 1 1 1 1 1 1 1
3 2 3 4 5 1 2 3 4 5 1
4 1 2 3 4 5 5 4 3 2 1
5 1 1 1 1 1 1 1 1 1 1
;;;;
run;quit
*            _               _
  ___  _   _| |_ _ __  _   _| |_ ___
 / _ \| | | | __| '_ \| | | | __/ __|
| (_) | |_| | |_| |_) | |_| | |_\__ \
 \___/ \__,_|\__| .__/ \__,_|\__|___/
                |_|
  __ _      ___  __ _| |
 / _` |    / __|/ _` | |
| (_| |_   \__ \ (_| | |
 \__,_(_)  |___/\__, |_|
                   |_|
;

WORK.WANTSQL total obs=33

Obs     VAR                GRP                CNT

  1    A1Q1     No, somewhat disagree          2
  2    A1Q1     No, strongly disagree          3

  3    A2Q1     Neither agree nor disagree     1
  4    A2Q1     No, somewhat disagree          1
  5    A2Q1     No, strongly disagree          3

  6    I1Q1     Neither agree nor disagree     1
  7    I1Q1     No, strongly disagree          2
  8    I1Q1     Yes, somewhat agree            1
  9    I1Q1     Yes, strongly agree            1

 10    I2Q1     Neither agree nor disagree     1
 11    I2Q1     No, somewhat disagree          1
 12    I2Q1     No, strongly disagree          2
 13    I2Q1     Yes, strongly agree            1

 14    I3Q1     No, somewhat disagree          1
 15    I3Q1     No, strongly disagree          4

 16    RFQ1     Neither agree nor disagree     1
 17    RFQ1     No, strongly disagree          3
 18    RFQ1     Yes, somewhat agree            1

 19    SE1Q1    Neither agree nor disagree     1
 20    SE1Q1    No, strongly disagree          2
 21    SE1Q1    Yes, somewhat agree            1
 22    SE1Q1    Yes, strongly agree            1

 23    SE2Q1    Neither agree nor disagree     1
 24    SE2Q1    No, strongly disagree          3
 25    SE2Q1    Yes, strongly agree            1

 26    SE3Q1    No, somewhat disagree          1
 27    SE3Q1    No, strongly disagree          2
 28    SE3Q1    Yes, somewhat agree            1

 29    SE3Q1    Yes, strongly agree            1
 30    SE4Q1    Neither agree nor disagree     1
 31    SE4Q1    No, somewhat disagree          1
 32    SE4Q1    No, strongly disagree          2
 33    SE4Q1    Yes, somewhat agree            1

*_                                    _
| |__      _ __   ___  _ __ _ __ ___ | |_______
| '_ \    | '_ \ / _ \| '__| '_ ` _ \| |_  / _ \
| |_) |   | | | | (_) | |  | | | | | | |/ /  __/
|_.__(_)  |_| |_|\___/|_|  |_| |_| |_|_/___\___|

;

Up to 40 obs from WANT total obs=33

    VAR              VAL                FREQUENCY    PERCENT    CUMFREQUENCY    CUMPERCENT

   A1Q1   No, somewhat disagree             2           40            2              40
   A1Q1   No, strongly disagree             3           60            5             100

   A2Q1   Neither agree nor disagree        1           20            1              20
   A2Q1   No, somewhat disagree             1           20            2              40
   A2Q1   No, strongly disagree             3           60            5             100

   I1Q1   Neither agree nor disagree        1           20            1              20
   I1Q1   No, strongly disagree             2           40            3              60
   I1Q1   Yes, somewhat agree               1           20            4              80
   I1Q1   Yes, strongly agree               1           20            5             100

   I2Q1   Neither agree nor disagree        1           20            1              20
   I2Q1   No, somewhat disagree             1           20            2              40
   I2Q1   No, strongly disagree             2           40            4              80
   I2Q1   Yes, strongly agree               1           20            5             100

   I3Q1   No, somewhat disagree             1           20            1              20
   I3Q1   No, strongly disagree             4           80            5             100

   RFQ1   Neither agree nor disagree        1           20            1              20
   RFQ1   No, strongly disagree             3           60            4              80
   RFQ1   Yes, somewhat agree               1           20            5             100

   SE1Q1  Neither agree nor disagree        1           20            1              20
   SE1Q1  No, strongly disagree             2           40            3              60
   SE1Q1  Yes, somewhat agree               1           20            4              80
   SE1Q1  Yes, strongly agree               1           20            5             100

   SE2Q1  Neither agree nor disagree        1           20            1              20
   SE2Q1  No, strongly disagree             3           60            4              80
   SE2Q1  Yes, strongly agree               1           20            5             100

   SE3Q1  No, somewhat disagree             1           20            1              20
   SE3Q1  No, strongly disagree             2           40            3              60
   SE3Q1  Yes, somewhat agree               1           20            4              80
   SE3Q1  Yes, strongly agree               1           20            5             100

   SE4Q1  Neither agree nor disagree        1           20            1              20
   SE4Q1  No, somewhat disagree             1           20            2              40
   SE4Q1  No, strongly disagree             2           40            4              80
   SE4Q1  Yes, somewhat agree               1           20            5             100


*          _       _   _
 ___  ___ | |_   _| |_(_) ___  _ __  ___
/ __|/ _ \| | | | | __| |/ _ \| '_ \/ __|
\__ \ (_) | | |_| | |_| | (_) | | | \__ \
|___/\___/|_|\__,_|\__|_|\___/|_| |_|___/

  __ _      ___  __ _| |   __ _ _ __ _ __ __ _ _   _ ___
 / _` |    / __|/ _` | |  / _` | '__| '__/ _` | | | / __|
| (_| |_   \__ \ (_| | | | (_| | |  | | | (_| | |_| \__ \
 \__,_(_)  |___/\__, |_|  \__,_|_|  |_|  \__,_|\__, |___/
                   |_|                         |___/
;
data havSql;
input id A1Q1 A2Q1 RFQ1 SE1Q1 SE2Q1 SE3Q1 SE4Q1 I1Q1 I2Q1 I3Q1;
cards4;
1 2 1 1 3 3 4 2 5 3 2
2 1 1 1 1 1 1 1 1 1 1
3 2 3 4 5 1 2 3 4 5 1
4 1 2 3 4 5 5 4 3 2 1
5 1 1 1 1 1 1 1 1 1 1
;;;;
run;quit

* format for SQL;
proc format;
  value lvl2des
1="No, strongly disagree     "
2="No, somewhat disagree     "
3="Neither agree nor disagree"
4="Yes, somewhat agree       "
5="Yes, strongly agree       "
;run;quit;

%array(vars, values=A1Q1 A2Q1 RFQ1 SE1Q1 SE2Q1 SE3Q1 SE4Q1 I1Q1 I2Q1 I3Q1);

proc sql;
  create
     table wantsql as
     %do_over(vars,phrase=%str(
     select
        "?" as var
       ,put(?,lvl2des.       ) as grp
       ,count(calculated grp)  as cnt
     from
        havSQL
     group
        by ?, put(?,lvl2des.))
     ,between=union corr)
;quit;

*_                                    _
| |__      _ __   ___  _ __ _ __ ___ | |_______
| '_ \    | '_ \ / _ \| '__| '_ ` _ \| |_  / _ \
| |_) |   | | | | (_) | |  | | | | | | |/ /  __/
|_.__(_)  |_| |_|\___/|_|  |_| |_| |_|_/___\___|

;

* used with solution b;
* format used with datastep normailzation;
proc format;
  invalue $lvl2des
1="No, strongly disagree     "
2="No, somewhat disagree     "
3="Neither agree nor disagree"
4="Yes, somewhat agree       "
5="Yes, strongly agree       "
;run;quit;

* used with solution b;

data have;
informat A1Q1 A2Q1 RFQ1 SE1Q1 SE2Q1 SE3Q1 SE4Q1 I1Q1 I2Q1 I3Q1 $lvl2des.;
input id A1Q1 A2Q1 RFQ1 SE1Q1 SE2Q1 SE3Q1 SE4Q1 I1Q1 I2Q1 I3Q1 $lvl2des.;
array vars[10] A1Q1 A2Q1 RFQ1 SE1Q1 SE2Q1 SE3Q1 SE4Q1 I1Q1 I2Q1 I3Q1;
do i=1 to dim(vars);
   var=vname(vars[i]);
   val=vars[i];
   output;
   keep var val;
end;
cards4;
1 2 1 1 3 3 4 2 5 3 2
2 1 1 1 1 1 1 1 1 1 1
3 2 3 4 5 1 2 3 4 5 1
4 1 2 3 4 5 5 4 3 2 1
5 1 1 1 1 1 1 1 1 1 1
;;;;
run;quit;

proc sort data=have out=havsrt noequals;
by var;
run;quit;

ods output onewayfreqs=want ;
proc freq data=havsrt;
by var;
 tables val / missing;
run;quit;;

