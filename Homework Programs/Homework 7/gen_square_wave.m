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