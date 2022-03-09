clear ; 
clc;
%T��������������2�״��Ĵ����¶ȣ���Po������վˮƽ�Ĵ���ѹ����P��ƽ����ƽ��Ĵ���ѹ����
%U������߶�2�״������ʪ�ȣ���N������������VV��ˮƽ�ܼ��ȣ���Td������߶�2�״���¶���¶ȣ���RRR����ˮ����
%% load
inputfile = '����2010-2020.xls';
%����
[~,datetxt] = xlsread(inputfile, 1, 'A8:A27492');
%date = datetime(datetxt, 'InputFormat', 'dd.MM.yyyy HH');
date = datenum(datetxt,'dd.MM.yyyy HH');
dateplot = datetime(datetxt, 'InputFormat', 'dd.MM.yyyy HH:mm');
%���ݼ�
[num, txt, raw] = xlsread(inputfile);
index = [1,2,3,5,21,22];
data = num(:,index);
%label={'T','Po','P','U', 'VV', 'Td'};
%% ���ݳ�ʼ��
[M, N] = size(data);
% T��ȱʧֵ���٣��������ݼ����˹�����
% Po��ȱʧֵ����
for i = 1:M             %����Poȱʧֵ��������������ݵľ�ֵ���
    if isnan(data(i, 2))
       j = i;
       while isnan(data(j - 1, 2))
           j = j - 1;
       end
       k = i;
       while isnan(data(k + 1, 2))
           k = k + 1;
       end
       data(i, 2) = (data(j - 1, 2) + data(k + 1, 2))/2;
    end    
end
% P��ȱʧֵ����
for i = 1:M             %����Pȱʧֵ��������������ݵľ�ֵ���
    if isnan(data(i, 3))
       j = i;
       while isnan(data(j - 1, 3))
           j = j - 1;
       end
       k = i;
       while isnan(data(k + 1, 3))
           k = k + 1;
       end
       data(i, 3) = (data(j - 1, 3) + data(k + 1, 3))/2;
    end    
end
% U��ȱʧֵ���٣��������ݼ����˹�����
% VV��NaN��ֵ�����������'����0.1'��ȱʧֵ��
for i = 1:M             %����VVȱʧֵ��������������ݵľ�ֵ���
    if isnan(data(i, 5))
       if strcmp(txt(i + 7,index(5) + 1), '')
            j = i;
            while isnan(data(j - 1, 5))
                j = j - 1;
            end
            k = i;
            while isnan(data(k + 1, 5))
                k = k + 1;
            end
            data(i, 5) = (data(j - 1, 5) + data(k + 1, 5))/2;
       else
            data(i, 5) = 0.05; %����'����0.1'����Ϊ0.05
       end 
    end
end
% Td��ȱʧֵ���٣��������ݼ����˹�����
% for i = 1:M             %�ҳ�ȱʧֵλ��
%     if isnan(data(i, 6))
%         disp(i);
%         disp(txt(i + 7,index(6) + 1))
%     end    
% end
%% ���캯������
%% 
dataplot = data; %ԭʼ������ͼ
r = corrcoef(dataplot);  %��������������֮������ϵ����ѡȡ���ϵ������ֵ����80%�ģ���������ϵ����ͼ
dateplot = datenum(dateplot);
dateplot = dateplot(1:25:end,1);
% dateplot = flipud(dataplot);
%%  T����������2�״��Ĵ����¶ȣ������ڵı仯����
T = dataplot(:,1);
T = T(1:25:end,1);
dateT = [dateplot';T']';
x1 = dateT(:,1);
y1 = dateT(:,2);
H1 = figure;
plot(x1,y1,'r');
title('�¶�ʱ������');
xlabel('ʱ��');
ylabel('�¶�');
datetick('x', 26); % ������������Ϊ���ڸ�ʽ

%%   Po������վˮƽ�Ĵ���ѹ�������ڵı仯����
Po = dataplot(:,2);
Po = Po(1:25:end,1);
datePo = [dateplot';Po']';
x2 = datePo(:,1);
y2 = datePo(:,2);
H2 = figure;
plot(x2,y2,'g');
title('ˮƽ��ѹʱ������');
xlabel('ʱ��');
ylabel('ˮƽ��ѹ');
datetick('x', 26); % ������������Ϊ���ڸ�ʽ

%%  P��ƽ����ƽ��Ĵ���ѹ�������ڵı仯����
P = dataplot(:,3);
P = P(1:25:end,1);
dateP = [dateplot';P']';
x3 = dateP(:,1);
y3 = dateP(:,2);
H3 = figure;
plot(x3,y3,'b');
title('��ƽ����ѹʱ������');
xlabel('ʱ��');
ylabel('��ƽ����ѹ');
datetick('x', 26); % ������������Ϊ���ڸ�ʽ

%%  U������߶�2�״������ʪ�ȣ������ڱ仯����

