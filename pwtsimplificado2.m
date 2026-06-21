% rode DEPOIS da simulação — 'out' já está no workspace base
sigs  = {out.Idm, out.Iqm, out.Te, out.Vd, out.Vq, ...
         out.We, out.Idref, out.Wheel_Speed, out.Velocity, out.wm};
nomes = {'Idm','Iqm','Te','Vd','Vq','We','Idref','Wheel_Speed','Velocity','wm'};

tf = out.Idm.Time(end);          % tempo final da sim
t  = (0:1e-3:tf)';               % grade comum de 1 ms (leve)
M  = t;
for k = 1:numel(sigs)
    M(:,k+1) = interp1(sigs{k}.Time, squeeze(sigs{k}.Data), t);
end

T = array2table(M, 'VariableNames', [{'time'} nomes]);
writetable(T, 'sim_output.csv');
disp(['Salvo: ' fullfile(pwd,'sim_output.csv')]);