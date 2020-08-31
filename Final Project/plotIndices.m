function plotIndices(scrambledIndices, correctIndices)

AxisLength = length(correctIndices);
x = 0:AxisLength-1;
y = scrambledIndices(1:100);
y2 = correctIndices(1:100);

figure();
subplot(1,2,1);
axis square;
axis([0 AxisLength-1 0 AxisLength-1]);
title('Indices');
xlabel('Player ID');
ylabel('Databases');
plot(x,y,'o');
axis equal;
axis square;

subplot(1,2,2);
axis square;
axis([0 AxisLength-1 0 AxisLength-1]);
title('Indices');
xlabel('Player ID');
ylabel('Databases');
plot(x,y2,'o');
axis equal;
axis square;
