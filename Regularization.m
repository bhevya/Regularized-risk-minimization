d=[];
load("problem2.mat");
plot(x,y,'rx');
trainerror=[];
testerror=[];
[m,n]=size(x);
%initialization of data structures holding test and training data
xtest=zeros(m/2,n);
xtrain=zeros(m/2,n);
%partition of data
for i=1:m/2
   xtrain(i,:)=x(i,:);
end
for i=1:length(y)/2
   ytrain(i,:)=y(i,:);
end
for i=1:m/2
    xtest(i,:)=x(i+(m/2),:);
end
for i=1:length(y)/2
    ytest(i,:)=y(i+(length(y)/2),:);
end

% passing lambda values from 1 to 1000    
d1=1:1000;
d=1
for w=1:1000,
   [trainerror(w),model,testerror(w)]=polyreg2(xtrain,ytrain,d,xtest,ytest);
   d=d+1;
end
close all;
%finding the point where test error is minimum
[i,j]=min(testerror);
%print[]
clf;
hold on;
% plotting the testing and training error 
plot(d1,trainerror,'b');
plot(d1,testerror,'r');
plot(d1(j),testerror(j),'blx');
title('train and test error with regularization');
legend('trainerror','testerror');
ylabel('error');
xlabel('lambda');

%print('p2.png','-dpng')    