/*Tutorial 0 Select Basics*/ 
/* #1 this shows the population of Germeny from the world table */
SELECT population FROM world
  WHERE name = 'Germany'
/*#2 this shows the population of the 3 countries */
 SELECT name, population FROM world
  WHERE name IN ('Sweden', 'Norway', 'Denmark');
/*#3 shows the countries where the population is from a range */
  SELECT name, area FROM world
  WHERE area BETWEEN 200000 AND 250000
/*--------------------------------------------------------------*/
/*Tutorial 1 Select name */
/* #1 shows the country that starts with y */
SELECT name FROM world
  WHERE name LIKE 'Y%'
/* #2 shows the countries that end with y */ 
SELECT name FROM world
  WHERE name LIKE '%y'
/* #3 shows the countries that contains the letter x */  
SELECT name FROM world
  WHERE name LIKE '%x%'
/* #4 shows the countires tha end with land */ 
SELECT name FROM world
  WHERE name LIKE '%land'
/* #5 Shows the countries that start with C and end with ia */
 SELECT name FROM world
  WHERE name LIKE 'C%ia'
/* #6  shows the country that has two o's in the name*/  
SELECT name FROM world
  WHERE name LIKE '%oo%'
/* #7 shows the countire that has three or more aaa's in it */  
SELECT name FROM world
  WHERE name LIKE '%a%a%a%'
/*#8 shows the countires that has the letter t as the second letter */
SELECT name FROM world
 WHERE name LIKE '_t%'
ORDER BY name   
/* #9  shows countries that have two "o" characters separated by two others. */ 
SELECT name FROM world
 WHERE name LIKE '%o__o%'
/* #10 shows countries that have exactly four characters. */
SELECT name FROM world
 WHERE name LIKE '____'
/* #11  shows the country where the name is the capital city. */
SELECT name FROM world
 WHERE name =capital
/* #12 shows country where the capital is the country plus "City". */
 SELECT name FROM world
 WHERE capital = concat(name, ' City')
/* #13   the capital and the name where the capital includes the name of the country. */
SELECT capital, name FROM world
 WHERE capital LIKE concat('%', name, '%')
 /* #14 shows  the capital and the name where the capital is an extension of name of the country.  */
  SELECT capital,name FROM world
 WHERE capital LIKE concat(name, '_%')
/*---------------------------------------------------------------------------------------------------------*/
/* Tutorial 2 Slect from world */ 
/* 1  show the name, continent and population of all countries.*/ 
SELECT name, continent, population FROM world
/*  2  how the name for the countries that have a population of at least 200 million. */ 
SELECT name FROM world
WHERE population > 200000000
/* 3  shows  the name and the per capita GDP for those countries with a population of at least 200 million. */ 
Select name, gdp / population
From world
where population >200000000
/* 4  shows the name and population in millions for the countries of the continent 'South America'. */ 
SELECT name, population/1000000 FROM world WHERE continent = 'South America'
/*5  Show the name and population for France, Germany, Italy */ 
  SELECT name, population FROM world WHERE name IN ('France','Germany','Italy')
 /* 6  Show the countries which have a name that includes the word 'United' */ 
 SELECT name FROM world WHERE name LIKE '%United%'  
 /* 7   Show the countries that are big by area or big by population. Show name, population and area. */ 
 SELECT name, population, area FROM world WHERE area > 3000000 OR population > 250000000
 /* 8  shows the countries that are big by area or big by pop but not both  */ 
 SELECT name, population, area FROM world 
 Where ( area > 3000000 AND population <= 250000000) 
 OR (area <= 300000 AND population > 2500000000)
/* #9  for South Africa show pop in millios and GDP in Billions both to 2 decimal places. */ 
SELECT name, ROUND(population/1000000,2), 
ROUND (GDP/1000000000, 2) FROM world 
Where continent = 'South America' 
/* 10  show the per capita GDP for the trillion dollar countries to the nearest $1000*/
SELECT name, ROUND( gdp/population,-3) FROM world Where GDP >= 1000000000000
/* 11 shows the name and the capital where the name and the cvapital have the same number of characters */
 SELECT name, capital FROM world 
 WHERE LENGTH(name)= LENGTH(capital); 
/* 12 Show the name and the capital where the first letters of each match. Don't include countires where the name and the capital are the same word. */ 
SELECT name, captial FROM world
WHERE LEFT(name,1) = LEFT(capital,1) 
AND name <> capital 
/* 13   shows the country that has all vowels and no spaces in its name. */ 
 SELECT name FROM WORLD 
 WHERE name LIKE  'B%'
 AND name NOT LIKE '%a%' 
/*---------------------------------------------------------------------------------------------------------*/
/* Tutorial #3 Select from Nobel */ 
/* 1 shows the display of the noble prizes for 1950 . */ 
  SELECT yr, subject, winner 
  FROM nobel
  WHERE yr = 1950 
