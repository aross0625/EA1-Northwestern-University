function MSE = calcMSE(x1, x2)

Vector1 = makeVector(x1);
Vector2 = makeVector(x2);

MSE1 = 0;
for ii = 1:length(Vector1)
   MSE1 = MSE1 + (Vector1(ii)-Vector2(ii))^2;
end

MSE = 1/length(Vector1) * MSE1;