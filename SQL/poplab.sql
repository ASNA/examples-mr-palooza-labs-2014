set transaction isolation level no commit;
delete from rppallab/lab;

insert into rppallab/lab(id,labnam,desc,subhead,labord,totseats,seatsav,datchg) 
values(
    1,
    'Everything you know about ASP.NET deployment is wrong!',
    'This is a decription',
    'Monday 8am - 10am',
    1,
    20,
    20,
    now()
);

insert into rppallab/lab(id,labnam,desc,subhead,labord,totseats,seatsav,datchg) 
values(
    2,
    'Introducing Mobile RPG',
    'This is the description',
    'Monday 11am - 1pm',
    2,
    20,
    20,
    now()
);

insert into rppallab/lab(id,labnam,desc,subhead,labord,totseats,seatsav,datchg) 
values(
    3,
    'Introducing ASNA Wings',
    'This is the description',
    'Monday 2pm - 4pm',
    4,
    20,
    20,
    now()
);

insert into rppallab/lab(id,labnam,desc,subhead,labord,totseats,seatsav,datchg) 
values(
    4,
    'Something cool with AVR',
    'This is the description',
    'Tuesday 8am - 10am',
    3,
    20,
    20,
    now()
);