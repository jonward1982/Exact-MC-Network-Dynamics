% Startup file
% Run to add sub-directories to the path

home=pwd;

dlist=dir(home);

for i=1:length(dlist)
   
    if isdir(dlist(i).name) && dlist(i).name(1)~='.'
       
        addpath([home,'/',dlist(i).name]);
        
    end
    
end

clear home dlist i