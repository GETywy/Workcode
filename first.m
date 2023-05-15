classdef first
    methods(Static)
        function matrix_one = method1(obj) 
            row = size(obj,1)
            for i = 1:row
                if obj(i, 8) == 1
                    matrix_one(i, 1) = obj(i, 7);
                else
                    matrix_two(i, 1) = obj(i, 7);
                end
            end
            matrix_one = unique(matrix_one)
            matrix_two = unique(matrix_two)
        end
        function matrix_two = method2(obj)
            row = size(obj,1)
            for i = 1:row
                if obj(i, 8) == 1
                    matrix_one(i, 1) = obj(i, 7);
                else
                    matrix_two(i, 1) = obj(i, 7);
                end
            end
            matrix_one = unique(matrix_one)
            matrix_two = unique(matrix_two)
        end
    end
end
