LL = load('../Result_Data/GroupFairness/accuracy_matrix_group');
Tau = load('../Result_Data/GroupFairness/tau_matrix_group');

LL = LL.dummykey';
Tau = Tau.dummykey';



Alpha = [0,0.25,0.4,0.5,0.6,0.7,0.8];

f1=figure(1);
set(0,'DefaultAxesFontSize', 22)
alphaIndex = 0;
for alpha=Alpha
    alphaIndex = alphaIndex+1;
    plot(Tau(alphaIndex,:),LL(alphaIndex,:),'Color', [alpha, alpha, alpha],'LineWidth',3)
    hold on
end
xlim([min(min(Tau)),max(max(Tau))]);
xlabel('\tau');
ylabel('Accuracy');
title('COMPAS');

%plot([min(min(Tau)),max(max(Tau))],[2795/5278,2795/5278],'--','Color',[0, 0 , 0])

legend(['\alpha=',num2str(-Inf)],['\alpha=',num2str(-5)],['\alpha=',num2str(-1)],...
    ['\alpha=',num2str(0.1)],['\alpha=',num2str(0.2)],...
    ['\alpha=',num2str(0.4)],['\alpha=',num2str(0.8)],...
    'Location','southwest')           
saveas(f1,'../Plots/GroupFairness/COMPAS_LL_group','png');
clf(f1);
close(f1);