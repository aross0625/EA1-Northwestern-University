function vecOut = makeVector(matrixIn)

if(~isnumeric(matrixIn))
   error('The matrix must be numeric.'); 
end
if(ndims(matrixIn) > 2)
   error('The matrix cannot have more than two dimensions.'); 
end

vecOut = matrixIn(:);
end