U = dataplot(:,4);
U = U(1:25:end,1);
dateT = [dateplot';U']';
x4 = dateT(:,1);
y4 = dateT(:,2);
H4 = figure;
plot(x4,y4,'r');
title('���ʪ��ʱ������');
xlabel('ʱ��');
ylabel('����2�״����ʪ��');
datetick('x', 26); % ������������Ϊ���ڸ�ʽ

%%  VV��ˮƽ�ܼ��ȣ���ʱ��仯����
VV = dataplot(:,5);
VV = VV(1:25:end,1);
dateT = [dateplot';VV']';
x5 = dateT(:,1);
y5 = dateT(:,2);
H5 = figure;
plot(x5,y5,'g');
title('ˮƽ�ܼ���ʱ������');
xlabel('ʱ��');
ylabel('ˮƽ�ܼ���');
datetick('x', 26); % ������������Ϊ���ڸ�ʽ

%%  Td������߶�2�״���¶���¶ȣ���ʱ��仯����
Td = dataplot(:,6);
Td = Td(1:25:end,1);
dateTd = [dateplot';Td']';
x6 = dateTd(:,1);
y6 = dateTd(:,2);
H6 = figure;
plot(x6,y6,'b');
title('����߶�2�״�¶���¶�ʱ������');
xlabel('ʱ��');
ylabel('����߶�2�״�¶���¶�');
datetick('x', 26); % ������������Ϊ���ڸ�ʽ

%�������ϵ������r�ó����ϵ���ٷ�֮��ʮ�������Ķԣ�TPo��ϵͼ,TP��ϵͼ,,TTd��ϵͼ��PoP��ϵͼ
%% T��������������2�״��Ĵ����¶ȣ���Po������վˮƽ�Ĵ���ѹ����ϵɢ��ͼ
T = dataplot(:,1);
Po = dataplot(:,2);
T = T(1:25:end,1);
Po = Po(1:25:end,1);
TPo = [T';Po']';
x7 = TPo(:,1);
y7 = TPo(:,2);
H7 = figure;
plot(x7,y7,'r.');
title('��������2�״������¶���ˮƽ����ѹ��ϵɢ��ͼ');
xlabel('��������2�״������¶�');
ylabel('Po������վˮƽ�Ĵ���ѹ��');

%% T����������2�״��Ĵ����¶ȣ���P��ƽ����ƽ��Ĵ���ѹ���Ĺ�ϵɢ��ͼ
T = dataplot(:,1);
P = dataplot(:,3);
T = T(1:25:end,1);
P = P(1:25:end,1);
TP = [T';P']';
x8 = TP(:,1);
y8 = TP(:,2);
H8 = figure;
plot(x8,y8,'b.');
title('��������2�״������¶���ƽ����ƽ�����ѹ��ϵɢ��ͼ');
xlabel('��������2�״������¶�');
ylabel('ƽ����ƽ�����ѹ');
%% T����������2�״��Ĵ����¶ȣ���Td������߶�2�״���¶���¶ȣ��Ĺ�ϵɢ��ͼ
T = dataplot(:,1);
Td = dataplot(:,6);
T = T(1:25:end,1);
Td = Td(1:25:end,1);
TTd = [T';Td']';
x9 = TTd(:,1);
y9 = TTd(:,2);
H9 = figure;
plot(x9,y9,'g.');
title('��������2�״��Ĵ����¶������߶�2�״���¶���¶ȹ�ϵɢ��ͼ');
xlabel('��������2�״������¶�');
ylabel('����߶�2�״�¶���¶�');
%% Po������վˮƽ�Ĵ���ѹ����P��ƽ����ƽ��Ĵ���ѹ���Ĺ�ϵɢ��ͼ
P = dataplot(:,2);
Po = dataplot(:,3);
P = P(1:25:end,1);
Po = Po(1:25:end,1);
PPo = [P';Po']';
x10 = PPo(:,1);
y10 = PPo(:,2);
H10 = figure;
plot(x10,y10,'b.');
title('ˮƽ����ѹ��ƽ����ƽ�����ѹ�Ĺ�ϵɢ��ͼ');
xlabel('����վˮƽ����ѹ');
ylabel('ƽ����ƽ�����ѹ');
%% ����ѵ���������Լ�
data = [date data];
data = flipud(data);
labels = {'������������2�״��Ĵ����¶�', '����վˮƽ�Ĵ���ѹ', 'ƽ����ƽ��Ĵ���ѹ', '����߶�2�״������ʪ��', 'ˮƽ�ܼ���', '����߶�2�״���¶���¶�'};
%[D,D_means,D_std] = zscore(data); %��ֵ��׼��
trains = data(1:7/10*M,:);
[trains,train_means,train_std] = zscore(trains);
tests = data(7/10*M + 1:M,:);
[tests,test_mean,test_std] = zscore(tests);
%% ��ά
[coef,score,latent,t2] = pca(trains); 
latent = 100 * latent / sum(latent); %��ȡ���׶ȣ��ٷֱ���ʽչʾ
% disp(latent);
%�޳����׶ȹ��͵�����
matrix = score(:,[1,2,3]);
score_test = tests * coef;
matrix_test = score_test(:,[1,2,3]);
% retain_dimensions = 4;
% [U,S,V] = svd(cov(data));
% reduced_X = data*U(:,1:retain_dimen-sions);
% disp(data);
%% ����������ģ��
% ����������
input = [matrix(1:3:7/10*M-2, :) matrix(2:3:7/10*M-1, :)]';
target = [matrix(3:3:7/10*M, :)]';
itest = [matrix_test(1:3:3*M/10-2, :) matrix_test(2:3:3*M/10-1, :)]';
ttest = [matrix_test(3:3:3*M/10, :)]';