/* 2 shows who won in 1962 for Literature.*/
SELECT winner 
FROM nobel 
WHERE yr= 1962 
AND subject = 'Literature'
/* 3 show the year and the subject that won albert einstein his prize */ 
SELECT yr, subject FROM nobel WHERE winner = 'Albert Einstien'
/* 4 Give the name of the Peace Winners since the year 2000, including 2000.*/ 
SELECT winner FROM nobel WHERE subject = 'Peace' ANd yr >= 2000
/* 5 shows all the details (yr, subject, winner) of the Literature prize winners for the 1980 and 1989 inclusive */ 
SELECT * from nobel where subject = 'literature' and yr between '1980' and '1989' 
/*6 shows details of presdential winnings */ 
SElECT * from nobel 
Where winner in ('THeodore Roosevelt', 'Woodrow Wilson', 'Jimmy Carter', 'Barack Obama' ) 
/*7 show the winners wit the frist name john */ 
SELECT winner FROM nobel WHERE winner LIKE 'John&' 
/*8 Show the year, sunbject, name of physics winners for 1980 together with the chemistry winners ofr 1984*/ 
SElect * from nobel 
where (subject = 'physics' and yr ='1980')
or (subject= 'Chmesitry' AND yr = '1984' )
/* 9  show the year subject name of winners in 1980 excluding chem and medicine  */
 SELECT * FROM nobel Where subject Not IN ('chemistry' , 'MEdicine' and Yr = '1980'
/* 10   Show the year, subject , and name of people who won a medicine prize in an early year before 1910 not inxluding 1910 together with winners of LIt. prie in a later year. */
Select * from nobel 
Where 	(subject = medicine And yr <1910) 
or (subject = Lit. And yr >= '2004') 		
/* 11 Find all the details of the Prize won by Peter GRUNBERG */
SELECT * FROM nobel WHERE winner LIKE 'Peter GRUN%BERG'
/*12 Find all Details of the Prize won by EUGENE O'neil */ 
SElECT *from nobel Where winner LIke '	EUGENE O'neil '	
/* 13 list the winners ,year and subject where the winner starts with Sir. Shows the most recent first, then by name order  */
Select winner, yr ,subject From nobel where winner Like 'Sir%' ORder by yr DESC, winner.
/*---------------------------------------------------------------------------------------------------------*/
/* Tutorial 4 */ 
/*1 list country name where the population os larger than that of russia */ 
SElect name From World 
Where population >146000000
/* 2    show the countires in Europe with a per capita GDP Greater than 'United Kingdom'        */ 
Select name 
from world 
Where continent = 'Europe' And gdp/population > (Select gdp/population FROm World Where Name = 'united Kingdom') 
/*3 list the name and continent of countries in the continents either Argentina or Austrialia. Order by Name of the country.*? 
Select name , continent 
FROM world 
Where Continent IN ( 
SElECT continent 
FROM World 
Where name IN (Austrilia', 'Argentina' )) 
Order by name 
/* 4 shows a country that has a population more than canada but less than poland. showing also the popualtion */ 
Select name, population 
FROM World Where population>(Select population FROM World Where name = 'Canada') 
AND population <(Select population FRom World Where name = 'poland') 
/* 5 shows the name and the population of each country in Europe. Show the population as a percentage of the population of Germany. */
select name, concat( cast(round(100*population/select population From world where name  'Germany'),0) as int) '%')
from world 
Where contient ='Europe' 
/* 6 shows the countries with gdp greater than every country in Europe */ 
Select name From world 
Where gdp > All 
(Select gdp From World 
Where continent = 'Europe'
AND gdp is not null) 
/* 8  list each continent and the name of the country that comes first alphabetically. */ 
SELECT continent, name From world x 
where x.name <= all ( Select name From world y Where x.continent =y.continent) 
/*9  show the continent where all countires have a population <=25000000 */
Select name , continent, poulation From world x 
Where 25000000>=all (
Select population from world y 
Where x.continent =y.continent 
and y.population >0) 
/* 10 show the countries that have population more than 3x that of their neighbours */ 
SELECT name, continet FROM world x Where 
population > all 
(Select population *3 From world y 
Where y.continent =x.continent 
and y.name != x.name) 
/*---------------------------------------------------------------------------------------------------------*/
/* tutorial 5 */ 
/*1   show the population of the world */ 
Select SUM(population) 
From world 
/*2   list all contients once */
Select Distinct continet From world 
/*3 Give the total GDP of Africa */ 
Select SUM(gdp) From World 
where continet ='Africa'; 
/* 4  shows the countries that have an area of at least 1000000 */ 
Select count(name) 
From World 
Where area >= 1000000; 
/* 5  shows the total population pf 3 countries */
select sum(population) 
From world 
where name IN ('estonia','Latvia', 'Lithuania'); 
/* 6 each continet show the continet and number of countries */
Select continet, count (name) 
From World 
Group by Continet ; 
/*7 shows the contient andthe number of countries with the population */ 
Select contient, Count (name)
from world 
where population >= 10000000
group by continent; 
/*8 show the continent that has a total population of at least 100 million */ 
Select continent 
From world 
Group by continent 
HAving sum(population)>= 100000000; 
