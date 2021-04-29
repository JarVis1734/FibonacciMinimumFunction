function fx = fibonn(x)
if x == 0
    fx = 1;
elseif x == 1
    fx = 1;
else
    a = 1;
    b = 1;
    for i = 2:x
        fx = a + b;
        a = b;
        b = fx;
    end
end
end
