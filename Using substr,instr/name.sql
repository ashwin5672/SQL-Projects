select * from `icc test batting figures`;

#2.	Remove the column 'Player Profile' from the table.
alter table `icc test batting figures` drop column `Player Profile`;

#3.	Extract the country name and player names from the given data and store it in seperate columns for further usage.
select  substr(player,1,instr(player,'(')-1) as name,replace(substr(player,instr(player,'(')+1),')','') as country from `icc test batting figures`;

#4.	From the column 'Span' extract the start_year and end_year and store them in seperate columns for further usage.
select substr(span,1,instr(span,'-')-1) as start,substr(span,instr(span,'-')+1) as end from `icc test batting figures`;

#5.	The column 'HS' has the highest score scored by the player so far in any given match. 
#The column also has details if the player had completed the match in a NOT OUT status. 
#Extract the data and store the highest runs and the NOT OUT status in different columns.
select player,hs,
case
when instr(hs,'*')=0 then 'out'
else 'not out'
end
from `icc test batting figures`;

#6.	Using the data given, considering the players who were active in the year of 2019, 
#create a set of batting order of best 6 players using the selection criteria of those who have a good average score across all matches for India.

select *,avg
from `icc test batting figures`
where instr(span,'2019')>0 and instr(player,'india')>0
group by player
order by avg desc
limit 6;

#7.	Using the data given, considering the players who were active in the year of 2019, 
#create a set of batting order of best 6 players using the selection criteria of those who have highest 
#number of 100s across all matches for India.

select *
from `icc test batting figures`

where instr(span,'2019')>0
order by `100` desc
limit 6;

#8.	Using the data given, considering the players who were active in the year of 2019, 
#create a set of batting order of best 6 players using 2 selection criterias of your own for India.

select *
from `icc test batting figures`
where instr(span,'2019')>0 
order by `100` desc
limit 6;

#9.	Create a View named ‘Batting_Order_GoodAvgScorers_SA’ using the data given, considering the players who were active in the year of 2019,
# create a set of batting order of best 6 players using the selection criteria of those who have a good average score across all matches for South Africa.






