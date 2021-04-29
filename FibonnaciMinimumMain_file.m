clc
clear all
close all
% Input using dialog box
prompt = {'Type an expression that is a function of x';'Enter lower limit';'Enter upper limit';'Enter the number of function evaluation (>2):'};
sc = inputdlg(prompt);
% Data conversion according to evaluation and datatype                                                            
f = str2func(['@(x) ' sc{1}]);
a = str2double(sc{2});
b = str2double(sc{3});
n = str2double(sc{4});

k = 2;
L = b - a;
y1 = feval(f,(a));
y2 = feval(f,(b));
% %% Starting the algorithm
while k <= n
    x_1 = n-k+1;
    fx_1 = fibonn(n-k+1);
    fx_2 = fibonn(n+1);
    L_temp = (fx_1/fx_2)* L;
    x1 = a + L_temp;
    x2 = b - L_temp;
    if mod (k,2) == 0
        y1 = feval(f,(x1));
    else
        y2 = feval(f,(x2));
    end
    if y1 > y2
        a = x1;
    else
        b = x2;
    end
    c = 0.5*(a+b);
    k = k + 1;
end
f_val = feval(f,(c));
message = ['The minimum value of function is at x=' num2str(c) char newline 'The minimum value of function F(x) = ' num2str(f_val) ];
msgbox(message);
