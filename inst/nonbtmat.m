## -*- texinfo -*-
## @deftypefn {octave-spectralgt} {} nonbtmat (@var{Adj})
##
## Construct the non-backtracking matrix of the graph represented by the
## Adjacency matrix @var{Adj}.
##
## @end deftypefn

function retval = nonbtmat (Adj)
  dim = columns(Adj);
  idx = 1;
  numedges = transpose(Adj * ones(columns(Adj),1)) * ones(columns(Adj),1);
  retval = zeros(numedges);
  tempA = zeros(columns(Adj));
  for i = 1:columns(Adj)
    for j = i:columns(Adj)
      if (Adj(i,j) == 1)
        tempA(i,j) = idx;
        idx = idx + 1;
        if (Adj(j,i) != 0)
          tempA(j,i) = idx;
          idx = idx + 1;
        endif
      elseif (Adj(j,i) == 1)
        tempA(j,i) = idx;
        idx = idx + 1;
      endif
    end
  end
  vertcount = transpose(tempA * ones(columns(tempA),1)) * ones(columns(tempA),1);
  for inb = 1:columns(tempA)
    for jnb = 1:columns(tempA)
      if (tempA(inb,jnb) != 0)
        for jc = 1:columns(tempA)
          if (tempA(jnb,jc) != 0)
            if (jc != inb)
              retval(tempA(inb, jnb), tempA(jnb, jc)) = 1;
            endif
          endif
        end
      endif
    end
  end
endfunction
