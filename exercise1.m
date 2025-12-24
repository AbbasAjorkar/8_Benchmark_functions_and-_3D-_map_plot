%% Advanced Optimization Course, First Assignment - Abbas Ajorkar - 100783351

%% Common Part
%%
% This is the general part which will be used in the all following benchmark functions
% 
%%
% 
% * The implementation common part

% D is the dimension of the functions which is an integer number (D >= 1), just for example I set D =8 
D = 8;
% X is the coordination of a point for implementation of the function, just for example I set it as the following 
X = [1,0,-1,4,2,2,3,-2];

%% 
% 
% * The plotting common part
 x1_p = -10 : 0.1 : 10;
 x2_p = -10 : 0.1 : 10;
% set D = 2 for plotting
D_p = 2;
[X1_p,X2_p] = meshgrid(x1_p,x2_p); 




%% Exercise 1 - High Conditioned Elliptic Function 

%%
% 
% $f_1(x)=\sum_{i=1}^{D} (10^6)^{\frac{i-1}{D-1}} x_i^2$
% 

%%
% Part(a)

% set the initial value for f1 for implementation
f1 = 0;
% calculate f1 in a loop
for ii = 1 : D
    f1 = f1 + ((10)^6)^((ii-1)/(D-1))*(X(ii)^2);
end

%%
% Part(b)

% calculate f1_p over the defined meshgrid [X1_p,X2_p] = meshgrid(x1_p,x2_p)
f1_p = ((10)^6)^((1-1)/(D_p-1))*(X1_p.^2)+...
       ((10)^6)^((2-1)/(D_p-1))*(X2_p.^2);
% plot the surface
surfc(X1_p,X2_p,f1_p,'FaceAlpha',0.5)
colorbar

%% Exercise 2 - Bent Cigar function 

%%
% 
% $f_2(x)= x_1^2 + {10^6} \sum_{i=2}^{D} x_i^2$
% 

%%
% Part(a)

% set the initial value for f2 for implementation
f2 = 0;
% calculate f2 in a loop
f2 = f2 + X(1)^2;
for ii = 2 : D
    f2 = f2 + ((10)^6)*(X(ii)^2);
end

%%
% Part(b)

% calculate f2_p over the defined meshgrid [X1_p,X2_p] = meshgrid(x1_p,x2_p)
f2_p = (X1_p.^2) + ((10)^6)*(X2_p.^2);
% plot the surface
surfc(X1_p,X2_p,f2_p,'FaceAlpha',0.5)
colorbar

%% Exercise 3 - Discus Function 

%%
% 
% $f_3(x)= {10^6} x_1^2 + \sum_{i=2}^{D} x_i^2$
% 

%%
% Part(a)

% set the initial value for f3 for implementation
f3 = 0;
% calculate f3 in a loop
f3 = f3 + (10^6)*(X(1)^2);
for ii = 2 : D
    f3 = f3 + (X(ii)^2);
end

%%
% Part(b)

% calculate f3_p over the defined meshgrid [X1_p,X2_p] = meshgrid(x1_p,x2_p)
f3_p = (10^6)*(X1_p.^2) + (X2_p.^2);
% plot the surface
surfc(X1_p,X2_p,f3_p,'FaceAlpha',0.5)
colorbar


%% Exercise 4 - Rosenbrock's Function 

%%
% 
% $f_4(x)= \sum_{i=1}^{D-1} (100(x_i^2-x_{i+1})^2+(x_i-1)^2)$
% 

%%
% Part(a)

% set the initial value for f4 for implementation
f4 = 0;
for ii = 1 : D-1
    f4 = f4 + (100*(X(ii)^2-X(ii+1))^2+(X(ii)-1)^2);
end

%%
% Part(b)

% calculate f4_p over the defined meshgrid [X1_p,X2_p] = meshgrid(x1_p,x2_p)
f4_p = (100)*(X1_p.^2-X2_p).^2 + (X1_p-1).^2;
% plot the surface
surfc(X1_p,X2_p,f4_p,'FaceAlpha',0.5)
colorbar


%% Exercise 5 - Ackley's Function 

%%
% 
% $f_5(x)= -20exp(-0.2\sqrt{{\frac{1}{D}}{\sum_{i=1}^{D}x_i^2}})-exp(\frac{1}{D}{\sum_{i=1}^{D}cos(2{\pi}x_i)})+20+e$
% 

