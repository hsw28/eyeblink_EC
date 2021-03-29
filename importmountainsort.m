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
  name = char(name(1,1));
  name = strcat('tetrode_', name);
  name = char(name);

  name2 = char(array(k));
  name2 = strsplit(name2,'Hannah');
  name2 = char(name2(1,2));
  name2 = strsplit(name2,'/');
  name2 = char(name2(1,3));
  name2 = strsplit(name2,'_');
  name2 = char(name2(1,1));

  name = strcat(name2, '_', name);
  name = strrep(name, '-', '_');
  name = strcat('date_', name)


  %loads data
  x = readmda(char(array(k)));
  %assigns to structure
  hc =  histcounts(x(3,:));
  if length(hc)>=1
    for j = 1:max(x(3,:))
      want = find(x(3,:)==j);
      if length(want) >0
      want = x(2,want)./32000;
      newname = strcat(name, '_unit_');
      newname = char(newname);
      charj = num2str(j);
      newname = strcat(newname, charj);
      newname = char(newname);
      myStruct.(newname) = want';
      end
    end
  end
end

f = myStruct;
