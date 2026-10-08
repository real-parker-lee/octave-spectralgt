## -*- texinfo -*-
## @deftypefn {octave-spectralgt} {} ihara (@var{Adj})
##
## Construct the Ihara matrix of the graph represented by the given adjacency
## matrix.
##
## If @var{Adj} is an The output of this function will be a matric
## @end deftypefn

function retval = ihara (Adj)
  Deg = diag(Adj * ones(columns(Adj), 1));
  I = eye(columns(Adj));
  retval = [Adj, Deg - I; -1 * I, zeros(columns(Adj))];
endfunction
