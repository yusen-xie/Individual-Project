proc odstext;
	p "SAS_STAT40840 - Assignment 2" / style=[font_size=20pt fontweight=bold 
		just=c];
	p "My Name is Yusen Xie" / style=[font_size=18pt just=c];
	p "Student No. 20211194" / style=[font_size=18pt just=c];

	/* 1. Import the diamonds.csv file and call the resulting table ‘diamonds’. The first row
	contains the column names. Drop or remove the first column which contains a row
	index */
	title 'Q1.';

PROC import out=s40840.diamonds 
		datafile="/home/u61605414/sasuser.v94/STAT40840-data/diamonds.csv" DBMS=CSV 
		REPLACE;
	getnames=yes;
	datarow=2;
run;

Data s40840.diamonds;
	set s40840.diamonds(drop=VAR1);
run;

/*
2. Use the ‘label’ function to give more informative labels to all variables, e.g. ‘Carat
of Diamond’ instead of ‘carat’. This will ensure later tables and plots appear nicer.
Adapt the PROC contents step to print only the third table from the default output
(that is, print only the table called ‘Alphabetic List of Variables and Attributes’ in
order to show the new labels).
*/
title 'Q2.';

DATA s40840.diamonds;
 set s40840.diamonds;
 label carat = 'carat of diamond' cut = 'quality of the diamond' 
       clarity="clarity of the diamond"
 color = 'color of the diamond' depth = 'The height of a diamond' 
 price ='The price of the diamond' table = 'The width of the diamonds table'
 x = 'lenght mm' y = 'width mm' z = 'depth mm';
run;

PROC contents data=s40840.diamonds;
run;


Proc Contents data=s40840.diamonds;
ods select variables;
run;



/*3. Change the ‘cut’ variable so that the levels are stored only as the first letters, e.g. I
for Ideal, VG for Very Good etc. Change the ‘color’ variable (using the information in
the metadata link above) so that diamonds of colour D, E and F are Colourless and
diamonds of colour G, H, I and J are Near Colourless. Print the first 5 rows of the
dataset. What is the colour of the diamond in the fourth row?   */

title 'Q3.';

DATA s40840.diamonds;
	set s40840.diamonds;
	cut=propcase(substr(cut, length(cut), 1));
	length color $ 15;

	if color="D" | color='E' | color="F" then
		color="Col";
	else if color="G" | color='H' | color="I"|color="J" then
		color="Nea";
run;

Proc print data=s40840.diamonds(obs=5);
run;

/*
4. Form a new variable called ‘volume’, which is the product of the x, y, and z variables.
(Diamonds clearly aren’t rectangular prisms, but let’s assume they are here - in any
case, the product of these three numbers will be a good proxy for the overall volume
of the diamonds.) In the same step, drop the table, depth, x, y, and z columns from
the dataset.
*/
title 'Q4.';

Data s40840.diamonds;
	set s40840.diamonds;
	volume=x*y*z;
run;

DATA s40840.diamonds (drop=table depth x y z);
	set s40840.diamonds;
run;

/* 5. Use the UNIVARIATE procedure to summarise the ‘price’ variable, printing only the
quantiles, the extreme observations, and a histogram. Describe your findings. */
title 'Q5.';
ods select Quantiles ExtremeObs;

proc univariate data=s40840.diamonds;
	var price;
run;

PROC UNIVARIATE data=s40840.diamonds noprint;
	class color;
	histogram price;
	inset n='Price of diamonds:' / position=ne;
run;

proc odstext;
p "Using color as a dividing criterion, 
it was found that as Colourless nd Near Colourless declined, so did its price" /
style=[font_size= 14pt font_style= italic just= c];
run;





/* 6. Use the carat variable to create a new variable carat cat, by dividing it into 3 categories:
Light (0 - 0.5), Medium (0.5 - 0.8) and Heavy (0.8 - 6). (Intervals should be closed on
the left and open on the right.) */
title 'Q6.';
DATA s40840.diamonds;
 set s40840.diamonds;
 length carat_cat $ 20;
  if carat >=0 & carat <0.5 then carat_cat = 'Light';
  if carat >=0.5 & carat <0.8 then carat_cat = 'Medium';
  if carat >=0.8 & carat <6 then carat_cat = 'Heavy';
run;

/* 7. Create a two-way contingency table of carat cat against colour. Which combination of
diamonds is the least fequent? */
title 'Q7.';
PROC FREQ data=s40840.diamonds nlevels;
	tables carat color;
run;


proc odstext;
p "i regard that colourless plus light is the least frequent" /
style=[font_size= 14pt font_style= italic just= c];
run;


/* 8. With all code contained in a single PROC step, select only those diamonds with a
price greater than $10,000, then print the summary statistics for the carat variable,
divided into groups by both colour and clarity. What is the mean carat for colourless
diamonds of clarity SI2? What is the mean price for this group of diamonds? */
title 'Q8.';
Proc means data=s40840.diamonds;
 class color clarity;
 var carat price;
 where price > 10000;
run;
/*The mean carat for colourless diamonds of clarity SI2 is 1.9239623, 
the mean price for this group of diamonds is 14412.92*/


/*9. Produce a plot(s) of your choice from the data, to help explore if price is related to
clarity. Describe your findings. Your plot(s) should be neat and clearly labelled.*/
/*--Fit Plot--*/

/*--Dot Plot--*/
title 'Q9.';
title 'the price amd clarity';
proc sgplot data=s40840.diamonds;
  dot clarity/ response=price limits=both stat=mean
      markerattrs=(symbol=circlefilled size=9);
  xaxis grid;
  yaxis display=(nolabel) offsetmin=0.1;
  keylegend / location=inside position=topright across=1;
  run;


proc odstext;
p "From the image, the price of sI2 is the highest, 
and most of the price of clarity is in 3000-4000, only the price of ws1 is less than 3000
In general, the higher the clarity of a diamond, the higher its price" /
style=[font_size= 14pt font_style= italic just= c];
run;


