count = 0;

for i = 1:240
    if prop.Var1(i) > 0
        count = count + 1;
    end
end

modevalue = mode(prop.Var1);
averge = sum(prop.Var3) / sum(prop.Var1);