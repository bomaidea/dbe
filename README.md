# DBE

Database base Example, use this database for base projects. 

This db has all the history of the db, in the `_audit` tables. There is one for each normal table.

The database is created that is quite difficult to remove an istance in the db. For delete something you must to fill the colums `deleted_by` and `deleted_date` and if those are setted do not display those in your app. For keep better trace of the db (soft-delete).
