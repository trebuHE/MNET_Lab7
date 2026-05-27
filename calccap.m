function [Creal,matrix,qout] = calccap(infile, method)

% Permitivity of free space.
  E_0 = 8.854187818E-12;

% Read in the panels
  [panels] = readpanels(infile);

done = 'read input file'

% Compute the panel centroids and areas (don't need the normals).
  [centroids, normals, areas] = gencolloc(panels);

done = 'generated collocation points'

 if(method == "colloc")
    [matrix] = collocation(panels,centroids);
 elseif (method == "galerkin")

    % Or: Generate the Galerkin matrix
    [matrix] = galerkin(panels);
 end
  
done = 'generated matrix'

% Create the rhs
  [r,c] = size(matrix);

  if(method == "colloc")
    rhs = ones(r,1);
  elseif(method == "galerkin")
    rhs = areas';
  end
% Solve for the charge density vector

 q = matrix \ rhs;
 qout = q;

done = 'solved for charge'

% Integrate the charge over the surface to compute the capacitance.
% But first multiply the charge density by the panel area.
  q = q .* areas.';
  C = sum(q);

% Scale the capacitance by the free space dielectric permitivity and 4pi. 
Creal = E_0 * 4 * pi * C;





