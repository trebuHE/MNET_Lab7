% This visualizes charge density sigma computed on the surface
% specified by infile.
function vissigma(infile, sigma)

% read in panel data
[panels] = readpanels(infile);

figure
numpanels = size(panels,3);
for i=1:numpanels
 
  nvert = panels(1,1,i);
  pandat = panels(2:(nvert+1),:,i);
  pandat = [pandat; panels(2,:,i)];
  fill3(pandat(1:nvert,1), pandat(1:nvert,2), pandat(1:nvert,3), ...
      sigma(i)*ones(nvert,1));
  hold on
 
end

colormap('copper')
caxis([0 max(sigma)])