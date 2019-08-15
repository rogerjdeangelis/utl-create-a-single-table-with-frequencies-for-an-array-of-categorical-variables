%let pgm=utl-create-a-single-table-with-frequencies-for-an-array-of-categorical-variables;

Create a single table with frequencies for an array of categorical variables;

"Is there a way to find the frequency of all of the responses of several categorical
variables and output this data in a new data set?"

    Seven Soltions

     a. SQl array solution

         1 no need to normalize
         2 Single SQL solution

     b.  1 and 2 are done while reading in the data

         1. Informat to convert codes to descriptions
         2. Normalize (make long and skinny)

         3. Sort for freq
         4. proc freq

     c.  Hash by
         Keintz, Mark
         mkeintz@wharton.upenn.edu

     d through f produce the following output
                                                     NEITHER_
                  NO__STRONGLY_    NO__SOMEWHAT_    AGREE_NOR_    YES__SOMEWHAT_    YES__STRONGLY_
          VAR        DISAGREE         DISAGREE       DISAGREE          AGREE             AGREE

         A1Q1           3                2               .               .                 .
         A2Q1           3                1               1               .                 .

     d.  Level descriptions across (see output below most flexible for fat output)
         Nat Wooding
         nathani@verizon.net

     e.  proc corresp

     f.  porc report


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
(_)_ __  _ __  _   _| |_ ___
| | '_ \| '_ \| | | | __/ __|
| | | | | |_) | |_| | |_\__ \
|_|_| |_| .__/ \__,_|\__|___/
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
cards4;
1 2 1 1 3 3 4 2 5 3 2
2 1 1 1 1 1 1 1 1 1 1
3 2 3 4 5 1 2 3 4 5 1
4 1 2 3 4 5 5 4 3 2 1
5 1 1 1 1 1 1 1 1 1 1
;;;;
run;quit

********************;
* SOLUTION C HASH  *;
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

* used with solution c;
data have;
informat A 1Q1 A2Q1 RFQ1 SE1Q1 SE2Q1 SE3Q1 SE4Q1 I1Q1 I2Q1 I3Q1 $lvl2des.;
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

*          _               _
  ___     | |__   __ _ ___| |__
 / __|    | '_ \ / _` / __| '_ \
