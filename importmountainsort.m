function f = importmountainsort(array)
  %import from uipickfiles


array = array';


for k=1:length(array)
  %imports path name as string and trunctates string so it's not so long
  name = char(array(k));
  name = strsplit(name,'Hannah');
  name = char(name(1,2));
  name = strsplit(name,'tetrode_');
  name = char(name(1,2));
  name = strsplit(name,'_output');
  name = char(name(1,1))
  %replaces characters that cant be in structure names
  name = strcat('cluster_', name);
  name = char(name);
  %loads data
  x = readmda(char(array(k)));
  x = x(2,:)./32000;
  %assigns to structure
  if length(x)>1
    myStruct.(name) = x;
  end
end

f = myStruct;
