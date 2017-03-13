%predict 1/5 image DMOS for 5 class 
%ÑµÁ·ÍøÂç
clear all;
close all;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%all_data=[pc_mean' pc_entropy' ori_entropy' grd_mean' ori_energy' psnr_all' ssim_all'];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

load  train_dmos_new_15.mat     
load  train_dmos_new_25.mat     
load  train_dmos_new_35.mat     
load  train_dmos_new_45.mat     
load  train_dmos_new_55.mat  

load  train_data_15.mat      
load  train_data_25.mat      
load  train_data_35.mat      
load  train_data_45.mat      
load  train_data_55.mat

train_psnr_data_15=train_data_15(6,:);
train_psnr_data_25=train_data_25(6,:);
train_psnr_data_35=train_data_35(6,:);
train_psnr_data_45=train_data_45(6,:);
train_psnr_data_55=train_data_55(6,:);

train_ssim_data_15=train_data_15(7,:);
train_ssim_data_25=train_data_25(7,:);
train_ssim_data_35=train_data_35(7,:);
train_ssim_data_45=train_data_45(7,:);
train_ssim_data_55=train_data_55(7,:);

train_data_15(7,:)=[];
train_data_25(7,:)=[];
train_data_35(7,:)=[];
train_data_45(7,:)=[];
train_data_55(7,:)=[];

train_data_15(6,:)=[];
train_data_25(6,:)=[];
train_data_35(6,:)=[];
train_data_45(6,:)=[];
train_data_55(6,:)=[];

train_data_15(5,:)=[];
train_data_25(5,:)=[];
train_data_35(5,:)=[];
train_data_45(5,:)=[];
train_data_55(5,:)=[];

%train_data_13(4,:)=[];
%train_data_23(4,:)=[];
%train_data_33(4,:)=[];

%train_data_13(3,:)=[];
%train_data_23(3,:)=[];
%train_data_33(3,:)=[];

%train_data_13(2,:)=[];
%train_data_23(2,:)=[];
%train_data_33(2,:)=[];

load  train_dmos_15.mat     
load  train_dmos_25.mat     
load  train_dmos_35.mat     
load  train_dmos_45.mat     
load  train_dmos_55.mat  

train_dmos1=[train_dmos_new_35 train_dmos_new_15 train_dmos_new_25 train_dmos_new_45];
train_data1=[train_data_35 train_data_15 train_data_25 train_data_45];
train_dmos_old=[train_dmos_35 train_dmos_15 train_dmos_25 train_dmos_45];

%train_psnr_data1=[train_psnr_data_33 train_psnr_data_13];
%train_ssim_data1=[train_ssim_data_33 train_ssim_data_13];
%test_psnr_data1=train_psnr_data_23;
%test_ssim_data1=train_ssim_data_23;

test_dmos1=train_dmos_new_55;
test_data1=train_data_55;

test_dmos_old=train_dmos_55;


[m n]=size(train_dmos1);

k=0;

for i=1:n
    if (train_dmos_old(i)>0)%%%train_dmos1
        k=k+1;
        train_dmos1_2(k)=train_dmos1(i);  
        train_data1_2(:,k)=train_data1(:,i);
    end
end

[m n]=size(test_dmos1);

k=0;

for i=1:n
    if (test_dmos_old(i)>0)%%test_dmos1
        k=k+1;
        test_dmos1_2(k)=test_dmos1(i);  
        test_data1_2(:,k)=test_data1(:,i);
    end
end

%train_data1_2(4,:)=[];
%test_data1_2(4,:)=[];

train_dmos=train_dmos1_2;
test_dmos=test_dmos1_2;

train_data=train_data1_2;
test_data=test_data1_2;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
all_dmos=[train_dmos test_dmos];
all_data=[train_data test_data];

train_data_min=min(train_data');
train_data_max=max(train_data');

test_data_min=min(test_data');
test_data_max=max(test_data');

all_data_min=min(all_data');
all_data_max=max(all_data');

[m n]=size(train_data);
[k l]=size(test_data);
for i=1:n
    train_data_minmax(:,i)=(train_data(:,i)-all_data_min')./(all_data_max'-all_data_min');
    %%%=(train_data(:,i)-train_data_min')./(train_data_max'-train_data_min');
end

for i=1:l
    test_data_minmax(:,i)=(test_data(:,i)-all_data_min')./(all_data_max'-all_data_min');
    %%%=(test_data(:,i)-test_data_min')./(test_data_max'-test_data_min');
end

for i=1:(n+l)
    all_data_minmax(:,i)=(all_data(:,i)-all_data_min')./(all_data_max'-all_data_min');
end

net = newgrnn(train_data_minmax,train_dmos,0.03);%0.026
%ww=net.IW{1,1};
%hh=dist(ww,train_data_minmax);
%aa1=radbas(hh,net.b{1,1});
%vv=net.LW{2,1};
%aa2=normprod(vv,aa1);

%aaa1=cov(ww,train_data_minmax).*ww./var(aa1);%cov(aa1,)
%bbb=cov(aa1,aa2).*vv./var(aa2);
%save grnn_net_003_nr net

%load babyc_train_data.mat

%for i=1:6
%    babyc_train_data1(i,:)=(babyc_train_data(i,:)'-all_data_min')./(all_data_max'-all_data_min');
%end

qa=sim(net,test_data_minmax);%%%%%test_data1%%%all_data1

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%PSNR/SSIM test
[m n]=size(test_dmos1);

k=0;
for i=1:n
    if (test_dmos1(i)>0)
        k=k+1;
        %test_dmos(k)=test_dmos1(i);  
        %qa(:,k)=test_ssim_data1(:,i);
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%qa=test_psnr_data_13;
%[mm ll]=size(test_dmos);
%k=0;
%for j=1:ll
%    if (test_dmos(j)>0)
%        k=k+1;
%        x(k)=qa(j);
%        y(k)=test_dmos(j);
%    end
%end

x=qa;
y=test_dmos; %%%test_dmos%%all_dmos

%plot(x,y,'*');
%xlabel('Predicted DMOS');
%ylabel('DMOS');

corr_spearman=corr(x',y','type','Spearman');
corr_Pearson=corr(x',y','type','Pearson');

beta0(1) = max(y);
beta0(2) = min(y);
beta0(4) = 1;
beta0(3) = mean(x);
beta0(5) = 1;

% estimate the parameters
%for i=1:length(x)
[beta_psnr,r,J] = nlinfit(x,y,@logistic_function,beta0);
%end
% Now get the actual values...after curve fitting...
y2 = logistic_function(beta_psnr,x);
corr2=corr(y2',y');
corrs=corr_spearman
%corrpear=corr_Pearson

i=min(x):0.01:max(x);
xhat = logistic_function(beta_psnr,i);
%hold on
%plot(i,xhat,'k-');

%error=abs(y2-y);
%MAE=mean(error)

%RMS=sqrt(var(y2-y))
RMS=sqrt(sum((y2-y).*(y2-y))./length(y));

%mean_y=mean(y);
%DMOS_SE=sqrt(sum((y-y2).*(y-y2))./length(y));
m=0;
for i=1:length(y)
    if abs(y2(i)-y(i))>(2*abs(std(y2-y)))%root_sq_error)
        m=m+1;
    end
end
%Outlier_Rate=m/length(y)

%

