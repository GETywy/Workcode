load Untitled3.mat Untitled

%�������
par = CroCodePar();
%��ʼ������
res = zeros(6000, par.moc_size*2)
%��ʼ������
mar = first();
matrix_one = mar.method1(Untitled);
matrix_two = mar.method2(Untitled);
%���Ӽ���
sec = second();
res = sec.Molecule(par,matrix_one,matrix_two,res);
%�Ա�
thr = third();
resp = thr.method(res,Untitled);
disp(resp)



