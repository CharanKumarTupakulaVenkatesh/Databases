----Convert Column level Data into Rows in SqlServer------------

Select country,c.b.value('.','varchar(10)') as STATE
from(select country,cast('<D>'+ REPLACE(STATE,',','</D><D>') + '</D>' AS XML) AS STATE
from Nation a) as b CROSS APPLY STATE.nodes('/D') as c(b);
