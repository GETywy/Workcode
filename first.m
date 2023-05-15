classdef first
    methods(Static)
        function matrix_one = method1(obj)
            %METHOD1 此处显示有关此方法的摘要
            %   此处显示详细说明
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
            %METHOD1 此处显示有关此方法的摘要
            %   此处显示详细说明
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