%%
% Part(a)

% set the initial value for sum1 % sum2 for implementation
sum1 = 0;
sum2 = 0;
for ii = 1 : D
    sum1 = sum1 + X(ii)^2;
    sum2 = sum2 + cos(2*pi*X(ii));
end
f5 = -20*exp(-0.2*sqrt(sum1/D))-exp(sum2/D)+20+exp(1);

%%
% Part(b)

% calculate f5_p over the defined meshgrid [X1_p,X2_p] = meshgrid(x1_p,x2_p)
f5_p = (-20)*exp(-0.2*sqrt((X1_p.^2+X2_p.^2)/D_p))-exp((cos(2*pi*X1_p)+cos(2*pi*X2_p))/D_p)+...
       20 + exp(1);
% plot the surface
surfc(X1_p,X2_p,f5_p,'FaceAlpha',0.5)
colorbar
                    
%% Exercise 6 - Weierstrass Function 

%%
% 
% $f_6(x)= \sum_{i=1}^{D}(\sum_{k=0}^{k_{max}}[a^k cos(2{\pi}b^k(x_i+0.5))])-D\sum_{k=0}^{k_{max}}[a^k cos(2{\pi}b^k.0.5)], a=0.5, b=3, k_{max}=20$


%%
% Part(a)

% set the initial values for implementation
sum1 = 0;
sum2 = 0;
a = 0.5;
b = 3;
kmax = 20;
for ii = 1 : D
    for kk = 0 : kmax
        sum1 = sum1 + (a^kk)*cos(2*pi*(b^kk)*(X(ii)+0.5));
        if ii == 1
            sum2 = sum2 + (a^kk)*cos(2*pi*(b^kk)*0.5);
        end
    end
end
f6 = sum1 - D * sum2;

%%
% Part(b)

% calculate f6_p over the defined meshgrid [X1_p,X2_p] = meshgrid(x1_p,x2_p)
% set the initial values for ploting
sum1 = 0;
sum2 = 0;
for kk = 0 : kmax
    sum1 = sum1 + (a^kk)*cos(2*pi*(b^kk)*(X1_p+0.5))+...
                  (a^kk)*cos(2*pi*(b^kk)*(X2_p+0.5)); 
    sum2 = sum2 + (a^kk)*cos(2*pi*(b^kk)*0.5);
end
f6_p = sum1 - D_p*sum2;
% plot the surface
surfc(X1_p,X2_p,f6_p,'FaceAlpha',0.5)
colorbar        

%% Exercise 7 - Griewank's Function 

%%
% 
% $f_7(x)= \sum_{i=1}^{D}{\frac{x_i^2}{4000}}-\prod_{i=1}^{D}cos({\frac{x_i}{\sqrt{i}}})+1$


%%
% Part(a)

% set the initial values for implementation
sum1 = 0;
mul1 = 1;
for ii = 1 : D
    sum1= sum1 + X(ii)^2/4000;
    mul1 = mul1 * cos(X(ii)/(sqrt(ii)));
end
f7 = sum1 - mul1 + 1;

%%
% Part(b)

% calculate f7_p over the defined meshgrid [X1_p,X2_p] = meshgrid(x1_p,x2_p)
f7_p = (X1_p.^2 + X2_p.^2)/4000 - cos(X1_p/sqrt(1))*cos(X2_p/sqrt(2)) + 1;
% plot the surface
surfc(X1_p,X2_p,f7_p,'FaceAlpha',0.5)
colorbar


%% Exercise 8 - Rastrigin's Function 

%%
% 
% $f_8(x)= \sum_{i=1}^{D}(x_i^2-10cos(2{\pi}x_i)+10)$


%%
% Part(a)

% set the initial value for f8 for implementation
f8 = 0;
for ii = 1 : D
    f8 = f8 + X(ii)^2 - 10*cos(2*pi*X(ii))-10;
end


%%
% Part(b)

% calculate f8_p over the defined meshgrid [X1_p,X2_p] = meshgrid(x1_p,x2_p)
f8_p = X1_p.^2 - 10*cos(2*pi*X1_p) + 10 +...
       X2_p.^2 - 10*cos(2*pi*X2_p) + 10;
% plot the surface
surfc(X1_p,X2_p,f8_p,'FaceAlpha',0.5)
colorbar

