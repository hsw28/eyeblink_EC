function f = importevents(nev_file)

events = read_events(nev_file);
%events = getfield(events,'TimeStamp');
mat = NaN(length(events),1);
for f = 1:length(events)
  mat(f) = events(f).TimeStamp;
end

events = mat./1000000;
events = events-events(1);
events = events(2:end-1);

cs=events(1:4:end);

f = cs;
