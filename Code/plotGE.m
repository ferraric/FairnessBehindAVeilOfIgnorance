GE = load('../Result_Data/IndividualFairness/ge_matrix');
Tau = load('../Result_Data/IndividualFairness/tau_matrix');

GE = GE.dummykey';
Tau = Tau.dummykey';



Alpha = [0,0.2,0.4,0.5,0.6,0.8,1];

f1=figure(1);
set(0,'DefaultAxesFontSize', 22)
alphaIndex = 0;
for alpha=Alpha
    alphaIndex = alphaIndex+1;
    plot(Tau(alphaIndex,:),GE(alphaIndex,:),'Color',[0, alpha , alpha] ,'LineWidth',3)
    hold on
end
xlim([min(min(Tau)),max(max(Tau))]);
xlabel('\tau');
ylabel('generalized entropy');
title('COMPAS')


%plot([min(min(Tau)),max(max(Tau))],[0.020409857168275924,0.020409857168275924],'--','Color',[0, 1 , 1])
legend(['\alpha=',num2str(-Inf)],['\alpha=',num2str(-5)],['\alpha=',num2str(-1)],...
    ['\alpha=',num2str(0.1)],['\alpha=',num2str(0.2)],...
    ['\alpha=',num2str(0.4)],['\alpha=',num2str(0.8)],...
    'Location','southwest')           
saveas(f1,'../Plots/IndividualFairness/COMPAS_GE','png');
clf(f1);
close(f1);