## -*- texinfo -*-
## @deftypefn {octave-spectralgt} {} laplacian (@var{Adj})
##
## Computes the laplacian matrix of the graph represented by the adjacency
## matrix @var{Adj}.
##
## @end deftypefn

function retval = laplacian(Adj)
  D = diag(Adj * ones(columns(Adj), 1));
  retval = D - Adj;
endfunction
