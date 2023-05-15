load Untitled3.mat Untitled
par = CroCodePar();
res = zeros(6000, par.moc_size*2)
mar = first();
matrix_one = mar.method1(Untitled);
matrix_two = mar.method2(Untitled);
sec = second();
res = sec.Molecule(par,matrix_one,matrix_two,res);
thr = third();
resp = thr.method(res,Untitled);
disp(resp)



