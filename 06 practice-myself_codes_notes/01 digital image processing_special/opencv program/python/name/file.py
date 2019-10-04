import os
import shutil
filePath = 'C:\\E-DATA-GROUNP\\github\\04-others\\photos backup\\'
kk=0
for i,j,k in os.walk(filePath):
    for kk in range(len(k)):
        print(len(k))
        portion,ext= os.path.splitext(i)
        print(k[kk])
        oldname=k[kk]
      #  print(type(portion))
        cc=portion.strip(' C:\E-DATA-GROUNP\github\04-others\photos backup\'')
       # print('cc1:',cc)
        cc=cc.strip(' 04-others\photos backup\'')
        print('cc2:',cc)
        newname=cc+'-'+oldname
        print('oldname:',oldname)
        print('newname:',newname)
        print('i:',i)
        os.chdir(i)
        os.rename(oldname,newname)
       # os.rename(oldname,newname)
        # cc = portion.strip( '\')
       # print('./photos backup/'portion:',portion);
        print('ext:',ext)
        #shutil.move(newname, 'C:\E-DATA-GROUNP\github\04-others\photos backup')

