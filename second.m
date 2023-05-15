classdef second
    methods(Static)
        function res = Molecule(par,matrix_one,matrix_two,res)
            for o = 1:par.loop
                fym1 = zeros(50, par.moc_size*2)
                fym2 = zeros(1, par.moc_size*2)
                fym3 = zeros(1, par.moc_size*2)
                moc = second.method1(par.moc_num,par.moc_size,matrix_one,matrix_two);
                
                for a = 1:par.iter
                    if (rand < par.cross_rate) 
                        if (rand < par.cross_rate+0.2)
                           fym1 = second.method_two(a,par.moc_num,par.moc_size,moc,matrix_one,fym1); 
                        else
                           fym1 = second.method_three(a,par.moc_num,par.moc_size,moc,matrix_one,fym1);
                        end
                    else
                        if (rand < par.cross_rate+0.2)
                           fym1 = second.method_four(a,par.moc_num,par.moc_size,moc,fym1);
                        else
                           fym1 = second.method_five(a,par.moc_num,par.moc_size,moc,matrix_one,fym1);
                        end
                    end
                    fym2 = second.method_six(fym1,fym2,fym3,a);
                end
                
                res(o, :) = fym2;
            end
        end
    end
    methods(Static)
        function moc = method1(moc_num,moc_size,matrix_one,matrix_two)
            for i = 1:moc_num
                for j = 1:moc_size
                    moc(i, 1:4) = matrix_one(randi(numel(matrix_one), 1, 4));
                    moc(i, 5:10) = matrix_two(randi(numel(matrix_two), 1, 6));
                end
            end
        end
        
        function fym1 = method_two(a,moc_num,moc_size,moc,matrix_one,fym1)
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
        end
        
        function fym1 = method_three(a,moc_num,moc_size,moc,matrix_one,fym1)
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
        end
        
        function fym1 = method_four(a,moc_num,moc_size,moc,fym1)
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
        end
        
        function fym1 = method_five(a,moc_num,moc_size,moc,matrix_one,fym1)
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
        end
        
        function fym2 = method_six(fym1,fym2,fym3,a)
            fym3(1, :) = fym1(a, :)
           
            if a == 1
                fym2(1, :) = fym3
            else
                if sum(fym3) >= sum(fym2)
                    fym2(1, :) = fym3
                end
            end
        end
        
    end
    
end
