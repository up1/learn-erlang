-module(learn003).

-export[sum/1].

sum(1)->1;
sum(N)->N+sum(N-1).