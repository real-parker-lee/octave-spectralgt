## -*- texinfo -*-
## @deftypefn {octave-spectralgt} {} adjmat (@var{vertcount}, @var{edge1}, @dots{})
##
## Construct the adjacency matrix of a graph given its vertex and edge-set.
##
## @code{adjmat} takes in the number of vertices as its first argument, followed
## by any number of strings of the format @code{"NUM1<->NUM2"} or
## @code{"NUM1->NUM2"}, denoting undirected and directed edges respectively.
## @code{NUM1} is the initial vertex of the edge, and @code{NUM2} is the
## terminal vertex. The order only matters for directed edges.
## @end deftypefn

function retval = adjmat (vertcount, varargin)
  retval = zeros(vertcount);

  for idx = 1:length(varargin)
    edgedata = regexp(varargin{idx}, '^(?<fromvert>[1-9]+[0-9]*)(?<edgetype><?->)(?<tovert>[1-9]+[0-9]*)$', "names");
    retval(str2num(edgedata.fromvert), str2num(edgedata.tovert)) += 1;
    if (strcmp(edgedata.edgetype, "<->"))
      retval(str2num(edgedata.tovert), str2num(edgedata.fromvert)) += 1;
    endif
  endfor
endfunction
