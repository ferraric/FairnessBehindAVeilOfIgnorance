Dwork = load('../Result_Data/GroupFairness/dwork_matrix_group');
Tau = load('../Result_Data/GroupFairness/tau_matrix_group');

Dwork = Dwork.dummykey';
Tau = Tau.dummykey';



Alpha = [0,0.2,0.4,0.5,0.6,0.8,1];

f1=figure(1);
set(0,'DefaultAxesFontSize', 22)
alphaIndex = 0;
for alpha=Alpha
    alphaIndex = alphaIndex+1;
    plot(Tau(alphaIndex,:),Dwork(alphaIndex,:),'Color', [0, 0 , alpha],'LineWidth',3)
    hold on
end
xlim([min(min(Tau)),max(max(Tau))]);
xlabel('\tau');
ylabel('average violation');
title('COMPAS')

%plot([min(min(Tau)),max(max(Tau))],[0,0],'--','Color',[0, 0 , 1])

legend(['\alpha=',num2str(-Inf)],['\alpha=',num2str(-5)],['\alpha=',num2str(-1)],...
    ['\alpha=',num2str(0.1)],['\alpha=',num2str(0.2)],...
    ['\alpha=',num2str(0.4)],['\alpha=',num2str(0.8)],...
    'Location','southwest')           
saveas(f1,'../Plots/GroupFairness/COMPAS_Dwork_group','png');
clf(f1);
close(f1);