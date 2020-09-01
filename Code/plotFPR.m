FPR = load('../Result_Data/IndividualFairness/fpr_matrix');
Tau = load('../Result_Data/IndividualFairness/tau_matrix');

FPR = FPR.dummykey';
Tau = Tau.dummykey';



Alpha = [0,0.2,0.4,0.5,0.6,0.8,1];

f1=figure(1);
set(0,'DefaultAxesFontSize', 22)
alphaIndex = 0;
for alpha=Alpha
    alphaIndex = alphaIndex+1;
    plot(Tau(alphaIndex,:),FPR(alphaIndex,:),'Color', [0, alpha , 0],'LineWidth',3)
    hold on
end
xlim([min(min(Tau)),max(max(Tau))]);
xlabel('\tau');
ylabel('fpr difference');
title('COMPAS')


%plot([min(min(Tau)),max(max(Tau))],[0,0],'--','Color',[0, 1 , 0])

legend(['\alpha=',num2str(-Inf)],['\alpha=',num2str(-5)],['\alpha=',num2str(-1)],...
    ['\alpha=',num2str(0.1)],['\alpha=',num2str(0.2)],...
    ['\alpha=',num2str(0.4)],['\alpha=',num2str(0.8)],...
    'Location','southwest')           
saveas(f1,'../Plots/IndividualFairness/COMPAS_FPR','png');
clf(f1);
close(f1);