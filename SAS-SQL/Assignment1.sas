proc odstext;
p "SAS_STAT40840 - Assignment 1" /
style=[font_size= 20pt fontweight=bold just= c];
p "My Name is Yusen Xie" /
style=[font_size= 18pt just= c];
p "Student No. 20211194" /
style=[font_size= 18pt just= c];


*1.Import the valentia.csv file and call the resulting table ‘weather’. The first row contains 
the column names. ;
TITLE2 "Question 1";
 PROC import out=s40840.weather
	datafile= "/home/u61605414/sasuser.v94/STAT40840-data/valentia.csv" DBMS=CSV REPLACE;
	getnames=yes;
	datarow=2;
run;

proc odstext;
	
	P "I have already imported the data using a PROC import statement"
/ Style={font_size= 12pt font_face='cambria' leftmargin =.75in rightmargin =.25in just= l};

*I don't know why. I deleted this part of the imported data and the problem shows up above the title for a while, 
so it's strange..;


Title "Question 2";
*2.Use the ‘contents’ procedure to print the contents of the table, with variables listed in
the order they appear in the table. How many variables are there? In what format is
the year variable stored?;
PROC contents data=s40840.weather varnum;
run;
/* varnum implements ordered alignment */
proc odstext;
P "There are 27 variables and the year format is BEST12 and stored is NUMBER" 
/ Style={font_size= 12pt font_face='cambria' leftmargin =.75in rightmargin =.25in just= l};




Title "Question 3";
* 3. Print the first 10 rows of the table, including only the date, month, year, maximum */
  temperature, minimum temperature, and rain variables. What is the value of rain in */
 the 8th row?  ;

PROC print data=s40840.weather(obs=10);
	var date month year maxtp mintp rain;
	run;
proc odstext;
P "The value of rain in row 8 is 0.2" 
/ Style={font_size= 12pt font_face='cambria' leftmargin =.75in rightmargin =.25in just= l};	
run;


Title  "Question 4";
* 4. Adapting the code from a snippet, or otherwise, create a scatterplot matrix of the */
 maximum temperature, minimum temperature, rain, and wind speed variables for the */
 year 2021. Include a title and appropriate labels for the variables on the plot. Colour */
 the observations red, with a transparency level of 0.5. Comment on the relationships */
 between the variables. ;

title 'the temperature and rain of scatter plot';
proc sgscatter data=s40840.weather;
label mintp=minimum;
label maxtp=maximum;
label wdsp=wind speed;
label rain= the Rainfall;
where year=2021;
matrix maxtp mintp rain wdsp/
     transparency=0.5 markerattrs=graphdata3(symbol=circlefilled color=red) ;
  run;
  
  proc odstext;
p"   The maximum temperature and minimum temperature show a positive linear correlation, and similarly rain and average wind speed show the same linear relationship. In other words, there is a very high dependence between them "/
style=[font_size= 14pt font_style= italic just= c];
run;

  



Title  "Question 5";
*5. Create a new table using a data step which overwrites the existing table. In this
new table, rename the maximum temperature, minimum temperature, and windspeed
variables as Max Temp, Min Temp and Wind Speed respectively. Print the first 5 rows
of this table to confirm that the change was successful, showing only the date, month,
year, maximum temperature, minimum temperature, and wind speed variables.;


DATA s40840.weather;
	set s40840.weather;
	rename maxtp = MaxTemp
		mintp=MinTemp
		wdsp=WindSpeed;
run;
PROC print data=s40840.weather (obs=5);
/*Number of lines printed  */
var date month year MaxTemp MinTemp WindSpeed;
/* Variables to be displayed */
run;

Title "Question 6";
*6. Create a new table with an additional variable recording the mean of the maximum
and minimum temperatures each day. Call this new variable ‘Mean Temp’;

DATA S40840.weather;
	set s40840.weather;
		MeanTemp = (MaxTemp+MinTemp)/2; 
run;


Title  "Question 7";
*7. Print a table containing only those observations where the mean temperature was less
than 1◦C. Include only the variables date, month, year, mean temperature and rain in
the resulting table. On how many of these days was rain recorded?;
PROC print data=s40840.weather;
	var  date month year MaxTemp MinTemp rain MeanTemp;
		where MeanTemp <1;
run;

proc odstext;
p"   There are Four days recording rain  "/
style=[font_size= 14pt font_style= italic just= c];
run;

Title "Question 8";
*8. Use the means procedure to find the mean, standard deviation, and maximum of the
mean temperature, rain, and wind speed variables in a single table. What was the
maximum wind speed? What was the maximum mean temperature?;
proc means data=S40840.weather;
var  MaxTemp MinTemp rain WindSpeed MeanTemp;
run;

proc odstext;
p"  The maximum wind speed is 30.8000000,the maximum average temperature is less 24.4000000 "/
style=[font_size= 14pt font_style= italic just= c];
run;

Title "Q9"
*9. Produce one plot of your choice from the data, and comment on what it tells us about
the dataset. It should be neat and clearly labelled.;

/*--Comparative Scatter Plot--*/

title 'MinTemp and soil by Rain and Windspeed';
proc sgscatter data=s40840.weather;
where year=2021 and 2020 ;
  compare x=(MinTemp rain) y=(soil WindSpeed) /
     transparency=0.5 markerattrs=graphdata1(symbol=circlefilled color=green);
  run;

proc odstext;
p "This graph explores the effect of rainfall and wind speed on the average rainfall and soil.
It is observed that as the rainfall increases, the wind speed becomes larger, but after the rainfall exceeds thirty, 
the wind speed gradually decreases to about 12, slightly above the average value of 9.53
As the wind speed and rainfall increase, its mean value also increases accordingly.
at the same time,The effect of rainfall on soil basically varies in parallel with the magnitudAe of rainfall." /
style=[font_size= 14pt font_style= italic just= c];
run;




