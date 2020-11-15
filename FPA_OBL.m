function D  = REALFPA(V, I)
% 1- Increment value used to increase/decrease the duty cycle       D  aik D k baad saary aany walay D puranay walay D se baray hn gy.
% 2- use one D randomnly calculate power and save both, repeat and check if p> or <pold, depending on that save new couple of P and D or ignore them and goto new random value of D. 
a=100      ;                                                                       % Reduced oscillation FPA algorithm ROFPA - little oscillations improve the results.


%============Implementing FPA_OBL=====(GitHub Repository Test)
persistent Dold d w x y Pold DC Power start;                                               % Once all pollens through local pollination and then through global pollination, then take top 5 and repeat.
dataType = 'double';
if isempty(Pold)
    Dold=0.5;
    w=0;
    x=0;
    y=0;
    d=Dold;
    Pold=0;
    start=1;
    DC=zeros(a,1);  % DC= DutyCycles n+1 is to make = to Power array size
    Power=zeros(a,1);
end
D=Dold;
I;
V;
P= V*I;
dP=P-Pold;
count = start;
final = zeros(a,2);
Xmax=1; Ymax=1;
Xmin=0; Ymin=0;
w=w+1;
if w==100
    count;
    x=1-x;
    y=1-y;
        if count <= 30

    x
    
                count
            switch x
                case 1
           P= V*I;
           Power(count,1) = P;
           DC(1,1)= d;
           D = rand(1,1);
           DC(count+1,1)= D;
           start= count+1;
           w=0;
                case 0
                    P= V*I;
           Power(count,1) = P;
           
           D=Xmax+Xmin-D;
           DC(count+1,1)=D ;
           start= count+1;
           w=0;
            end
        end
        %-------------------switch y
        
        switch y
        case 1
        %------------------
        if count>30 & count<a
           P= V*I;
           Power(count,1) = P;
           b=rand(1,1);
                if b<0.8
                   D = DC(3,1)+rand(1,1)*(DC(2,1)-DC(4,1));
                   DC(count+1,1)= D;
                   start= count+1;
                   w=0;
                else
                   beta=1.25;
                   gamma=1.5;
        %           sigma=(gamma*(1+beta)*sin(pi*beta/2)/(gamma*((1+beta)/2)*beta*2^((beta-1)/2)))^(1/beta);
                   sigma= 1.2775;
                   u=randn(1,1)*sigma;
                   v=randn(1,1);
                   step=u./abs(v).^(1/beta);
                   L=10*step;
                   D=DC(count-1,1)+(1.5)*L*(DC(count,1)-DC(count+1,1));
                   DC(count+1,1)= D;
                   start= count+1;
                   w=0;
                end    
        end
        %------------------------
            case 0
                if count>30 && count<a
            P= V*I;
           Power(count,1) = P;
           D=Ymax+Ymin-D;
           
           DC(count+1,1)= D;
          
           start= count+1;
           w=0;
                end
        end
        
        %%%%%%%%%%%%%%%%%%%%%%%%%%
        %---------------------------------------------switch ends
        if count==a
                   P= V*I;
                   Power(count,1) = P;
                   final=[DC, Power] % makes array of [D P]
                   [max_values, idx] = max(final(:,2))%return maximum power from cloumn 2 and its index
                   out=[final(idx,1) max_values]%returns (Dmax,Pmax)
                   D = out(1,1)
                   start= count+1;
                   w=0;
        end
        %------
        D;
        if D>1 | D<0
            D=rand(1,1);
            DC(count+1,1)= D;
        end
        
end
Dold=D;
Pold=P;