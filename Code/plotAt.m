
AT = load('../Result_Data/IndividualFairness/at_matrix');
Tau = load('../Result_Data/IndividualFairness/tau_matrix');

AT = AT.dummykey';
Tau = Tau.dummykey';

% because it is not defined for negative alpha we cut some parts out here
AT = AT(4:end,:);
Tau = Tau(4:end,:);


Alpha = [0.1,0.2,0.4,0.8];

f1=figure(1);
set(0,'DefaultAxesFontSize', 22)
alphaIndex = 0;
for alpha=Alpha
    alphaIndex = alphaIndex+1;
    plot(Tau(alphaIndex,:),AT(alphaIndex,:),'Color', [alpha, 0 , 0],'LineWidth',3)
    hold on
end
xlim([0.85,max(max(Tau))]);
xlabel('\tau');
ylabel('Atkinson Index');
title('COMPAS')
legend(['\alpha=',num2str(0.1)],['\alpha=',num2str(0.2)],...
    ['\alpha=',num2str(0.4)],['\alpha=',num2str(0.8)],...
    'Location','northwest')           
saveas(f1,'../Plots/IndividualFairness/COMPAS_AT','png');
clf(f1);
close(f1);