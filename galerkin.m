function matrix = galerkin(panels)
% Fills in matrix relating panel charges to collocation point potentials.
% Panel is stored as 3-D array
% [panel verts, cond num, 0]
% [vert 1 x,y,z]
% [vert 2 x,y,z]
% [vert 3 x,y,z]
%

%
% Setting up the Galerkin matrix
%
 [rows,cols,numpanels] = size(panels);
 matrix = zeros(numpanels, numpanels);

 M = ???;
 [tempx tempy] = meshgrid(1/(2*M):1/M:1,1/(2*M):1/M:1);
 evalgrid = [reshape(tempx,M*M,1) reshape(tempy,M*M,1) zeros(M*M,1)];

%
% Note 1: You need to add an extra loop at this point: for every panel i,
%         we integrate over panel i, the contribution from panel j,
%         for every panel j;
% Note 2: The integral over panel i is approximated by a sum
%         of M^2 partial sums corresponding to M^2 evaluation
%         points located on the i-th panel.
% Note 3: All the panels are placed horizontally for the considered
%         square plate example. Locations of panel edges can be used to
%         find evaluation points on the i-th panel.
 
   for j=1:numpanels
      numverts = panels(1,1,j);
      panel = panels(2:numverts+1,:,j);
      [area, collocpt, Z, fss] = calcp(panel, evalpoints);	
      matrix(i,j) = ???;
   end

end
