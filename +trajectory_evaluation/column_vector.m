function x_column = column_vector(x)
%COLUMN_VECTOR Return always a column vector with same elements of input
%vector
x_column = x;

if size(x,1) < size(x,2)
    x_column = x';
end

end

