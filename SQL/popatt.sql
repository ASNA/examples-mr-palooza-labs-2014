set transaction isolation level no commit;
delete from rppallab/attendee;

insert into rppallab/attendee(id,lname,fname,company,email,
                              lab1,lab2,lab3,lab4,lab5,
                              lab6,lab7,lab8,lab9,datchg) 
values(
    1,
    'Nickell',
    'John',
    'Five Cent Devlopment',
    'john@nickell.com',
    0,0,0,0,0,0,0,0,0,    
    now()
);

insert into rppallab/attendee(id,lname,fname,company,email,
                              lab1,lab2,lab3,lab4,lab5,
                              lab6,lab7,lab8,lab9,datchg) 
values(
    2,
    'Forbus',
    'Forrest',
    'US Warranty',
    'ff@uswarranty.com',
    0,0,0,0,0,0,0,0,0,    
    now()
);
