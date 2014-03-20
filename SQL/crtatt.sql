Drop Table rppallab/attendee;

CREATE TABLE rppallab/attendee (
    ID         Dec(12,0) Not Null,
    LName      Char(30)  Not Null,
    FName      Char(30)  Not Null,
    Company    Char(30)  Not Null,
    Email      Char(75)  Not Null,
    Lab1       Dec(12,0) default 0 Not Null,
    Lab2       Dec(12,0) default 0 Not Null,
    Lab3       Dec(12,0) default 0 Not Null,
    Lab4       Dec(12,0) default 0 Not Null,
    Lab5       Dec(12,0) default 0 Not Null,
    Lab6       Dec(12,0) default 0 Not Null,
    Lab7       Dec(12,0) default 0 Not Null,
    Lab8       Dec(12,0) default 0 Not Null,
    Lab9       Dec(12,0) default 0 Not Null,
    DatAdd     TimeStamp Default Current TimeStamp,
    DatChg     TimeStamp Default Current TimeStamp,

    Primary Key(ID)
);
