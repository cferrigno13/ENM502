function [e] = L2error(factor,coarse,al)
hc = 1/coarse;
Nc = 1/hc;
TC = twodee(hc,al);

hf = 1/(factor*Nc);
Nf = 1/hf;
TF = twodee(hf,al);
TFR = reshape(TF,Nf+1,Nf+1);

TFFR = zeros(Nc+1,Nc+1);
k = 1;
m = 1;
while k <= Nc+1
    j = 1;
    i = 1;
    while j <= Nc+1
    TFFR(k,j) = TFR(m,i);
    i = i + factor;
    j = j + 1;
    end
    m = m + factor;
    k = k + 1;
end
TFF = reshape(TFFR,(Nc+1)^2,1);
E = TC - TFF;
EE = E.*E;
[e] = (sum(EE))^(1/2)/length(EE);