| (__ _   | | | | (_| \__ \ | | |
 \___(_)  |_| |_|\__,_|___/_| |_|

;

WORK.WANT total obs=33

   VNAME              VALUE               FREQ

   A1Q1     No, somewhat disagree           2
   A1Q1     No, strongly disagree           3
   A2Q1     Neither agree nor disagree      1
   A2Q1     No, somewhat disagree           1
   A2Q1     No, strongly disagree           3
   I1Q1     Neither agree nor disagree      1
   I1Q1     No, strongly disagree           2
   I1Q1     Yes, somewhat agree             1
   I1Q1     Yes, strongly agree             1
   I2Q1     Neither agree nor disagree      1
   I2Q1     No, somewhat disagree           1
   I2Q1     No, strongly disagree           2
   I2Q1     Yes, strongly agree             1
   I3Q1     No, somewhat disagree           1
   I3Q1     No, strongly disagree           4
   RFQ1     Neither agree nor disagree      1
   RFQ1     No, strongly disagree           3
   RFQ1     Yes, somewhat agree             1
   SE1Q1    Neither agree nor disagree      1
   SE1Q1    No, strongly disagree           2
   SE1Q1    Yes, somewhat agree             1
   SE1Q1    Yes, strongly agree             1
   SE2Q1    Neither agree nor disagree      1
   SE2Q1    No, strongly disagree           3
   SE2Q1    Yes, strongly agree             1
   SE3Q1    No, somewhat disagree           1
   SE3Q1    No, strongly disagree           2
   SE3Q1    Yes, somewhat agree             1
   SE3Q1    Yes, strongly agree             1
   SE4Q1    Neither agree nor disagree      1
   SE4Q1    No, somewhat disagree           1
   SE4Q1    No, strongly disagree           2
   SE4Q1    Yes, somewhat agree             1

*    _              __        _
  __| |            / _|    __| | ___  ___  ___    __ _  ___ _ __ ___  ___ ___
 / _` |    _____  | |_    / _` |/ _ \/ __|/ __|  / _` |/ __| '__/ _ \/ __/ __|
| (_| |_  |_____| |  _|  | (_| |  __/\__ \ (__  | (_| | (__| | | (_) \__ \__ \
 \__,_(_)         |_|(_)  \__,_|\___||___/\___|  \__,_|\___|_|  \___/|___/___/

;


WORK.WANT total obs=10

                                                   NEITHER_
                NO__STRONGLY_    NO__SOMEWHAT_    AGREE_NOR_    YES__SOMEWHAT_    YES__STRONGLY_
Obs     VAR        DISAGREE         DISAGREE       DISAGREE          AGREE             AGREE

  1    A1Q1           3                2               .               .                 .
  2    A2Q1           3                1               1               .                 .
  3    I1Q1           2                .               1               1                 1
  4    I2Q1           2                1               1               .                 1
  5    I3Q1           4                1               .               .                 .
  6    RFQ1           3                .               1               1                 .
  7    SE1Q1          2                .               1               1                 1
  8    SE2Q1          3                .               1               .                 1
  9    SE3Q1          2                1               .               1                 1
 10    SE4Q1          2                1               1               1                 .


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

ods output observed=want;
proc corresp data=have dim=1 observed;
tables var, val;
run;quit;

*          _               _
  ___     | |__   __ _ ___| |__
 / __|    | '_ \ / _` / __| '_ \
| (__ _   | | | | (_| \__ \ | | |
 \___(_)  |_| |_|\__,_|___/_| |_|

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

* used with solution c;
data have;
  informat A1Q1 A2Q1 RFQ1 SE1Q1 SE2Q1 SE3Q1 SE4Q1 I1Q1 I2Q1 I3Q1 $lvl2des.;
  input id A1Q1 A2Q1 RFQ1 SE1Q1 SE2Q1 SE3Q1 SE4Q1 I1Q1 I2Q1 I3Q1;
cards4;
1 2 1 1 3 3 4 2 5 3 2
2 1 1 1 1 1 1 1 1 1 1
3 2 3 4 5 1 2 3 4 5 1
4 1 2 3 4 5 5 4 3 2 1
5 1 1 1 1 1 1 1 1 1 1
;;;;
run;quit;

/*
Keintz, Mark
mkeintz@wharton.upenn.edu

If you key a hash object on the variable name and value,
I suspect the hash object would be just as fast:
*/

data _null_;
  array vn {10} $44  _temporary_ ("A1Q1" "A2Q1" "RFQ1" "SE1Q1" "SE2Q1" "SE3Q1" "SE4Q1" "I1Q1" "I2Q1" "I3Q1");
  length vname $32 value $44;
  if _n_=1 then do;
    call missing(vname,value,freq);
    declare hash  h(ordered:'a');
      h.definekey('vname','value');
      h.definedata('vname','value','freq');
      h.definedone();
  end;
  set have end=dne;
  do i=1 to 10;
    vname=vn{i};
    value=vvaluex(vname);
    freq=ifn(h.find()=0,sum(freq,1),1);
    h.replace();
  end;
  if dne then h.output(dataset:'want');
run;

Note, in the IFN statement, this depends on the H.FIND() method (as the first IFN argument)
updating the value of FREQ prior to the evaluation of sum(freq,1).

This appears to be survey data and I doubt that the data set will ever be very large.


*    _          _
  __| |      __| | ___  ___  ___    __ _  ___ _ __ ___  ___ ___
 / _` |     / _` |/ _ \/ __|/ __|  / _` |/ __| '__/ _ \/ __/ __|
| (_| |_   | (_| |  __/\__ \ (__  | (_| | (__| | | (_) \__ \__ \
 \__,_(_)   \__,_|\___||___/\___|  \__,_|\___|_|  \___/|___/___/

;
/*
I deal with this sort of issue frequently and while I do use Proc Freq when I can, I often
have situations where not all of the possible responses are selected as in your data so
that the output tables don't show responses for all of the categories. It would be really
nice if Freq offered a completetypes option such as is available in Summary/Means -
at least, if it is there, I hav
e never found it.

 My solution is often as is shown below. Are parts kludgey , well, yes. Does it give
a table with all cells and arranged in logical order, well, yes. It might be done with
Proc Report but the nature of my work over much of my career has been working with
tables that were assemblages of a variety of statistics that did not work with
Report or Tabulate so I always built my output tab
les with combinations of data and proc steps and finally a Transpose.

Anyway, here's another solution.

Nat Wooding
*/

proc format;
  value lvl2des
1="No, strongly disagree    "
2="No, somewhat disagree    "
3="Neither agree nor disagree"
4="Yes, somewhat agree      "
5="Yes, strongly agree      "
;run; quit;

data have;
input id A1Q1 A2Q1 RFQ1 SE1Q1 SE2Q1 SE3Q1 SE4Q1 I1Q1 I2Q1 I3Q1;
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
run;

proc sort data=have out=havsrt noequals;
by var descending val;
run;quit;

proc means data=havsrt completetypes noprint;
format val lvl2des.;
by var descending val;
var val;
output out = havFrq N=N;
run;

options missing = 0;
* To be tidy, create an null data set with our class values in order.
This is prepended to the means output set so when the
combined set is transposed, the columns will read in the
logical order. In the output of Transpose, the line with the
missing VAL is removed;
* Kludgy, well, OK, but this gives us a readable complete table;

Proc Sort data = hAVFrq out = MT ( keep = val ) nodupkey;
     By val;
run;

Data havTpl ;
     Format var $44. ;
       set MT HAVfRQ;
run;

Proc Transpose data = havTpl out = want ( drop = _: where = ( var gt '  ' ));
     var n;
       by var;
       id val;
run;
*
  ___      _ __  _ __ ___   ___    ___ ___  _ __ _ __ ___  ___ _ __
 / _ \    | '_ \| '__/ _ \ / __|  / __/ _ \| '__| '__/ _ \/ __| '_ \
|  __/_   | |_) | | | (_) | (__  | (_| (_) | |  | | |  __/\__ \ |_) |
 \___(_)  | .__/|_|  \___/ \___|  \___\___/|_|  |_|  \___||___/ .__/
          |_|                                                 |_|
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


ods output observed=want;
proc corresp data=have dim=1 observed;
tables var, val;
run;quit;

* __                                                      _
 / _|    _ __  _ __ ___   ___   _ __ ___ _ __   ___  _ __| |_
| |_    | '_ \| '__/ _ \ / __| | '__/ _ \ '_ \ / _ \| '__| __|
|  _|   | |_) | | | (_) | (__  | | |  __/ |_) | (_) | |  | |_
|_|(_)  | .__/|_|  \___/ \___| |_|  \___| .__/ \___/|_|   \__|
        |_|                             |_|
;

* used with solution b;
* format used with datastep normailzation;
proc format;
  invalue $lvl2des
1="1 No, strongly disagree     "
2="2 No, somewhat disagree     "
3="3 Neither agree nor disagree"
4="4 Yes, somewhat agree       "
5="5 Yes, strongly agree       "
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
run;quit;;


* not I added the code value to the format label;
* across text comes out in alphabetic order which is the order we want;

options validvarname=any;
proc report  data=have nowd missing out=want(rename=(
 _C2_="1 No, strongly disagree     "n
 _C3_="2 No, somewhat disagree     "n
 _C4_="3 Neither agree nor disagree"n
 _C5_="4 Yes, somewhat agree       "n
 _C6_="5 Yes, strongly agree       "n ));
cols var val;
define var / group format=$8.;
define val / across ;
run;quit;


