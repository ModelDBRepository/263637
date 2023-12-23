% 3 ROIs TE Calculation

clear all
close all
clc
 
ft_defaults;
load('sim_data_Fig5_0a')
OutputDataPath='TE_data_Fig5_0a';


% Input data in TRENTOOL
data=[];
ntrials=10;

%time indices for individual trials
data.time=cell(10,1);
for i=1:ntrials
    data.time{i,1}=tt;
end

% labels of channels
data.label=cell(3,1);
data.label{1,1}='X';
data.label{2,1}='Y';
data.label{3,1}='Z';

% data for each trial, where each trial holds samples from all channels
data.trial=cell(1,10);
for i=1:ntrials
chr=int2str(i);
eval(['data.trial{1,i}=eeg',chr,'']);
end

data.fsample=100;


%% define cfg for TEprepare
cfgTEP=[];
cfgTEP.toi=[min(data.time{1,1}),max(data.time{1,1})];
cfgTEP.channel=data.label;
cfgTEP.predicttime_u=15; 
cfgTEP.predicttimemax_u=18; 
cfgTEP.predicttimemin_u=12;  
cfgTEP.predicttimestepsize=1;

cfgTEP.TEcalctype='VW_ds';
cfgTEP.trialselect='no';
cfgTEP.minnrtrials=1;  
cfgTEP.actthrvalue=30; 

cfgTEP.optimizemethod='ragwitz';
cfgTEP.ragdim=4:8;  
cfgTEP.ragtaurange=[0.8 1.8];  
cfgTEP.ragtausteps=10;  
cfgTEP.flagNei='Mass';   
cfgTEP.sizeNei=4;
cfgTEP.repPred=100;

data_prepared=TEprepare(cfgTEP,data);


%% define cfg for TEsurrogatestats or InteractionDelayReconstruction_calculate
cfgTESS=[];
cfgTESS.optdimusage='indivdim';
cfgTESS.tail=1;
cfgTESS.surrogatetype='trialshuffling';
cfgTESS.extracond='Faes_Method';
cfgTESS.shifttest='no';
cfgTESS.MIcalc=1;
cfgTESS.fileidout=strcat(OutputDataPath);
 
TGA_results=InteractionDelayReconstruction_calculate(cfgTEP,cfgTESS,data);

%% Graph correction for multivariate effects
% define cfg for TEgraphanalysis
cfgGA=[];   
cfgGA.threshold=3;
cfgGA.cmc=1;
TGA_results=TEgraphanalysis(cfgGA,TGA_results);
save(OutputDataPath,'TGA_results');

