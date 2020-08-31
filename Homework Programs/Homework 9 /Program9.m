%%%%%% Square Wave Generator Function 
function square_wave = gen_square_wave(halfp,cycles)

period = 2*halfp;
t = zeros(0,period*cycles);

neg_cycle = -ones(1,halfp);
pos_cycle = ones(1,halfp);

overall_cycle = [pos_cycle neg_cycle];

for ii = 1:cycles
    t(((ii-1)*period)+1:(ii*period)) = overall_cycle;
end

% plot(t,x,'.-');
% xlabel('t / \pi')
% grid on

% hold off
% plot(t);
% figure();
% plot(overall_cycle);

%%% Period*number of cycles

square_wave = t;

end


%%%%%% Approximating Sine Function
function [coeffs,sig_approx,error, MaxError] = approx_sin(sig,n,f0)

%Initialization
T = length(sig);
F = [];
F(:,1) = ones(T,1);

%Calculating variable 'coeffs'
t = (1:T)';
for ii = 1:n
    F(:,ii+1) = sin(2*pi*f0*ii*t);
end
coeffs = F\sig';

% Signal Approximation
sig_approx = F*coeffs;


%Printing the approximate signal and the sum of squared errors
fprintf('\nApproximate signal = %.2f',coeffs(1));
for ii=1:n
   fprintf(' + %.2f sin(2*pi*%d*f0*k)',coeffs(ii+1),ii);
end
fprintf('\n');

error = sum((sig' - sig_approx).^2);
fprintf('\nApproximate error is: %f\n', error);


% Maximum Error
MaxError = max(sig_approx-1);

end