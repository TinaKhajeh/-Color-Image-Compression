function index = ZZindex(N)
index = zeros(N,2);
c = 0;
r = 2;
increment = 1;
for n = 1:N*N
  r = r - increment; c = c + increment;
  if (c > N)
    r = r + 2; c = N; increment = -1;
  elseif (r < 1)
    r = 1; increment = -1;
  elseif (r > N)
    c = c + 2; r = N; increment = 1;
  elseif (c < 1)
    c = 1; increment = 1;
  end
  index(n,:) = [r c];
end
end

