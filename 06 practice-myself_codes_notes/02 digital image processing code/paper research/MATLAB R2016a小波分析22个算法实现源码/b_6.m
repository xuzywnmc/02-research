try
    i=1;
    s=1;
    while i<=100
        s=s*i;
        i=i+1;
    end
    disp('100�Ľ׳�Ϊ��');
    S        %S����Ϊ�������
catch
    disp('������ִ���')
    disp('');
    disp('����Ϊ��');
    lasterr
end
