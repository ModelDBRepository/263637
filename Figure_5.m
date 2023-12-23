clear all
close all
clc

font = 12;
F=figure(1);
set(F,'units','normalized')

suffix={'a' 'b' 'c' 'd' 'e'};

for j=1:length(suffix)
    
    point=[char(suffix(j))];
    load (['TE_data_Fig5_0',point])
    TE=TGA_results.TEmat;
    TE_S=TGA_results.TEmat_sur;

    diff_xy=TE(1,:)-TE_S(1,:);
    diff_yx=TE(3,:)-TE_S(3,:);

    m_21(1,j)=mean(diff_xy);
    m_12(1,j)=mean(diff_yx);

    s_21(1,j)=std(diff_xy)/sqrt(10);
    s_12(1,j)=std(diff_yx)/sqrt(10);

end

subplot(2,2,1)
errorbar([0:20:80],m_21,s_21,'*-r','linewidth',1.5,'Marker','*','MarkerSize',1)
hold on
errorbar([0:20:80],m_12,s_12,'*-b','linewidth',1.5,'Marker','*','MarkerSize',1)

xlim([-1 81])
ylim([-0.005 0.105])
title('W_P^1^3 = W_P^2^3 = 0')
ylabel('Transfer Entropy')
legend('TE^2^1','TE^1^2','Location','northwest','FontSize',10)
set(gca,'fontsize',font)
set(gca,'xtick',[0 20 40 60 80])
set(gca,'ytick',[0:0.02:0.1])
legend('boxoff')

 m_21_0=m_21;
 m_12_0=m_12;


for j=1:length(suffix)
    
    point=[char(suffix(j))];
    load (['TE_data_Fig5_20',point])
    TE=TGA_results.TEmat;
    TE_S=TGA_results.TEmat_sur;

    diff_xy=TE(1,:)-TE_S(1,:);
    diff_yx=TE(3,:)-TE_S(3,:);

    m_21(1,j)=mean(diff_xy);
    m_12(1,j)=mean(diff_yx);

    s_21(1,j)=std(diff_xy)/sqrt(10);
    s_12(1,j)=std(diff_yx)/sqrt(10);

end


subplot(2,2,2)
errorbar([0:20:80],m_21,s_21,'*-r','linewidth',1.5,'Marker','*','MarkerSize',1)
hold on
errorbar([0:20:80],m_12,s_12,'*-b','linewidth',1.5,'Marker','*','MarkerSize',1)
xlim([-1 81])
ylim([-0.005 0.105])
title('W_P^1^3 = W_P^2^3 = 20')
ylabel('Transfer Entropy')
legend('TE^2^1','TE^1^2','Location','northwest','FontSize',10)
set(gca,'fontsize',font)
set(gca,'xtick',[0 20 40 60 80])
set(gca,'ytick',[0:0.02:0.1])
legend('boxoff')

 m_21_20=m_21;
 m_12_20=m_12;

for j=1:length(suffix)
    
    point=[char(suffix(j))];
    load (['TE_data_Fig5_40',point])
    TE=TGA_results.TEmat;
    TE_S=TGA_results.TEmat_sur;

    diff_xy=TE(1,:)-TE_S(1,:);
    diff_yx=TE(3,:)-TE_S(3,:);

    m_21(1,j)=mean(diff_xy);
    m_12(1,j)=mean(diff_yx);

    s_21(1,j)=std(diff_xy)/sqrt(10);
    s_12(1,j)=std(diff_yx)/sqrt(10);

end


subplot(2,2,3)
errorbar([0:20:80],m_21,s_21,'*-r','linewidth',1.5,'Marker','*','MarkerSize',1)
hold on
errorbar([0:20:80],m_12,s_12,'*-b','linewidth',1.5,'Marker','*','MarkerSize',1)
xlim([-1 81])
ylim([-0.005 0.105])
title('W_P^1^3 = W_P^2^3 = 40')
xlabel('W_P^1^2')
ylabel('Transfer Entropy')
legend('TE^2^1','TE^1^2','Location','northwest','FontSize',10)
set(gca,'fontsize',font)
set(gca,'xtick',[0 20 40 60 80])
set(gca,'ytick',[0:0.02:0.1])
legend('boxoff')

m_21_40=m_21;
m_12_40=m_12;
 
for j=1:length(suffix)
    
    point=[char(suffix(j))];
    load (['TE_data_Fig5_60',point])
    TE=TGA_results.TEmat;
    TE_S=TGA_results.TEmat_sur;

    diff_xy=TE(1,:)-TE_S(1,:);
    diff_yx=TE(3,:)-TE_S(3,:);

    m_21(1,j)=mean(diff_xy);
    m_12(1,j)=mean(diff_yx);

    s_21(1,j)=std(diff_xy)/sqrt(10);
    s_12(1,j)=std(diff_yx)/sqrt(10);

end


subplot(2,2,4)
errorbar([0:20:80],m_21,s_21,'*-r','linewidth',1.5,'Marker','*','MarkerSize',1)
hold on
errorbar([0:20:80],m_12,s_12,'*-b','linewidth',1.5,'Marker','*','MarkerSize',1)
xlim([-1 81])
ylim([-0.005 0.105])
xlabel('W_P^1^2')
title('W_P^1^3 = W_P^2^3 = 60')
ylabel('Transfer Entropy')
legend('TE^2^1','TE^1^2','Location','northwest','FontSize',10)
set(gca,'fontsize',font)
set(gca,'xtick',[0 20 40 60 80])
set(gca,'ytick',[0:0.02:0.1])
legend('boxoff')

m_21_60=m_21;
m_12_60=m_12;

%%
Wp21_s=[0 20 40 60 80];
Wp21_TE_a1=m_12_0;
Wp21_TE_a2=m_12_20;
Wp21_TE_a3=m_12_40;
Wp21_TE_a4=m_12_60;


figure(2)

plot(Wp21_s,Wp21_TE_a1,'b-*','linewidth',1.5,'Marker','*','MarkerSize',8)
hold on
plot(Wp21_s,Wp21_TE_a2,'r-o','linewidth',1.5,'Marker','o','MarkerSize',8)
plot(Wp21_s,Wp21_TE_a3,'k-x','linewidth',1.5,'Marker','x','MarkerSize',8)
plot(Wp21_s,Wp21_TE_a4,'g-+','linewidth',1.5,'Marker','square','MarkerSize',8)

legend('boxoff')
legend('W_P^1^3 = W_P^2^3 = 0','W_P^1^3 = W_P^2^3 = 20','W_P^1^3 = W_P^2^3 = 40', 'W_P^1^3 = W_P^2^3 = 60','Location','northwest')
legend('boxoff')
xlabel('W_P^1^2','fontsize',13)
ylabel('Transfer Entropy^1^2','fontsize',13)
xlim([0 82])
ylim([-0.01 0.1])
set(gca,'fontsize',font)
