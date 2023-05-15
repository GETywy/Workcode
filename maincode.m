load Untitled3.mat Untitled

%导入参数
par = CroCodePar();
%初始化参数
res = zeros(6000, par.moc_size*2)
%初始化矩阵
mar = first();
matrix_one = mar.method1(Untitled);
matrix_two = mar.method2(Untitled);
%分子计算
sec = second();
res = sec.Molecule(par,matrix_one,matrix_two,res);
%对比
thr = third();
resp = thr.method(res,Untitled);
disp(resp)



