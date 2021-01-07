dbf
===

Load (parts of) dbf Files

Usage
-----

    x <- DBF.PROTO

Value
-----

DBF.PROTO is a list containing mostly functions that operate on
copies of DBF.PROTO.

Examples
--------

    x <- DBF.PROTO
    x <- x$init(x, filename)
    x$info(x) # DUMP METADATA TO stdout()
    x <- x$loadRecords(x, 1)
    x$RECENT # DUMP THE MOST RECENTLY-READ RECORD(S) TO stdout()
