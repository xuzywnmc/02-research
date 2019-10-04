[LoD,HiD,LoR,HiR]=wfilters('db2')
LS=filt2ls(LoD,HiD,LoR,HiR);
displs(LS);
LSref=liftwave('db2');
displs(LSref);
