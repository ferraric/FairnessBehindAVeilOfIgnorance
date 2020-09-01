path = '../Result_Data/DworkHeuristic/';
x_axis = load(strcat(path,'no_constraints_heuristic'));
x_axis = x_axis.dummykey';
f1=figure(1);
set(0,'DefaultAxesFontSize', 22)
clf(f1);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Wel = load(strcat(path,'welfare_matrix_heuristic'));
Wel = Wel.dummykey';

plot(x_axis, Wel, 'Color', [0,1,1], 'LineWidth', 3)

xlim([min(min(x_axis)),max(max(x_axis))]);
xlabel('Number of enforced constraints');
ylabel('Social Welfare (\alpha=0.8)');
title('COMPAS')        
saveas(f1,'../Plots/DworkHeuristic/COMPAS_welfare_heuristic','png');
clf(f1);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
AT = load(strcat(path,'at_matrix_heuristic'));
AT = AT.dummykey';

plot(x_axis, AT, 'Color', [1,0,0], 'LineWidth', 3)

xlim([min(min(x_axis)),max(max(x_axis))]);
xlabel('Number of enforced constraints');
ylabel('Atkinson Index (\alpha=0.8)');
title('COMPAS')        
saveas(f1,'../Plots/DworkHeuristic/COMPAS_AT_heuristic','png');
clf(f1);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
FPR = load(strcat(path,'fpr_matrix_heuristic'));
FPR = FPR.dummykey';

plot(x_axis, FPR, 'Color', [0,1,0], 'LineWidth', 3)

xlim([min(min(x_axis)),max(max(x_axis))]);
xlabel('Number of enforced constraints');
ylabel('fpr difference');
title('COMPAS')        
saveas(f1,'../Plots/DworkHeuristic/COMPAS_FPR_heuristic','png');
clf(f1);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
FNR = load(strcat(path,'fnr_matrix_heuristic'));
FNR = FNR.dummykey';

plot(x_axis, FNR, 'Color', [1,1,0], 'LineWidth', 3)

xlim([min(min(x_axis)),max(max(x_axis))]);
xlabel('Number of enforced constraints');
ylabel('fnr difference');
title('COMPAS')        
saveas(f1,'../Plots/DworkHeuristic/COMPAS_FNR_heuristic','png');
clf(f1);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
DP = load(strcat(path,'dp_matrix_heuristic'));
DP = DP.dummykey';

plot(x_axis, DP, 'Color', [1,0,1], 'LineWidth', 3)

xlim([min(min(x_axis)),max(max(x_axis))]);
xlabel('Number of enforced constraints');
ylabel('demographic parity');
title('COMPAS')        
saveas(f1,'../Plots/DworkHeuristic/COMPAS_DP_heuristic','png');
clf(f1);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
GE = load(strcat(path,'ge_matrix_heuristic'));
GE = GE.dummykey';

plot(x_axis, GE, 'Color', [0,1,1], 'LineWidth', 3)

xlim([min(min(x_axis)),max(max(x_axis))]);
xlabel('Number of enforced constraints');
ylabel('generalized entropy');
title('COMPAS')        
saveas(f1,'../Plots/DworkHeuristic/COMPAS_GE_heuristic','png');
clf(f1);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Acc = load(strcat(path,'accuracy_matrix_heuristic'));
Acc = Acc.dummykey';

plot(x_axis, Acc, 'Color', [0,0,0], 'LineWidth', 3)

xlim([min(min(x_axis)),max(max(x_axis))]);
xlabel('Number of enforced constraints');
ylabel('Accuracy');
title('COMPAS')        
saveas(f1,'../Plots/DworkHeuristic/COMPAS_accuracy_heuristic','png');
clf(f1);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Dwork_no = load(strcat(path,'dwork_no_matrix_heuristic'));
Dwork_no = Dwork_no.dummykey'

Alpha = [0.2,0.5,1];

alphaIndex = 0;
for alpha=Alpha
    alphaIndex = alphaIndex+1;
    plot(x_axis,Dwork_no(alphaIndex,:),'Color', [0, 0 , alpha],'LineWidth',3)
    hold on
end
legend('actual predictions','probabilities','distance to hyperplane',...
    'Location','northeast')
xlim([min(min(x_axis)),max(max(x_axis))]);
xlabel('Number of enforced constraints');
ylabel('average violation');
title('COMPAS')        
saveas(f1,'../Plots/DworkHeuristic/COMPAS_dwork_no_heuristic','png');
clf(f1);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Dwork_avg = load(strcat(path,'dwork_avg_matrix_heuristic'));
Dwork_avg = Dwork_avg.dummykey'

Alpha = [0.2,0.5,1];

alphaIndex = 0;
for alpha=Alpha
    alphaIndex = alphaIndex+1;
    plot(x_axis,Dwork_avg(alphaIndex,:),'Color', [0, 0 , alpha],'LineWidth',3)
    hold on
end
legend('actual predictions','probabilities','distance to hyperplane',...
    'Location','northeast')


xlim([min(min(x_axis)),max(max(x_axis))]);
xlabel('Number of enforced constraints');
ylabel('number of violations');
title('COMPAS')        
saveas(f1,'../Plots/DworkHeuristic/COMPAS_dwork_avg_heuristic','png');
clf(f1);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Alpha = [0.5,1];

alphaIndex = 0;
for alpha=Alpha
    alphaIndex = alphaIndex+1;
    plot(x_axis,Dwork_avg(alphaIndex+1,:),'Color', [0, 0 , alpha],'LineWidth',3)
    hold on
end
legend('probabilities','distance to hyperplane',...
    'Location','northeast')


xlim([min(min(x_axis)),max(max(x_axis))]);
xlabel('Number of enforced constraints');
ylabel('number of violations');
title('COMPAS')        
saveas(f1,'../Plots/DworkHeuristic/COMPAS_dwork_avg_mod_heuristic','png');
clf(f1);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

W = load(strcat(path,'W_matrix_heuristic'));
color_matrix = [[0,0,0];[0.5,0.5,0];[0, 0.5, 0];[0.4660, 0.6740, 0.1880];[0.1950, 0.85, 0.39];[0.8,0.8,0.8];[0, 0.4470, 0.7410];[0.8500, 0.3250, 0.0980];[0.9290, 0.6940, 0.1250]];

W = W.dummykey';

f1=figure(1);
set(0,'DefaultAxesFontSize', 22)
for i=1:9
    if i == 1
        plot(x_axis,W(i,:),'Color', color_matrix(i,:),'LineWidth',6)
    else
        temp = W(i,:);
        plot(x_axis,temp,'Color', color_matrix(i,:),'LineWidth',3)
    end
    hold on
end

xlim([min(min(x_axis)),max(max(x_axis))]);
xlabel('Number of enforced constraints');
ylabel('weights');
title('COMPAS')
leg = legend('intercept','age',...
    'juv_fel_count','juv_misd_count','juv_other_count',...
    'race','sex','priorscount','felony charge','Location','southeast');
set(leg,'Interpreter', 'none')
saveas(f1,'../Plots/DworkHeuristic/COMPAS_W_heuristic','png');
clf(f1);

close(f1);