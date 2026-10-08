## -*- texinfo -*-
## @deftypefn {octave-spectralgt} {} degmat (@var{A})
##
## Construct the Degree Matrix of the graph represented by the adjacency matrix
## @var{Adj}.
##
## @end deftypefn

function retval = degmat (Adj)
  retval = diag(Adj * ones(columns(Adj), 1));
endfunction
