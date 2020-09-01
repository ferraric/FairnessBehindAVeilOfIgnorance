W = load('../Result_Data/IndividualFairness/weight_matrix0-4');
Tau = linspace(0.92,0.968,20);
color_matrix = [[0,0,0];[0.5,0.5,0];[0, 0.5, 0];[0.4660, 0.6740, 0.1880];[0.1950, 0.85, 0.39];[0.8,0.8,0.8];[0, 0.4470, 0.7410];[0.8500, 0.3250, 0.0980];[0.9290, 0.6940, 0.1250]];

W = W.dummykey;

f1=figure(1);
set(0,'DefaultAxesFontSize', 22)
for i=1:9
    if i == 1
        plot(Tau,W(i,:),'Color', color_matrix(i,:),'LineWidth',6)
    else
        plot(Tau,W(i,:),'Color', color_matrix(i,:),'LineWidth',3)
    end
    hold on
end

xlim([min(min(Tau)),max(max(Tau))]);
xlabel('\tau');
ylabel('weights (\alpha=0.4)');
title('COMPAS')
leg = legend('intercept','age',...
    'juv_fel_count','juv_misd_count','juv_other_count',...
    'race','sex','priorscount','felony charge','Location','southwest')
set(leg,'Interpreter', 'none')
saveas(f1,'../Plots/IndividualFairness/COMPAS_W_alpha80','png');
clf(f1);
close(f1);