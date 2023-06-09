ALTER TABLE main
    PARTITION BY RANGE (Year)(
        PARTITION p1987 VALUES LESS THAN (1988),
        PARTITION p1988 VALUES LESS THAN (1989),
        PARTITION p1989 VALUES LESS THAN (1990),
        PARTITION p1990 VALUES LESS THAN (1991),
        PARTITION p1991 VALUES LESS THAN (1992),
        PARTITION p1992 VALUES LESS THAN (1993),
        PARTITION p1993 VALUES LESS THAN (1994),
        PARTITION p1994 VALUES LESS THAN (1995),
        PARTITION p1995 VALUES LESS THAN (1996),
        PARTITION p1996 VALUES LESS THAN (1997),
        PARTITION p1997 VALUES LESS THAN (1998),
        PARTITION p1998 VALUES LESS THAN (1999),
        PARTITION p1999 VALUES LESS THAN (2000),
        PARTITION p2000 VALUES LESS THAN (2001),
        PARTITION p2001 VALUES LESS THAN (2002),
        PARTITION p2002 VALUES LESS THAN (2003),
        PARTITION p2003 VALUES LESS THAN (2004),
        PARTITION p2004 VALUES LESS THAN (2005),
        PARTITION p2005 VALUES LESS THAN (2006),
        PARTITION p2006 VALUES LESS THAN (2007),
        PARTITION p2007 VALUES LESS THAN (2008),
        PARTITION p2008 VALUES LESS THAN (2009)
    );