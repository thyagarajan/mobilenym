# mobilenym
given a mobile number, it will give the possible pseudonym

Sample Output

thyagu@localhost:~/work$ ruby mobilenum.rb 
[["noun", "struck"],
 ["onto", "struck"],
 ["motor", "truck"],
 ["motor", "usual"],
 ["nouns", "truck"],
 ["nouns", "usual"],
 ["motortruck"]]


Performance

thyagu@localhost:~/work$ time ruby  mobilenum.rb 
[["noun", "struck"],
 ["onto", "struck"],
 ["motor", "truck"],
 ["motor", "usual"],
 ["nouns", "truck"],
 ["nouns", "usual"],
 ["motortruck"]]

real	0m2.751s
user	0m2.608s
sys	0m0.140s

Unit Testing 

thyagu@localhost:~/work$ ruby tc_mobile_nym.rb 
[["noun", "struck"],
 ["onto", "struck"],
 ["motor", "truck"],
 ["motor", "usual"],
 ["nouns", "truck"],
 ["nouns", "usual"],
 ["motortruck"]]
Loaded suite tc_mobile_nym
Started
.

Finished in 6.252167529 seconds.
--------------------------------------------------------------------------------
1 tests, 2 assertions, 0 failures, 0 errors, 0 pendings, 0 omissions, 0 notifications
100% passed
--------------------------------------------------------------------------------
0.16 tests/s, 0.32 assertions/s

