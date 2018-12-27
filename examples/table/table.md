# Table Examples {-}

# Standard Markdown Table
A standard markdown table supports single line only in each column and its width can not be modified.
This table can also be rendered well on common markdown platforms (ex: GitHub).

 Right | Left | Default | Center 
------:|:-----|---------|:------:
   12  |  12  |    12   |    12  
  123  |  123 |   123   |   123  
    1  |    1 |     1   |     1  

Table: A Standard Markdown Table

# Extended Markdown Table
An extended markdown table supports multiple lines in each column.
This table can not be rendered well on common markdown platforms (ex: GitHub).

----------------------------
 Centered  Default     Right
  Header   Aligned   Aligned
---------- -------- --------
   First   row,         12.0
           long
           content

  Second   row           5.0 
----------------------------

Table: An Extended Markdown Table

# How to Make an Extended Markdown Table Wider?
For an extended markdown table, you can also modify its width by adding more hyphens "\-".

------------------------------------------------
 Centered            Default               Right
  Header             Aligned             Aligned
-------------------- ------------- -------------
   First             row,                   12.0
                     long content,
                     long content,
                     long content,
                     long content,
                     long content,

  Second             row                     5.0
------------------------------------------------

Table: A Wider Extended Markdown Table