[input, ps_input] = mapminmax(input,0,1);%��һ��
i_test = mapminmax('apply', itest, ps_input);
[target, ps_target] = mapminmax(target,0,1);%��һ��
% ���������
net = patternnet(20); %�������񾭸���
net.trainFcn = 'trainlm';
net.layers{1}.transferFcn ='logsig';
net.layers{2}.transferFcn ='logsig';
net.trainParam.epochs = 50000; %��������
net.trainParam.show = 50; %ѵ�������ʾƵ��
net.trainParam.showCommandLine = 0;
%net.trainParam.mc = 0.95; %���Ӷ�������
%net.trainParam.Mu = 0;
net.trainParam.lr = 0.005; %ѧϰ����
net.trainParam.showWindow = 1; 
net.trainParam.goal = 1e-5; %ѵ��Ŀ����С��� 
net.trainParam.time = inf; %���ѵ��ʱ��
net.trainParam.min_grad = 1e-12; %���ܺ�������С�ݶ�
net.trainParam.max_fail = 10; %���ʧ�ܴ���
net.performFcn='mse'; %����ж�

[net, tr]= train(net,input,target);
disp('BP������ѵ����ɡ�');

%y = sim(net,input);
%plotconfusion(target,y);
t = sim(net,i_test); %�������
T_sim = mapminmax('reverse', t, ps_target); %����һ��
save model net;
save pca_coef coef;
save ps_input ps_input;
save ps_target ps_target;

%��ͼ
result = matrix_test;
result(3:3:3*M/10, :) = T_sim';
result = result * coef(:,[1,2,3])';
result = result .* repmat(test_std,size(tests,1),1) + repmat(test_mean,size(tests,1),1);%����׼��
testss = tests .* repmat(test_std,size(tests,1),1) + repmat(test_mean,size(tests,1),1);%����׼��

testplot = testss(3:3:3*M/10,:);
resultplot = result(3:3:3*M/10,:);

figure
%'������������2�״��Ĵ����¶�'
plot(1:10:M/10,testplot(1:10:M/10, 2),'b:',1:10:M/10,resultplot(1:10:M/10, 2),'r-')
title(strcat(labels(1), '�ع�Ԥ������'));
ylabel(labels(1));
xlabel('���Լ����������');
legend('��ʵֵ','Ԥ��ֵ')

figure
% '����վˮƽ�Ĵ���ѹ', 
plot(1:10:M/10,testplot(1:10:M/10, 3),'b:',1:10:M/10,resultplot(1:10:M/10, 3),'r-')
title(strcat(labels(2), '�ع�Ԥ������'));
ylabel(labels(2));
xlabel('���Լ����������');
legend('��ʵֵ','Ԥ��ֵ')

figure
%'ƽ����ƽ��Ĵ���ѹ', 
plot(1:10:M/10,testplot(1:10:M/10, 4),'b:',1:10:M/10,resultplot(1:10:M/10, 4),'r-')
title(strcat(labels(3), '�ع�Ԥ������'));
ylabel(labels(3));
xlabel('���Լ����������');
legend('��ʵֵ','Ԥ��ֵ')

figure
%'����߶�2�״������ʪ��'
plot(1:10:M/10,testplot(1:10:M/10, 5),'b:',1:10:M/10,resultplot(1:10:M/10, 5),'r-')
title(strcat(labels(4), '�ع�Ԥ������'));
ylabel(labels(4));
xlabel('���Լ����������');
legend('��ʵֵ','Ԥ��ֵ')

figure
%'ˮƽ�ܼ���'
plot(1:10:M/10,testplot(1:10:M/10, 6),'b:',1:10:M/10,resultplot(1:10:M/10, 6),'r-')
title(strcat(labels(5), '�ع�Ԥ������'));
ylabel(labels(5));
xlabel('���Լ����������');
legend('��ʵֵ','Ԥ��ֵ')

figure
%, '����߶�2�״���¶���¶�'
plot(1:10:M/10,testplot(1:10:M/10, 7),'b:',1:10:M/10,resultplot(1:10:M/10, 7),'r-')
title(strcat(labels(6), '�ع�Ԥ������'));
ylabel(labels(6));
xlabel('���Լ����������');
legend('��ʵֵ','Ԥ��ֵ')