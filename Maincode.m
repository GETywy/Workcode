load Untitled3.mat Untitled;
global moc_num;
global PE;
global KE;
global buffer;
global moc_size;
moc_num = 10;
moc_size = 10;
global moc;
cross_rate = 0.5;
buffer = 0.0;
moc = zeros(moc_num, moc_size)
temp0 = zeros(1, moc_size)
res = zeros(6000, moc_size*2)
for i = 1:5093
    if Untitled(i, 8) == 1
        matrix_one(i, 1) = Untitled(i, 7);
    else
        matrix_two(i, 1) = Untitled(i, 7);
    end
end
matrix_one = unique(matrix_one)
matrix_two = unique(matrix_two)
for o = 1:95
    fym0 = zeros(50, 1)
    fym1 = zeros(50, moc_size*2)
    fym2 = zeros(1, moc_size*2)
    fym3 = zeros(1, moc_size*2)
    for i = 1:moc_num
        for j = 1:moc_size

            moc(i, 1:4) = matrix_one(randi(numel(matrix_one), 1, 4));
            moc(i, 5:10) = matrix_two(randi(numel(matrix_two), 1, 6));
        end
    end
    
    
    for a = 1:10
        if (rand < cross_rate) 
            if (rand < cross_rate+0.2)
                i = randperm(moc_num, 1);
                X1 = moc(i, :)
                N = X1
                PE1 = max(X1);
                for i = 1:(moc_size - 1)
                    b = randperm(moc_size, 1);
                    X1(b) = matrix_one(randi(numel(matrix_one), 1));
                end
                X2 = X1;
                PE2 = max(X2);

                if PE1 >= PE2
                    fym1(a, 1:moc_size) = N;
                else
                    fym1(a, 1:moc_size) = X2;
                end
                
            else
                
                i = randperm(moc_num, 1);
                X1 = moc(i, :)
                
                PE1 = max(X1);
                for i = 1:moc_size
                    if rem(i, 2) == 0
                        m = randperm(moc_size, 1);
                        n = randperm(moc_size, 1);
                        X2(i) = X1(1, m)
                        X3(i) = X1(1, n)
                    else
                        X2(i) = matrix_one(randi(numel(matrix_one), 1))
                        X3(i) = matrix_one(randi(numel(matrix_one), 1))
                    end
                end

                PE2 = max(X2);
                PE3 = max(X3);
                

                if PE1 >= PE2 + PE3
                    fym1(a, 1:moc_size) = X1;
                else
                    fym1(a, :) = [X2, X3];
                end
                %fprintf('2')
            end
        else
            if (rand < cross_rate+0.2)
                
                i = randperm(moc_num, 1);
                j = randperm(moc_num, 1);
                X1 = moc(i, :)
                X2 = moc(j, :)
                PE1 = max(X1);
                PE2 = max(X2);
                for i = 1:moc_size
                    if rem(i, 2) == 0
                        X3(i) = X1(1, randperm(moc_size, 1))
                    else
                        X3(i) = X2(1, randperm(moc_size, 1))
                    end
                end

                PE3 = max(X3);

                
                if PE1 + PE2 >= PE3
                    fym1(a, :) = [X1, X2];
                else
                    fym1(a, 1:moc_size) = X3;
                end
            else
                i = randperm(moc_num, 1);
                j = randperm(moc_num, 1);
                X1 = moc(i, :)
                X2 = moc(j, :)
                M = X1
                N = X2
                PE1 = max(X1);
                PE2 = max(X2);
                for i = 1:(moc_size - 1)
                    b = randperm(moc_size, 1);
                    X1(b) = matrix_one(randi(numel(matrix_one), 1));
                    c = randperm(moc_size, 1);
                    X2(c) = matrix_one(randi(numel(matrix_one), 1));
                end
                X3 = X1;
                PE3 = max(X2);
                
                X4 = X2;
                PE4 = max(X4);
                
                %fym1(a,:)=[X1,X2,X3,X4];
                if (PE1 + PE2) >= (PE4 + PE3)
                    fym1(a, :) = [M, N];
                else
                    fym1(a, :) = [X3, X4];
                end
                
                %fprintf('1')
            end
        end
        fym3(1, :) = fym1(a, :)
        %fym0(1,:)=fym3(1,:)
        if a == 1
            fym2(1, :) = fym3
        else
            if sum(fym3) >= sum(fym2)
                fym2(1, :) = fym3
            end
        end
    end
    
    res(o, :) = fym2;
  
end
%%
compare = unique(res);
for i = 1:length(compare)
    for j = 1:5093
        if compare(i, 1) == Untitled(j, 7)
            compare(i, 2) = Untitled(j, 8);
   
        end
    end
end
resp = sum(compare(:, 2))
