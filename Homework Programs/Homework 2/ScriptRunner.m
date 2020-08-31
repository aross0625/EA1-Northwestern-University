f0 = 1/200;
sig = gen_square_wave(100,4);
n = 30;
% halfp = 100;
% cycles = 4;

% matrix1 = [];
% matrix2 = [];

fprintf('Least Squares Error               Overshoot Error\n');

for ii = 1:n
    
    [a, b , c , d] = approx_sin(sig, ii, f0);
    fprintf('%f                    %f\n', c, d);
    
    
% [coeffs,sig_approx,error] = approx_sin(sig, n, f0);
% square_wave = gen_square_wave(halfp, cycles);
% 
% matrix1 = [matrix1; error];
% MaxError = max(sig_approx-1);
% matrix2 = [matrix2;MaxError];


end

% answers = [matrix1 matrix2];
% fprintf('Least squares error:                       ');
% fprintf('Maximum error:            \n');
% disp(results);


%  fprintf('Least squares error:\n');
%     disp(error(ii));
%     MaxError = max(sig_approx-1);
%     fprintf('Maxiumum Error:\n');
%     disp(MaxError(ii));