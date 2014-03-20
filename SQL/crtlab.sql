DROP TABLE RPPALLAB/LAB; 

CREATE TABLE rppallab/lab (
    ID         Dec(12,0) Not Null,
    LabNam     Char(80)  Not Null,
    Desc       Char(2048)  Not Null,
    Subhead    Char(80) Not Null,      
    LabOrd     Dec(12,0) Not Null,
    TotSeats   Dec(12,0) Not Null,
    SeatsAv    Dec(12,0) Not Null,
    DatAdd     TimeStamp Default Current TimeStamp,
    DatChg     TimeStamp,

    Primary Key(ID)
);
