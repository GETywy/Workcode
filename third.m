classdef third
    methods(Static)
        function resp = method(res,obj)
            compare = unique(res);
            
            for i = 1:length(compare)
                for j = 1:size(obj,1)
                    if compare(i, 1) == obj(j, 7)
                        compare(i, 2) = obj(j, 8);
                    end
                end
            end
            resp = sum(compare(:, 2))
        end
    end
    
end
