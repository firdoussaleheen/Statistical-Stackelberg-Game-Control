function [avgstates, time] = simStates(runs, simName)
%run_seed = 1:runs;
for i = 1:runs
    %r_seed = run_seed(i);
    %seed = [23341] 
    %round(100*sum(clock))
    %s = RandStream.create('mt19937ar','seed',r_seed);
    %RandStream.setDefaultStream(s);
    data(i)=sim(simName{1,1},'ReturnWorkspaceOutputs', 'on');
    datamat{i}=(get(data(i),'dataout'))
    datatime{i}=(get(data(i),'tout'))
end

avgstates=mean(reshape(cell2mat(datamat), [ size(datamat{1}), length(datamat) ]), ndims(datamat{1})+1);
time = cell2mat(datatime);

end